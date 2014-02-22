//
//  iOS_Tests.m
//  iOS Tests
//
//  Created by Travis Jeffery on 2/21/14.
//
//

#import <XCTest/XCTest.h>
#import "TRVSQueryStringSerializer.h"

@interface iOS_Tests : XCTestCase

@end

@implementation iOS_Tests

- (void)testSimpleQueryString {
    NSDictionary *dictionary = @{ @"hello": @"world", @"name": @"travis" };

    XCTAssertEqualObjects(@"name=travis&hello=world", [TRVSQueryStringSerializer queryStringUsingDictionary:dictionary]);
}

- (void)testQueryStringWithEnumerableComponent {
    NSDictionary *dictionary = @{ @"hello": @"world", @"name": @[ @"travis", @"jeffery" ] };

    XCTAssertEqualObjects(@"name=travis&name=jeffery&hello=world", [TRVSQueryStringSerializer queryStringUsingDictionary:dictionary]);
}

@end
