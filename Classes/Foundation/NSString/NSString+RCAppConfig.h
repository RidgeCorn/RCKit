//
//  NSString+NSString_RCAppConfig.h
//  RCKit
//
//  Created by Looping on 14/8/21.
//  Copyright (c) 2014 RidgeCorn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NSString_RCAppConfig)

+ (NSString *)productDisplayName;
+ (NSString *)bundleIdentifier;
+ (NSString *)bundleVersion;
+ (NSString *)bundleName;
+ (NSString *)appScheme;
+ (NSString *)mainStoryboardFile;
+ (NSString *)sqliteStoreFilename;

+ (NSString *)shortBuildString;
+ (NSString *)versionString;
+ (NSString *)defaultCoordinateString;
+ (NSString *)coordinateType;
+ (NSString *)productIntroduction;
+ (NSString *)productCopyright;
+ (NSString *)contactNumber;
+ (NSString *)appID;

+ (NSString *)apiBaseURLString;
+ (NSString *)apiBaseHTTPURLString;
+ (NSString *)apiBaseHTTPSURLString;
+ (NSString *)cookieBaseURLString;
+ (NSString *)userAgent;

+ (NSString *)applicationTintColorString;
+ (NSString *)applicationBackgroundColorString;
+ (NSString *)applicationThemeKey;

@end
