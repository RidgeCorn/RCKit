//
//  NSString+RCString.m
//  RCKit
//
//  Created by Looping on 14/8/21.
//  Copyright (c) 2014 RidgeCorn. All rights reserved.
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
    NSString *retKey = @"__stringKey_(managedByRCHadot)_stringKey";
    XCTAssert([[key addKeyPrefixForString:key] isEqualToString:retKey], @"addKeyPrefixForString Pass");
    
    key = @"stringKey";
    retKey = @"____NSCFConstantString_(managedByRCHadot)_stringKey";
    XCTAssert([[key addKeyPrefixForClass:key.class] isEqualToString:retKey], @"addKeyPrefixForClass Pass");
}

@end
