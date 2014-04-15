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
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        return [request.URL.relativePath isEqualToString:@"/rooms"];
    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
        return [[OHHTTPStubsResponse responseWithJSONObject:[ResponseFactory fakeRooms] statusCode:200 headers:nil]
                requestTime:1.0 responseTime:1.0];
    }];
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

- (void)testGetMessage
{
    [self testAuth];
    
    StartBlock();
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        return [request.URL.relativePath containsString:@"messages"];
    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
        return [[OHHTTPStubsResponse responseWithJSONObject:[ResponseFactory fakeMessage] statusCode:200 headers:nil]
                requestTime:1.0 responseTime:1.0];
    }];
    waitingForBlock = YES;
    
    [Sqwiggle messageWithID:@1
                    success:^(SQMessage *message) {
                        EndBlock();
                        XCTAssertTrue(YES, @"Did succeed");
                    } failure:^(NSError *error) {
                        EndBlock();
                        XCTFail(@"Error returned for test %@", error);
                    }];
    
    WaitUntilBlockCompletes();
}
- (void)testGetAllMessages
{
    [self testAuth];
    
    StartBlock();
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        return [request.URL.relativePath containsString:@"messages"];
    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
        return [[OHHTTPStubsResponse responseWithJSONObject:[ResponseFactory fakeMessages] statusCode:200 headers:nil]
                requestTime:1.0 responseTime:1.0];
    }];
    waitingForBlock = YES;
    
    [Sqwiggle messagesForRoomID:@1
                        success:^(NSArray *items) {
                           EndBlock();
                           XCTAssertTrue(YES, @"Did succeed");
                        } failure:^(NSError *error) {
                           EndBlock();
                        XCTFail(@"Error returned for test %@", error);
                        }];
    
    WaitUntilBlockCompletes();
}

- (void)testGetMessagesForPage
{
    [self testAuth];
    
    StartBlock();
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        return [request.URL.relativePath containsString:@"messages"];
    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
        return [[OHHTTPStubsResponse responseWithJSONObject:[ResponseFactory fakeMessages] statusCode:200 headers:nil]
                requestTime:1.0 responseTime:1.0];
    }];
    waitingForBlock = YES;
    
    [Sqwiggle messagesForRoomID:@1
                      withLimit:@5
                    andBeforeID:@6
                        success:^(NSArray *items) {
                            EndBlock();
                            XCTAssertTrue(YES, @"Did succeed");
                        } failure:^(NSError *error) {
                            EndBlock();
                            XCTFail(@"Error returned for test %@", error);
                        }];
    
    WaitUntilBlockCompletes();
}

- (void)testSendMessage
{
    [self testAuth];
    
    StartBlock();
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        return [request.URL.relativePath containsString:@"messages"];
    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
        return [[OHHTTPStubsResponse responseWithJSONObject:[ResponseFactory fakeMessage] statusCode:200 headers:nil]
                requestTime:1.0 responseTime:1.0];
    }];
    waitingForBlock = YES;
    
	[Sqwiggle sendMessage:@"Test message"
				   roomID:1
				  success:^(id responseObject) {
					  EndBlock();
					  XCTAssertTrue(YES, @"Did succeed");
				  }
				  failure:^(NSError *error) {
					  EndBlock();
					  XCTFail(@"Error returned for test %@", error);
				  }];

    WaitUntilBlockCompletes();
}

-(void)testAttachment
{
    [self testAuth];
    
    StartBlock();
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        return [request.URL.relativePath containsString:@"attachments"];
    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
        return [[OHHTTPStubsResponse responseWithJSONObject:[ResponseFactory fakeAttachment] statusCode:200 headers:nil]
                requestTime:1.0 responseTime:1.0];
    }];
    waitingForBlock = YES;
    
    [Sqwiggle attachmentByID:@1 success:^(SQAttachment *attachment) {
        EndBlock();
        XCTAssertTrue(YES, @"Did succeed");
    } failure:^(NSError *error) {
        EndBlock();
        XCTFail(@"Error returned for test %@", error);
    }];
    
    WaitUntilBlockCompletes();
}

-(void)testConversation
{
    //fakeConversation
    [self testAuth];
    
    StartBlock();
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        return [request.URL.relativePath containsString:@"conversations"];
    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
        return [[OHHTTPStubsResponse responseWithJSONObject:[ResponseFactory fakeConversation] statusCode:200 headers:nil]
                requestTime:1.0 responseTime:1.0];
    }];
    waitingForBlock = YES;
    
    [Sqwiggle conversationWithID:@1 success:^(SQConversation *attachment) {
        EndBlock();
        XCTAssertTrue(YES, @"Did succeed");
    } failure:^(NSError *error) {
        EndBlock();
        XCTFail(@"Error returned for test %@", error);
    }];
    
    WaitUntilBlockCompletes();
}

-(void)testConversations
{
    //fakeConversation
    [self testAuth];
    
    StartBlock();
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        return [request.URL.relativePath containsString:@"conversations"];
    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
        return [[OHHTTPStubsResponse responseWithJSONObject:[ResponseFactory fakeConversations] statusCode:200 headers:nil]
                requestTime:1.0 responseTime:1.0];
    }];
    waitingForBlock = YES;
    
    [Sqwiggle allConversations:^(NSArray *conversations) {
        EndBlock();
        XCTAssertTrue(YES, @"Did succeed");
    } failure:^(NSError *error) {
        EndBlock();
        XCTFail(@"Error returned for test %@", error);
    }];
    WaitUntilBlockCompletes();
}

-(void)testGetAllInvites
{
    [self testAuth];
    
    StartBlock();
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        return [request.URL.relativePath containsString:@"invites"];
    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
        return [[OHHTTPStubsResponse responseWithJSONObject:[ResponseFactory fakeAttachment] statusCode:200 headers:nil]
                requestTime:1.0 responseTime:1.0];
    }];
    waitingForBlock = YES;
    
    [Sqwiggle allInvites:^(NSArray *invites) {
        EndBlock();
        XCTAssertTrue(YES, @"Did succeed");
    } failure:^(NSError *error) {
        EndBlock();
        XCTFail(@"Error returned for test %@", error);
    }];
}

@end
