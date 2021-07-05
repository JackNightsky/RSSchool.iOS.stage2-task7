//
//  RSButton.m
//  rss.ios.stage2.task7
//
//  Created by Jack on 4.07.21.
//

#import "RSButton.h"
#import "ColorSet.h"

@implementation RSButton


-(void)reset {
    [self commonInit];
}

-(void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    if (highlighted) {
        self.layer.backgroundColor = [[UIColor rsLittleBoyBlue] colorWithAlphaComponent:0.2].CGColor;
        self.titleLabel.alpha = 0.4;
    } else {
        self.layer.backgroundColor = [[UIColor rsWhite] colorWithAlphaComponent:1].CGColor;
        self.titleLabel.alpha = 1;
    }
}

- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    if (!enabled) {
        self.alpha = 0.5;
    } else {
        self.alpha = 1;
    }
}

- (void) commonInit {
    self.userInteractionEnabled = YES;
    self.layer.borderWidth = 2;
    self.layer.borderColor = [UIColor rsLittleBoyBlue].CGColor;
    [UIColor blackColor];
    self.layer.cornerRadius = 10;
    
    [self setImage:[UIImage imageNamed:@"person2x"] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:@"person-fill2x"] forState:UIControlStateHighlighted];

                               
//    UIEdgeInsetsMake(<#CGFloat top#>, <#CGFloat left#>, <#CGFloat bottom#>, <#CGFloat right#>)
    [self setTitleEdgeInsets:UIEdgeInsetsMake(10, 25, 10, 20)];
    [self setImageEdgeInsets:UIEdgeInsetsMake(0, -5, 0, 0)];
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
