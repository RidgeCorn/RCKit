//
//  UIDevice+RCDevice.m
//  RCKit
//
//  Created by Looping on 14/8/21.
//  Copyright (c) 2014 RidgeCorn. All rights reserved.
//

#import "UIDevice+RCDevice.h"
#import <AudioToolbox/AudioToolbox.h>
#import "NSString+RCAppConfig.h"
#import <Reachability.h>

@implementation UIDevice (RCDevice)

+ (float)fullSystemVersion {
    return [[UIDevice currentDevice].systemVersion floatValue];
}

+ (NSString *)deviceUUIDString {
    NSString *result;
    
    if ([self fullSystemVersion] >= 6.0) {
        result = [UIDevice currentDevice].identifierForVendor.UUIDString;
    } else {
        CFUUIDRef puuid = CFUUIDCreate( nil );
        CFStringRef uuidString = CFUUIDCreateString( nil, puuid );
        result = CFBridgingRelease(CFStringCreateCopy( NULL, uuidString));
        
        CFRelease(puuid);
        CFRelease(uuidString);
    }
    
    return result;
}

+ (BOOL)callNumber:(NSString *)phoneNumber {
    BOOL called = NO;
    
    NSURL *phoneCallURL = [NSURL URLWithString:[NSString stringWithFormat:@"telprompt://%@", phoneNumber]];
    
    if([[UIApplication sharedApplication] canOpenURL: phoneCallURL]){
        [[UIApplication sharedApplication] openURL: phoneCallURL];
        called = YES;
    }
    
    return called;
}

+ (void)vibratePlay {
    AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
}

+ (void)playSystemSoundWithName:(NSString *)soundName SoundType:(NSString *)soundType {
    SystemSoundID theSoundID = kSystemSoundID_Vibrate;
    
    NSString *path = [[NSBundle bundleWithIdentifier:@"com.apple.UIKit"] pathForResource:soundName ofType:soundType];
    if (path) {
        OSStatus error =  AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:path], &theSoundID);
        if (error != kAudioServicesNoError) {
            NSLog(@"Failed to create sound ");
        }
    }
    
    AudioServicesPlaySystemSound(theSoundID);
}

+ (void)playCustomSoundWithName:(NSString *)soundName {
    SystemSoundID theSoundID = kSystemSoundID_Vibrate;
    
    NSURL *fileURL = [[NSBundle mainBundle] URLForResource:soundName withExtension:nil];
    if (fileURL != nil)
    {
        OSStatus error = AudioServicesCreateSystemSoundID((__bridge CFURLRef)fileURL, &theSoundID);
        if (error != kAudioServicesNoError){
            NSLog(@"Failed to create sound ");
        }
    }
    
    AudioServicesPlayAlertSound(theSoundID);
}

+ (BOOL)isNetworkAvailable {
    BOOL isNetworkAvailable = YES;
    if ([[Reachability reachabilityWithHostname:@"www.baidu.com"] currentReachabilityStatus] == NotReachable) {
        isNetworkAvailable = NO;
    }
    return isNetworkAvailable;
}

+ (BOOL)isServerAvailable {
    BOOL isServerAvailable = YES;
    if ([[Reachability reachabilityWithHostname:[NSString apiBaseHTTPURLString]] currentReachabilityStatus] == NotReachable) {
        isServerAvailable = NO;
    }
    return isServerAvailable;
}

+ (BOOL)IsUsingWiFi {
    return [[Reachability reachabilityForLocalWiFi] isReachableViaWiFi];
}

+ (BOOL)IsUsing3G {
    return [[Reachability reachabilityForInternetConnection] isReachableViaWWAN];
}

@end
