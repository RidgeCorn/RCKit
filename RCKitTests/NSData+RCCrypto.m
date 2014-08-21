//
//  NSData+RCCrypto.m
//  RCKit
//
//  Created by Looping on 14/8/21.
//  Copyright (c) 2014 RidgeCorn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NSData+RCCrypto.h"

@interface NSData_RCCrypto : XCTestCase

@end

@implementation NSData_RCCrypto

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDESCrypt {
    NSString *string = @"RidgeCorn";
    NSString *key = @"12345678";
    NSString *fKey = @"87654321";

    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    NSData *eData = [NSData DESEncrypt:data WithKey:key];
    XCTAssert([[NSData DESDecrypt:eData WithKey:key] isEqualToData:data], @"Pass");
    XCTAssert( ![[NSData DESDecrypt:eData WithKey:fKey] isEqualToData:data], @"Pass");
}


@end
