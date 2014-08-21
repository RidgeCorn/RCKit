//
//  NSBundle+NSBundle_RCBundle.m
//  RCKit
//
//  Created by Looping on 14/8/21.
//  Copyright (c) 2014 RidgeCorn. All rights reserved.
//

#import "NSBundle+RCBundle.h"

@implementation NSBundle (RCBundle)

+ (id)objectInMainBundlePListWithKey:(NSString *)key {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:key];
}

+ (id)objectInMainBundlePList:(NSString *)plist withKey:(NSString *)key {
    
    return [[NSBundle mainBundle] objectInPlist:plist withKey:key];
}

- (id)objectInPlist:(NSString *)plist withKey:(NSString *)key {
    NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfFile:[self pathForResource:plist ofType:@"plist"]];
    return [dictionary valueForKeyPath:key];
}

@end
