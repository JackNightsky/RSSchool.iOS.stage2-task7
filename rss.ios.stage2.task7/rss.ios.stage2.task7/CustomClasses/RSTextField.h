//
//  RSTextField.h
//  rss.ios.stage2.task7
//
//  Created by Jack on 3.07.21.
//

#import <UIKit/UIKit.h>
#import "ColorSet.h"

NS_ASSUME_NONNULL_BEGIN

@interface RSTextField : UITextField

@property (nonatomic, readonly) CurrentStatement currentState;

-(void)setCurrentState:(CurrentStatement)currentState;

-(void)reset;

@end

NS_ASSUME_NONNULL_END
