//
//  NSDictionary+RCDictionary.m
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
