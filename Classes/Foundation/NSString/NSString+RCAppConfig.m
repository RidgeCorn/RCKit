//
//  NSString+NSString_RCAppConfig.m
//  RCKit
//
//  Created by Looping on 14/8/21.
//  Copyright (c) 2014 RidgeCorn. All rights reserved.
//

#import "NSString+RCAppConfig.h"
#import "NSBundle+RCBundle.h"
#import "UIDevice+RCDevice.h"

static NSString *const kRCSqliteStoreFileName = @"RCSqliteStoreFileName";

static NSString *const kCFBundleVersion = @"CFBundleVersion";
static NSString *const kCFBundleShortVersionString = @"CFBundleShortVersionString";
static NSString *const kCFBundleDisplayName = @"CFBundleDisplayName";
static NSString *const kRCDefaultCoordinateString = @"RCDefaultCoordinateString";
static NSString *const kCFBundleURLSchemes = @"CFBundleURLSchemes";

static NSString *const kRCDefaultCoordinateType = @"RCDefaultCoordinateType";
static NSString *const kRCDefaultProductIntroduction = @"RCDefaultProductIntroduction";
static NSString *const kRCDefaultProductCopyright = @"RCDefaultProductCopyright";
static NSString *const kRCDefaultContactNumber = @"RCDefaultContactNumber";
static NSString *const kRCDefaultAppID = @"RCDefaultAppID";
static NSString *const kRCDefaultBundleName = @"RCDefaultBundleName";
static NSString *const kUIMainStoryboardFile = @"UIMainStoryboardFile";
static NSString *const kCFBundleURLTypes = @"CFBundleURLTypes";
static NSString *const kRCDefaultAPIBaseURL = @"RCDefaultAPIBaseURL";
static NSString *const kRCDefaultCookieBaseURL = @"RCDefaultCookieBaseURL";
static NSString *const kRCApplicationTintColor = @"RCApplicationTintColor";
static NSString *const kRCApplicationThemeKey = @"RCApplicationThemeKey";
static NSString *const kRCApplicationBackgroundColor = @"RCApplicationBackgroundColor";

@implementation NSString (NSString_RCAppConfig)

+ (NSString *)bundleIdentifier {
    return [[NSBundle mainBundle] bundleIdentifier];
}

+ (NSString *)sqliteStoreFilename {
    return [NSBundle objectInMainBundlePListWithKey:kRCSqliteStoreFileName];
}

+ (NSString *)productDisplayName {
    return [NSBundle objectInMainBundlePListWithKey:kCFBundleDisplayName];
}

+ (NSString *)defaultCoordinateString {
    return [NSBundle objectInMainBundlePListWithKey:kRCDefaultCoordinateString];
}

+ (NSString *)coordinateType {
    return [NSBundle objectInMainBundlePListWithKey:kRCDefaultCoordinateType];
}

+ (NSString *)productIntroduction {
    return [NSBundle objectInMainBundlePListWithKey:kRCDefaultProductIntroduction];
}

+ (NSString *)productCopyright {
    NSString*copyright = [NSBundle objectInMainBundlePListWithKey:kRCDefaultProductCopyright];
    NSArray *copyrights = [copyright componentsSeparatedByString:@"/"];
    copyright = @"";
    for (NSString *cr in copyrights) {
        copyright = [copyright stringByAppendingString:[cr stringByAppendingString:@"\n"]];
    }
    if([copyright length] > 1) {
        copyright = [copyright substringToIndex:[copyright length] - 1];
    }
    return copyright;
}

+ (NSString *)contactNumber {
    return [NSBundle objectInMainBundlePListWithKey:kRCDefaultContactNumber];
}

+ (NSString *)appID {
    return [NSBundle objectInMainBundlePListWithKey:kRCDefaultAppID];
}

+ (NSString *)bundleName {
    return [NSBundle objectInMainBundlePListWithKey:kRCDefaultBundleName];
}

+ (NSString *)mainStoryboardFile {
    return [NSBundle objectInMainBundlePListWithKey:kUIMainStoryboardFile];
}

+ (NSString *)appScheme {
    NSArray *URLTypes = [NSBundle objectInMainBundlePListWithKey:kCFBundleURLTypes];
    NSArray *appSchemeArray = [[URLTypes firstObject] valueForKey:kCFBundleURLSchemes];
    return [appSchemeArray firstObject];
}

+ (NSString *)apiBaseURLString {
    return [NSBundle objectInMainBundlePListWithKey:kRCDefaultAPIBaseURL];
}

+ (NSString *)apiBaseHTTPURLString {
    return  [@"http://" stringByAppendingString:[self apiBaseURLString]];
}

+ (NSString *)apiBaseHTTPSURLString {
    return  [@"https://" stringByAppendingString:[self apiBaseURLString]];
}

+ (NSString *)cookieBaseURLString {
    return [NSBundle objectInMainBundlePListWithKey:kRCDefaultCookieBaseURL];
}

+ (NSString *)userAgent {
    UIDevice *device = [UIDevice currentDevice];
    return [NSString stringWithFormat:@"%@/%@/%@/%@/%@/%@", [self bundleName], [self versionString], device.systemName, device.systemVersion, device.model, [UIDevice deviceUUIDString]];
}

+ (NSString *)bundleVersion {
    return [NSBundle objectInMainBundlePListWithKey:kCFBundleVersion];
}

+ (NSString *)shortBuildString {
    NSString *bundleVersion = [self bundleVersion];
    return [bundleVersion length] > 6 ? [bundleVersion substringToIndex:6] : ([bundleVersion isEqualToString:@""] ? @"123456" : bundleVersion);
}

+ (NSString *)versionString {
    return [NSBundle objectInMainBundlePListWithKey:kCFBundleShortVersionString];
}

+ (NSString *)applicationTintColorString {
    return [NSBundle objectInMainBundlePListWithKey:kRCApplicationTintColor];
}

+ (NSString *)applicationBackgroundColorString {
    return [NSBundle objectInMainBundlePListWithKey:kRCApplicationBackgroundColor];
}

+ (NSString *)applicationThemeKey {
    return [NSBundle objectInMainBundlePListWithKey:kRCApplicationThemeKey];
}

@end
