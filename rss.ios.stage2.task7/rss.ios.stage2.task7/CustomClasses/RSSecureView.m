//
//  RSStackView.m
//  rss.ios.stage2.task7
//
//  Created by Jack on 3.07.21.
//

#import "RSSecureView.h"
#import "ColorSet.h"

@interface RSSecureView ()

@end


@implementation RSSecureView


- (void)setCurrentState:(CurrentStatement)currentState {
    switch (currentState) {
        case ready:
            _currentState = ready;
            self.layer.borderWidth = 0;
            self.layer.borderColor = [UIColor rsBlackCoral].CGColor;
            break;
        case error:
            _currentState = error;
            self.layer.borderWidth = 2;
            self.layer.borderColor = [UIColor rsVenetianRed].CGColor;
            break;
        case success:
            _currentState = success;
            self.layer.borderWidth = 2;
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
    self.hidden = true;
    self.layer.cornerRadius = 10;
//    _currentState = defaultBorder;
    [self setCurrentState:ready];
    ///centering subviews
    self.subviews[0].center = CGPointMake(self.frame.size.width  / 2,
                                     self.frame.size.height / 2);
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
