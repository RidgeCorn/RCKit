//
//  UIView+RCView.h
//  RCHadot
//
//  Created by Looping on 14/6/24.
//  Copyright (c) 2014 RidgeCorn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (RCView)

- (UIViewController *) firstAvailableUIViewController;
- (void)removeAllSubviews;

@end