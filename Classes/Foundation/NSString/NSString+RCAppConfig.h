//
//  NSString+RCAppConfig.h
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
