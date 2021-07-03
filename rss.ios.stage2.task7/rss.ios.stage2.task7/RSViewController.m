//
//  RSViewController.m
//  rss.ios.stage2.task7
//
//  Created by Jack on 3.07.21.
//

#import "RSViewController.h"

@interface RSViewController ()

@end

@implementation RSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [UITextView appearance].linkTextAttributes = @{ NSForegroundColorAttributeName : UIColor.redColor };
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
