//
//  UIApplication+RCApplication.m
//  RCKit
//
//  Created by Looping on 14/8/21.
//  Copyright (c) 2014 RidgeCorn. All rights reserved.
//

#import "UIApplication+RCApplication.h"

@implementation UIApplication (RCApplication)

+ (void)beginNetworkTask {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}

+ (void)endNetworkTask {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

@end
