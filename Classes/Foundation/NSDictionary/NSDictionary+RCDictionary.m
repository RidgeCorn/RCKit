//
//  NSDictionary+RCDictionary.m
//  RCKit
//
//  Created by Looping on 14-4-16.
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

#import "NSDictionary+RCDictionary.h"
#import "RCLogger.h"

@implementation NSDictionary (RCDictionary)

- (id)valueForDotKeyPath:(NSString *)dotKeyPath {
    return [self valueForKeyPath:dotKeyPath separatedString:@"."];
}

- (id)valueForKeyPath:(NSString *)keyPath separatedString:(NSString *)separator {
    id value = nil;
    
    if (keyPath) {
        NSArray *keys = [keyPath componentsSeparatedByString:separator ?: @""];
        value = self;
        
        for (NSString *key in keys) {
            if ([key hasPrefix:@"@"]) {
                if ( !(value = [value objectAtIndex:[key integerValue]])) {
                    break;
                }
            } else {
                if ( !(value = [value valueForKeyPath:key])) {
                    break;
                }
            }
        }
    }

    return value;
}

- (id)filterWithMapping:(NSDictionary *)mapping {
    NSMutableDictionary *params = [@{} mutableCopy];
    NSArray *allFilterKeys = [mapping allKeys];
    for (NSString *filterKey in allFilterKeys) {
        if ( ![self valueForKey:filterKey]) {
            RCLog(@"NO Request Key Found (%@)", filterKey);
        } else {
            [params setValue:[self valueForKey:filterKey] forKey:[mapping valueForKey:filterKey]];
        }
    }
    
    return params;
}

@end
