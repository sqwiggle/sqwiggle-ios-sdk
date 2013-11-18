//
//  Tests.m
//  Tests
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Sqwiggle.h"

@interface Tests : XCTestCase

@end

@implementation Tests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGetUser
{
    StartBlock();
    [Sqwiggle retreiveItemOfType:SQWIGGLE_USER_TYPE byID:nil success:^(id item) {
        EndBlock();
        XCTAssertTrue(YES, @"Did succeed");
    } failure:^(NSError *error) {
        EndBlock();
        XCTFail(@"Error returned for test %@", error);
    }];
    
    WaitUntilBlockCompletes();
}

@end
