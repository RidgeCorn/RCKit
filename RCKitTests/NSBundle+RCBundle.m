//
//  NSBundle+RCBundle.m
//  RCKit
//
//  Created by Looping on 14/8/21.
//  Copyright (c) 2014 RidgeCorn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NSBundle+RCBundle.h"
#import "RCLogger.h"

@interface NSBundle_RCBundle : XCTestCase

@end

@implementation NSBundle_RCBundle

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testObjectInBundle {
    NSString *value = @"RCTestsValue";
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    
    XCTAssert([[bundle objectInPlist:@"RCBundleTests" withKey:@"RCTestsKey"] isEqualToString:value], @"Pass");
    
    XCTAssert([[bundle objectInPlist:@"RCKitTests-Info" withKey:@"RCTestsKey"] isEqualToString:value], @"Pass");
}

@end
