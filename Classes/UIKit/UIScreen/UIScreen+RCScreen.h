//
//  UIScreen+RCScreen.h
//  RCKit
//
//  Created by Looping on 14/8/21.
//  Copyright (c) 2014 RidgeCorn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScreen (RCScreen)

+ (BOOL)is4InchDevice;
+ (BOOL)isLargerDevice;
+ (float)fullScreenHeight;
+ (float)fullScreenWidth;
+ (CGPoint)screenCenter;

@end
