//
//  UIColor+RCColor.m
//  RCKit
//
//  Created by Looping on 14-4-10.
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

#import "UIColor+RCColor.h"
#import "NSString+RCAppConfig.h"

@implementation UIColor (RCColor)

+ (NSString *)checkHexString:(NSString *)string {
    NSString *rString = [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([rString length] < 6) {
        rString = @"FFFFFF";
    }
    
    if ([rString hasPrefix:@"0X"])
        rString = [rString substringFromIndex:2];
    if ([rString hasPrefix:@"#"])
        rString = [rString substringFromIndex:1];
    if ([rString length] != 6)
        rString = @"FFFFFF";
    
    return rString;
}

+ (float)redValueInHexString:(NSString *)cString {
    unsigned int r;
    
    [[NSScanner scannerWithString:[cString substringWithRange:NSMakeRange(0, 2)]] scanHexInt:&r];

    return ((float) r / 255.0f);
}

+ (float)greenValueInHexString:(NSString *)cString {
    unsigned int g;
    
    [[NSScanner scannerWithString:[cString substringWithRange:NSMakeRange(2, 2)]] scanHexInt:&g];
    
    return ((float) g / 255.0f);
}

+ (float)blueValueInHexString:(NSString *)cString {
    unsigned int b;
    
    [[NSScanner scannerWithString:[cString substringWithRange:NSMakeRange(4, 2)]] scanHexInt:&b];
    
    return ((float) b / 255.0f);
}

+ (UIColor *)colorWithHexString:(NSString *)colorString alpha:(CGFloat)alpha {
    NSString *cString = [self checkHexString:colorString];
    
    return [UIColor colorWithRed:[self redValueInHexString:cString] green:[self greenValueInHexString:cString] blue:[self blueValueInHexString:cString] alpha:alpha];
}

+ (UIColor *)colorWithHexString:(NSString *)colorString {
    return [self colorWithHexString:colorString alpha:1.f];
}

+ (UIColor *)tableViewBackgroundColorOfiOS7 {
    return [UIColor colorWithRed:239 / 255.0 green:239 / 255.0 blue:244 / 255.0 alpha:1];
}

+ (UIColor *)applicationTintColor {
    return [UIColor colorWithHexString:[NSString applicationTintColorString]];
}

+ (UIColor *)applicationBackgroundColor {
    return [UIColor colorWithHexString:[NSString applicationBackgroundColorString]];
}

@end
