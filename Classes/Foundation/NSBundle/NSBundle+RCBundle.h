//
//  NSBundle+NSBundle_RCBundle.h
//  RCKit
//
//  Created by Looping on 14/8/21.
//  Copyright (c) 2014 RidgeCorn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (RCBundle)

+ (id)objectInMainBundlePListWithKey:(NSString *)key;

+ (id)objectInMainBundlePList:(NSString *)plist withKey:(NSString *)key;

- (id)objectInPlist:(NSString *)plist withKey:(NSString *)key;

@end
