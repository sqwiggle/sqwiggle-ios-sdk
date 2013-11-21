//
//  Tests.m
//  Tests
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Sqwiggle.h"
#define TEST_EMAIL @"cameron@sqwiggle.com"
#define TEST_PASSWORD @"password"

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
    [Sqwiggle stopSqwiggling];
    [super tearDown];
}

- (void)testAuth
{
    StartBlock();
    [Sqwiggle startSqwigglingWithUsername:TEST_EMAIL password:TEST_PASSWORD success:^(BOOL signedIn) {
        EndBlock();
    } failure:^(NSError *error) {
        EndBlock();
        XCTFail(@"Error returned for test %@", error);
    }];
    
    WaitUntilBlockCompletes();
}

-(void) testGetCurrentUser
{
    [self testAuth];
    StartBlock();
    waitingForBlock = YES;
    
    [Sqwiggle getUserWithID:nil
                    success:^(SQUser *user) {
                        NSLog(@"%@", user);
                        EndBlock();
                        XCTAssertTrue(YES, @"Did succeed");
                  } failure:^(NSError *error) {
                        EndBlock();
                        XCTFail(@"Error returned for test %@", error);
    }];
    
    WaitUntilBlockCompletes();
}
-(void)testGetRooms
{
    [self testAuth];
    StartBlock();
    waitingForBlock = YES;
    
    [Sqwiggle getAllRooms:^(id item) {
        EndBlock();
        XCTAssertTrue(YES, @"Did succeed");
    } failure:^(NSError *error) {
        EndBlock();
        XCTFail(@"Error returned for test %@", error);
    }];
    
    WaitUntilBlockCompletes();
}

- (void)testGetStreamItems
{
    [self testAuth];
    
    StartBlock();
    waitingForBlock = YES;
    
    [Sqwiggle getStreamItemsForRoomID:@1
                                   success:^(NSArray *items) {
                                       EndBlock();
                                       XCTAssertTrue(YES, @"Did succeed");
                                   } failure:^(NSError *error) {
                                       EndBlock();
                                    XCTFail(@"Error returned for test %@", error);
                                   }];
    
    WaitUntilBlockCompletes();
}

@end
