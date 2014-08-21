//
//  UIScreen+RCScreen.m
//  RCKit
//
//  Created by Looping on 14/8/21.
//  Copyright (c) 2014 RidgeCorn. All rights reserved.
//

#import "UIScreen+RCScreen.h"

@implementation UIScreen (RCScreen)

+ (BOOL)is4InchDevice {
    return [self fullScreenHeight] == 568 && [self fullScreenWidth] == 320;
}

+ (BOOL)isLargerDevice {
    return [self fullScreenHeight] > 568 || [self fullScreenWidth] > 320;
}

+ (float)fullScreenHeight {
    return [[UIScreen mainScreen] bounds].size.height;
}

+ (float)fullScreenWidth {
    return [[UIScreen mainScreen] bounds].size.width;
}

+ (CGPoint)screenCenter {
    return CGPointMake([self fullScreenWidth] / 2, [self fullScreenHeight] / 2);
}

@end
