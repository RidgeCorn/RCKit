//
//  NSObject+RCVerify.h
//  RCKit
//
//  Created by Looping on 14/8/21.
//  Copyright (c) 2014 RidgeCorn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (RCVerify)

+ (BOOL)isDataNil:(id)data;
+ (BOOL)isFloatZero:(CGFloat)floatValue;
+ (BOOL)isDataZero:(id)data;
+ (id)safeData:(id)data;

@end
