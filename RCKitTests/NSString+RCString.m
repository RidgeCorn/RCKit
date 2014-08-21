//
//  NSString+RCString.m
//  RCKit
//
//  Created by Looping on 14/8/21.
//  Copyright (c) 2014 RidgeCorn. All rights reserved.
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
    NSString *aString = @"RCHadot";
    NSString *sString = @".";
    NSString *retString = @"test.RCHadot";
    
    XCTAssert([[string stringByAppendingString:aString withSeparator:sString] isEqualToString:retString], @"stringByAppendingString:withSeparator:");
    
    sString = @"";
    retString = @"testRCHadot";
    
    XCTAssert([[string stringByAppendingString:aString withSeparator:sString] isEqualToString:retString], @"stringByAppendingString:withSeparator:");
    
    sString = nil;
    
    XCTAssert([[string stringByAppendingString:aString withSeparator:sString] isEqualToString:retString], @"stringByAppendingString:withSeparator:");
    
    aString = nil;
    sString = @".";
    retString = @"test";
    
    XCTAssert([[string stringByAppendingString:aString withSeparator:sString] isEqualToString:retString], @"stringByAppendingString:withSeparator:");
}


@end
