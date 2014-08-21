//
//  NSObject+RCVerify.m
//  RCKit
//
//  Created by Looping on 14/8/21.
//  Copyright (c) 2014 RidgeCorn. All rights reserved.
//

#import "NSObject+RCVerify.h"

@implementation NSObject (RCVerify)

+ (BOOL)isDataNil:(id)data {
    return (data == nil || [data isKindOfClass:[NSNull class]]);
}

+ (BOOL)isFloatZero:(CGFloat)floatValue {
    return (fabs(floatValue) < FLT_EPSILON);
}

+ (BOOL)isDataZero:(id)data {
    BOOL isZero = NO;
    
    if ([self isDataNil:data]) {
        isZero = YES;
    } else {
        CGFloat value = 0;
        
        if ([data isKindOfClass:[NSString class]] || [data isKindOfClass:[NSNumber class]]) {
            value = [data floatValue];
        }
        
        isZero = [self isFloatZero:value];
    }
    return isZero;
}

+ (id)safeData:(id)data {
    return [self isDataNil:data] ? @"" : data;
}

@end
