//
//  RSNumButton.m
//  rss.ios.stage2.task7
//
//  Created by Jack on 4.07.21.
//

#import "RSNumButton.h"
#import "ColorSet.h"

@implementation RSNumButton

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];

    if (highlighted) {
        self.backgroundColor = [[UIColor rsLittleBoyBlue] colorWithAlphaComponent:0.2];
    } else {
        self.backgroundColor = [UIColor rsWhite];
    }
}

-(void)reset {
    [self commonInit];
}

- (void) commonInit {
    self.userInteractionEnabled = YES;
    // BORDER settings
    self.layer.borderWidth = 1.5;
    self.layer.borderColor = [UIColor rsLittleBoyBlue].CGColor;
    self.layer.cornerRadius = self.layer.bounds.size.height/2;
    
    // TITLE settings
    [self setTitleColor: [UIColor rsLittleBoyBlue] forState: UIControlStateNormal];
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
