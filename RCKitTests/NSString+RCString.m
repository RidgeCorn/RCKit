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
#import "NSString+RCString.h"

@interface NSString_RCString : XCTestCase

@end

@implementation NSString_RCString

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testMD5HexDigest {
    NSString *RidgeCorn = @"RidgeCorn";
    NSString *retString = @"9f5b1796c4d2ff3e05da892799edc42e";
    
    XCTAssert([[RidgeCorn md5HexDigest] isEqualToString:retString], @"md5HexDigest Pass");
}

- (void)testHashString {
    NSString *RidgeCorn = @"RidgeCorn";
    
    XCTAssert([RidgeCorn hashString], @"hashString Pass");
}

- (void)testTrimmingString {
    NSString *RidgeCorn = @" RidgeCorn  ";
    NSString *retString = @"RidgeCorn";
    
    XCTAssert([[RidgeCorn stringByTrimmingWhitespace] isEqualToString:retString], @"stringByTrimmingWhitespace Pass");
    
    RidgeCorn = @" RidgeCorn  \n\n ";
    XCTAssert([[RidgeCorn stringByTrimmingWhitespaceAndNewline] isEqualToString:retString], @"stringByTrimmingWhitespaceAndNewline Pass");
}

- (void)testAppendingString {
    NSString *string = @"test";
    NSString *aString = @"RCKit";
    NSString *sString = @".";
    NSString *retString = @"test.RCKit";
    
    XCTAssert([[string stringByAppendingString:aString withSeparator:sString] isEqualToString:retString], @"stringByAppendingString:withSeparator:");
    
    sString = @"";
    retString = @"testRCKit";
    
    XCTAssert([[string stringByAppendingString:aString withSeparator:sString] isEqualToString:retString], @"stringByAppendingString:withSeparator:");
    
    sString = nil;
    
    XCTAssert([[string stringByAppendingString:aString withSeparator:sString] isEqualToString:retString], @"stringByAppendingString:withSeparator:");
    
    aString = nil;
    sString = @".";
    retString = @"test";
    
    XCTAssert([[string stringByAppendingString:aString withSeparator:sString] isEqualToString:retString], @"stringByAppendingString:withSeparator:");
}


@end
