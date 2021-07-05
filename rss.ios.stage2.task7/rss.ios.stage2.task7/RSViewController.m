//
//  RSViewController.m
//  rss.ios.stage2.task7
//
//  Created by Jack on 3.07.21.
//

#import "RSViewController.h"
#import "RSTextField.h"
#import "RSSecureView.h"
#import "RSButton.h"
#import "RSNumButton.h"
#import "ColorSet.h"

@interface RSViewController ()
@property (weak, nonatomic) IBOutlet UILabel *rsschool;
@property (weak, nonatomic) IBOutlet RSTextField *usernameTextField;
@property (weak, nonatomic) IBOutlet RSTextField *passwordTextField;
@property (weak, nonatomic) IBOutlet RSButton *authorizeButton;

// Security code VStack
@property (weak, nonatomic) IBOutlet RSSecureView *securityView;
@property (weak, nonatomic) IBOutlet UILabel *securityResult;
@property (weak, nonatomic) IBOutlet UIButton *securityButton1;
@property (weak, nonatomic) IBOutlet UIButton *securityButton2;
@property (weak, nonatomic) IBOutlet UIButton *securityButton3;

@end


// MARK: - Keyboard category
@interface RSViewController (KeyboardHandling)
- (void)subscribeOnKeyboardEvents;
- (void)updateTopContraintWith:(CGFloat) constant andBottom:(CGFloat) bottomConstant;
- (void)hideWhenTappedAround;
@end

@implementation RSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // MARK: - app state in start moment
    
    /// Subscrube on keyboard events
    [self subscribeOnKeyboardEvents];
    [self hideWhenTappedAround];
    
    /// Set delegates
     self.usernameTextField.delegate = self;
    self.passwordTextField.delegate = self;
    
    /// click authorize button
    [self.authorizeButton addTarget:self
                         action:@selector(authorizeButtonTapped:)
                   forControlEvents:UIControlEventTouchUpInside];

} //viewDidLoad


// MARK: - CLEAR text field
- (void)textFieldDidBeginEditing:(RSTextField *)textField{
    if (textField.currentState == error) {
        textField.text=@"";
        textField.currentState = ready;
    }
}

- (BOOL)textField:(RSTextField *)textField
shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string {
    if ([textField isEqual:self.usernameTextField]) {
        if ([string rangeOfCharacterFromSet:NSCharacterSet.letterCharacterSet.invertedSet].length) {
            return false;
        } else {
            return true;
        }
    }
    // another textFields
    return true;
}

// MARK: - AUTHORIZE
- (void)authorizeButtonTapped:(UIButton *)sender {
    NSString * user = self.usernameTextField.text;
    NSString * password = self.passwordTextField.text;
    
    if ([user isEqual:@"username"]) {
        [self.usernameTextField setCurrentState:success];
    } else {
        [self.usernameTextField setCurrentState:error];
    }
    
    if ([password isEqual:@"password"]) {
        [self.passwordTextField setCurrentState:success];
    } else {
        [self.passwordTextField setCurrentState:error];
    }
    
    // both cases is correct
    if ([user isEqual:@"username"] && [password isEqual:@"password"]) {
        /// TODO: change visual textFields
        self.authorizeButton.userInteractionEnabled = NO;
        self.usernameTextField.userInteractionEnabled = NO;
        self.passwordTextField.userInteractionEnabled = NO;
        
        [self.usernameTextField setCurrentState:success];
        [self.passwordTextField setCurrentState:success];
        /// do visible hidden securityStack
        _securityView.hidden = false;
        
    }
    
    
    [self.view endEditing:true];
}


// TextField what happen after tap to return key
- (BOOL)textFieldShouldReturn:(RSTextField *)textField {
    
    if (textField == _usernameTextField) {
        return [self.passwordTextField becomeFirstResponder];
    }
    
    return [self.view endEditing:true];
}



- (IBAction)inputCodeSecure:(id)sender {
    if ([_securityResult.text isEqual:@"_"]) {
        _securityResult.text = [NSString stringWithFormat:@"%ld ", (long)[sender tag] ];
        [self.securityView setCurrentState:ready];
    } else if (_securityResult.text.length < 5) {
        _securityResult.text = [NSString stringWithFormat:@"%@%ld ", _securityResult.text, (long)[sender tag] ];
    }
    
    if (_securityResult.text.length == 6) {
        if ([_securityResult.text isEqual:@"1 3 2 "]) {
            [self.securityView setCurrentState:success];
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Welcome"
                                                                           message:@"You are successfuly authorized!\n\n"
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *refreshAction = [UIAlertAction actionWithTitle:@"Refresh"
                                                                    style:UIAlertActionStyleDestructive
                                                                  handler:^(UIAlertAction * action){
                //refresh action
                ///all view set default
                [self.usernameTextField reset];
                [self.passwordTextField reset];
                [self.authorizeButton reset];
                [self.securityView reset];
                self.securityResult.text = @"_";
            }];
            [alert addAction:refreshAction];
            [self presentViewController:alert animated:YES completion:nil];
        } else {
            _securityResult.text = @"_";
            [_securityView setCurrentState:error];
            ///  show error - red border
        }
    }
    
}

@end

// MARK: - Keyboard category

@implementation RSViewController (KeyboardHandling)

- (void)subscribeOnKeyboardEvents {
    // Keyboard will show
    [NSNotificationCenter.defaultCenter addObserver:self
                                           selector:@selector(keybaordWillShow:)
                                               name:UIKeyboardWillShowNotification
                                             object:nil];
    // Keyboard will hide
    [NSNotificationCenter.defaultCenter addObserver:self
                                           selector:@selector(keybordWillHide:)
                                               name:UIKeyboardWillHideNotification
                                             object:nil];
}

- (void)hideWhenTappedAround {
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                               action:@selector(hide)];
    [self.view addGestureRecognizer:gesture];
}

- (void)hide {
    [self.view endEditing:true];
}

- (void)keybaordWillShow:(NSNotification *)notification {
    CGRect rect = [(NSValue *)notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];

    [self updateTopContraintWith:15.0 andBottom:rect.size.height - self.view.safeAreaInsets.bottom + 15.0];
}

- (void)keybordWillHide:(NSNotification *)notification {
    [self updateTopContraintWith:200.0 andBottom:0.0];
}

- (void)updateTopContraintWith:(CGFloat) constant andBottom:(CGFloat) bottomConstant {
    // Change your constraint constants
//    self.topContraint.constant = constant;
//    self.bottomContraint.constant = bottomConstant;
    [UIView animateWithDuration:0.2 animations:^{
        [self.view layoutIfNeeded];
    }];
}

@end
