//
//  UIDevice+RCDevice.m
//  RCKit
//
//  Created by Looping on 14/8/21.
//
//  The MIT License (MIT)
//  Copyright (c) 2014 Ridgecorn (http://ridgecorn.com/ )
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
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
