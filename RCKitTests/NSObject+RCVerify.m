//
//  NSObject+RCVerify.m
//  RCKit
//
//  Created by Looping on 14/8/21.
//  Copyright (c) 2014 RidgeCorn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NSObject+RCVerify.h"

@interface NSObject_RCVerify : XCTestCase

@end

@implementation NSObject_RCVerify

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testObjectVerify {
    NSString *string = nil;
    XCTAssert([NSObject isDataNil:string], @"Pass");
    string = @"";
    XCTAssert( ![NSObject isDataNil:string], @"Pass");
    string = nil;
    XCTAssert([NSObject safeData:string], @"Pass");
    XCTAssert([NSObject isDataZero:string], @"Pass");
    XCTAssert([NSObject isDataZero:[NSObject safeData:string]], @"Pass");

    CGFloat f = 0;
    XCTAssert([NSObject isFloatZero:f], @"Pass");
    f = 1;
    XCTAssert( ![NSObject isFloatZero:f], @"Pass");
    f = -1;
    XCTAssert( ![NSObject isFloatZero:f], @"Pass");
    f = 0.00001;
    XCTAssert( ![NSObject isFloatZero:f], @"Pass");
    f = -0.00001;
    XCTAssert( ![NSObject isFloatZero:f], @"Pass");
    f = 0.0000001;
    XCTAssert([NSObject isFloatZero:f], @"Pass");
}


@end
