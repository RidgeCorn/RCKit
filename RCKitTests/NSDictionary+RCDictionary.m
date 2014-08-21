//
//  NSDictionary+RCDictionary.m
//  RCKit
//
//  Created by Looping on 14/8/21.
//  Copyright (c) 2014 RidgeCorn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NSDictionary+RCDictionary.h"

@interface NSDictionary_RCDictionary : XCTestCase

@end

@implementation NSDictionary_RCDictionary

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testValueForDotKeyPath {
    NSString *name = @"looping";
    NSDictionary *dict = @{
                           @"app": @{
                                   @"models": @{
                                           @"user": @{
                                                   @"name": name
                                                   }
                                           }
                                   }
                           };
    XCTAssert([[dict valueForDotKeyPath:@"app.models.user.name"] isEqualToString:name], @"valueForDotKeyPath Pass");
}

- (void)testValueForKeyPath {
    NSString *name = @"looping";
    NSDictionary *dict = @{
                           @"app": @{
                                   @"models": @{
                                           @"user": @{
                                                   @"name": name
                                                   }
                                           }
                                   }
                           };
    
    XCTAssert([dict valueForKeyPath:@"app.models.user.name" separatedString:@"."], @"valueForKeyPath: separatedString: Pass");
    
    UILabel *userNameLabel = [UILabel new];
    userNameLabel.text = name;
    
    dict = @{
             @"app.views": @{
                     @"loginView": @{
                             @"userNameLabel": userNameLabel
                             }
                     }
             };
    XCTAssert([[dict valueForKeyPath:@"app.views/loginView/userNameLabel.text" separatedString:@"/"] isEqualToString:name], @"valueForKeyPath: separatedString: Pass");
}

- (void)testFilterWithMapping {
    NSDictionary *dict = @{
                           @"userName": @"looping",
                           @"userPassword": @"123456",
                           @"foo": @"bar",
                           @"bar": @"baz"
                           };
    
    NSDictionary *mapping = @{
                              @"userName": @"name",
                              @"userPassword": @"pwd"
                              };
    
    NSDictionary *ans = @{
                          @"name": @"looping",
                          @"pwd": @"123456"
                          };
    
    XCTAssert([[dict filterWithMapping:mapping] isEqualToDictionary:ans], @"filterWithMapping Pass");
}

@end
