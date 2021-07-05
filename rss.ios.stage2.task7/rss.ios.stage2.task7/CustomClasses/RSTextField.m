//
//  RSTextField.m
//  rss.ios.stage2.task7
//
//  Created by Jack on 3.07.21.
//

#import "RSTextField.h"
#import "ColorSet.h"

@implementation RSTextField

- (void)setCurrentState:(CurrentStatement)currentState {
    switch (currentState) {
        case ready:
            _currentState = ready;
            self.layer.borderColor = [UIColor rsBlackCoral].CGColor;
            break;
        case error:
            _currentState = error;
            self.layer.borderColor = [UIColor rsVenetianRed].CGColor;
            break;
        case success:
            _currentState = success;
            self.layer.borderColor = [UIColor rsTurquoiseGreen].CGColor;
            break;
        default:
            break;
    }
}

-(void)reset {
    [self commonInit];
}

- (void) commonInit {
    [self setCurrentState:ready];
    self.userInteractionEnabled = YES;
    self.layer.borderWidth = 1.5;
    self.layer.borderColor = [UIColor rsBlackCoral].CGColor;
    self.layer.cornerRadius = 5;
    self.text = @"";
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
 }

 - (id)initWithCoder:(NSCoder *)aDecoder {
     self = [super initWithCoder:aDecoder];
     if (self) {
        [self commonInit];
     }
     return self;
 }

@end
