//
//  UIDevice+RCDevice.h
//  RCKit
//
//  Created by Looping on 14/8/21.
//  Copyright (c) 2014 RidgeCorn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (RCDevice)

+ (float)fullSystemVersion;

+ (NSString *)deviceUUIDString;

+ (BOOL)callNumber:(NSString *)phoneNumber;

+ (void)playSystemSoundWithName:(NSString *)soundName SoundType:(NSString *)soundType;
+ (void)playCustomSoundWithName:(NSString *)soundName;

+ (void)vibratePlay;

+ (BOOL)isNetworkAvailable;

+ (BOOL)isServerAvailable;

+ (BOOL)IsUsingWiFi;

+ (BOOL)IsUsing3G;

@end
