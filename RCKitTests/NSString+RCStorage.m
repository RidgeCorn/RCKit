//
//  NSString+RCString.m
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

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NSString+RCStorage.h"

@interface NSString_RCStorage : XCTestCase

@end

@implementation NSString_RCStorage

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testConvertString {
    NSString *string = @"you_1_are_2_so_3_cute_4";
    NSString *retString = @"you1Are2So3Cute4";
    NSString *theNewString = [string convertFromUnderscoreCaseToCamelCase];
    
    XCTAssert([theNewString isEqualToString:retString], @"convertFromUnderscoreCaseToCamelCase Pass");
    
    string = @"you1Are2So3Cute4";
    retString = @"you_1_are_2_so_3_cute_4";
    theNewString = [string convertFromCamelCaseToUnderscoreCase];
    
    XCTAssert([theNewString isEqualToString:retString], @"convertFromCamelCaseToUnderscoreCase Pass");
}

- (void)testPrefixString {
    NSString *key = @"stringKey";
    NSString *retKey = @"__stringKey_(managedByRCKit)_stringKey";
    XCTAssert([[key addKeyPrefixForString:key] isEqualToString:retKey], @"addKeyPrefixForString Pass");
    
    key = @"stringKey";
    retKey = @"____NSCFConstantString_(managedByRCKit)_stringKey";
    XCTAssert([[key addKeyPrefixForClass:key.class] isEqualToString:retKey], @"addKeyPrefixForClass Pass");
}

@end
