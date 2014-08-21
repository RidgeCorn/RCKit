//
//  NSString+RCString.m
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

#import <CommonCrypto/CommonDigest.h>
#import "NSString+RCString.h"

@implementation NSString (RCString)

- (NSString *)md5HexDigest {
    const char *original_str = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(original_str, (unsigned int)strlen(original_str), result);
    NSMutableString *md5String = [NSMutableString string];
    
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [md5String appendFormat:@"%02X", result[i]];
    }
    
    return [md5String lowercaseString];
}

- (NSString *)hashString {
    return [[self stringByAppendingFormat:@"%f", [NSDate timeIntervalSinceReferenceDate]] md5HexDigest];
}

- (NSString *)stringByTrimmingWhitespace {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (NSString *)stringByTrimmingWhitespaceAndNewline {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet ]];
}

- (NSString *)stringByAppendingString:(NSString *)aString withSeparator:(NSString *)sString {
    return (aString && [aString length]) ? [self stringByAppendingFormat:@"%@%@", sString ?: @"", aString] : self;
}

@end
