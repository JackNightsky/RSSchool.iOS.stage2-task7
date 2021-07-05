//
//  ColorSet.h
//  rss.ios.stage2.task7
//
//  Created by Jack on 4.07.21.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

NS_ASSUME_NONNULL_BEGIN

@interface ColorSet : NSObject
typedef NS_ENUM(NSInteger, CurrentStatement) {
    ready,
    error,
    success
};
@end

@interface UIColor (CustomColors)

+(UIColor * _Nullable) rsBlack;
+(UIColor * _Nullable) rsBlackCoral;
+(UIColor * _Nullable) rsTurquoiseGreen;
+(UIColor * _Nullable) rsVenetianRed;
+(UIColor * _Nullable) rsLittleBoyBlue;
+(UIColor * _Nullable) rsWhite;

@end // color set interface

NS_ASSUME_NONNULL_END
