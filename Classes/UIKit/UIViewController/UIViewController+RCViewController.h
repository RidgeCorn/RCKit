//
//  UIViewController+RCViewController.h
//  RCKit
//
//  Created by Looping on 14/8/21.
//  Copyright (c) 2014 RidgeCorn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (RCViewController)

+ (UIViewController *)topViewController;

+ (UIViewController *)topViewController:(UIViewController *)rootViewController;

@end
