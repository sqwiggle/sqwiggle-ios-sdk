//
//  Tests.m
//  Tests
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OHHTTPStubs/OHHTTPStubs.h>
#import <OHHTTPStubs/OHHTTPStubsResponse+JSON.h>
#import "Sqwiggle.h"
#import "ResponseFactory.h"
#define TEST_EMAIL @"cameron@sqwiggle.com"
#define TEST_PASSWORD @"HAHAHAHA"

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
    [Sqwiggle stopSqwiggling];
    [OHHTTPStubs removeAllStubs];
}

- (void)testAuth
{
    StartBlock();
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        return [request.URL.relativePath isEqualToString:@"/auth/token"];
    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
        return [[OHHTTPStubsResponse responseWithJSONObject:@{@"token": @"ROYGBIV"} statusCode:200 headers:nil]
                requestTime:1.0 responseTime:1.0];
    }];
    
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
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        return [request.URL.relativePath isEqualToString:@"/users/me"];
    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
        return [[OHHTTPStubsResponse responseWithJSONObject:[ResponseFactory fakeUserResponse] statusCode:200 headers:nil]
                requestTime:1.0 responseTime:1.0];
    }];
    waitingForBlock = YES;
    
    [Sqwiggle currentUserForSession:^(SQUser *user)
    {
                        EndBlock();
                        XCTAssertTrue(user.ID, @"Did succeed");
                  } failure:^(NSError *error) {
                        EndBlock();
                        XCTFail(@"Error returned for test %@", error);
    }];
    
    WaitUntilBlockCompletes();
}
-(void)testGetAllUsers
{
    [self testAuth];
    StartBlock();
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        return [request.URL.relativePath isEqualToString:@"/users"];
    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
        return [[OHHTTPStubsResponse responseWithJSONObject:[ResponseFactory fakeUsers] statusCode:200 headers:nil]
                requestTime:1.0 responseTime:1.0];
    }];
    waitingForBlock = YES;
    [Sqwiggle allUsers:^(NSArray *users)
     {
         EndBlock();
         XCTAssertTrue(users.count > 0, @"Did succeed");
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
    
    [Sqwiggle allRooms:^(id item) {
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
    
    [Sqwiggle streamItemsForRoomID:@1
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
