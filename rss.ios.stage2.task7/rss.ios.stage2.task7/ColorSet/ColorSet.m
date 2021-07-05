//
//  ColorSet.m
//  rss.ios.stage2.task7
//
//  Created by Jack on 4.07.21.
//

#import "ColorSet.h"


@implementation ColorSet

@end

@implementation UIColor (CustomColors)
+(UIColor * _Nullable) rsBlack          { return [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0]; }
+(UIColor * _Nullable) rsBlackCoral     { return [UIColor colorWithRed:0.298 green:0.361 blue:0.408 alpha:1.0]; }
+(UIColor * _Nullable) rsTurquoiseGreen { return [UIColor colorWithRed:0.569 green:0.780 blue:0.694 alpha:1.0]; }
+(UIColor * _Nullable) rsVenetianRed    { return [UIColor colorWithRed:0.761 green:0.004 blue:0.078 alpha:1.0]; }
+(UIColor * _Nullable) rsLittleBoyBlue  { return [UIColor colorWithRed:0.502 green:0.643 blue:0.929 alpha:1.0]; }
+(UIColor * _Nullable) rsWhite          { return [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0]; }

@end // color set implementation
