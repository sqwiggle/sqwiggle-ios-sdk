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
                requestTime:0.5 responseTime:0.5];
    }];
    
    [Sqwiggle startSqwigglingWithUsername:TEST_EMAIL password:TEST_PASSWORD success:^(BOOL signedIn) {
        EndBlock();
    } failure:^(NSError *error) {
        EndBlock();
        XCTFail(@"Error returned for test %@", error);
    }];
    
    WaitUntilBlockCompletes();
}

-(void) testFailingAuth
{
    StartBlock();
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        return [request.URL.relativePath isEqualToString:@"/auth/token"];
    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
        return [[OHHTTPStubsResponse responseWithJSONObject:[ResponseFactory failingAuthResponse] statusCode:400 headers:nil]
                requestTime:0.5 responseTime:0.5];
    }];
    
    [Sqwiggle startSqwigglingWithUsername:TEST_EMAIL password:TEST_PASSWORD success:^(BOOL signedIn) {
        EndBlock();
        XCTFail(@"Test returned success when failure should have occured");
    } failure:^(NSError *error) {
        EndBlock();
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
                requestTime:0.5 responseTime:0.5];
    }];
    
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
                requestTime:0.5 responseTime:0.5];
    }];
    
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

//-(void)testGetAllContacts
//{
//    [self testAuth];
//    StartBlock();
//    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
//        NSLog(@"request %@", request.URL.relativePath);
//        return [request.URL.relativePath isEqualToString:@"/contacts"];
//    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
//        return [[OHHTTPStubsResponse responseWithJSONObject:[ResponseFactory fakeUsers] statusCode:200 headers:nil]
//                requestTime:0.5 responseTime:0.5];
//    }];
//    
//    [Sqwiggle allContacts:^(NSArray *users)
//     {
//         EndBlock();
//         XCTAssertTrue(users.count > 0, @"Did succeed");
//     } failure:^(NSError *error) {
//         EndBlock();
//         XCTFail(@"Error returned for test %@", error);
//     }];
//    
//    WaitUntilBlockCompletes();
//}
-(void)testGetRooms
{
    [self testAuth];
    StartBlock();
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        return [request.URL.relativePath isEqualToString:@"/rooms"];
    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
        return [[OHHTTPStubsResponse responseWithJSONObject:[ResponseFactory fakeRooms] statusCode:200 headers:nil]
                requestTime:0.5 responseTime:0.5];
    }];
    
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
                requestTime:0.5 responseTime:0.5];
    }];
    
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
                requestTime:0.5 responseTime:0.5];
    }];
    
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
                requestTime:0.5 responseTime:0.5];
    }];
    
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
                requestTime:0.5 responseTime:0.5];
    }];
    
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
                requestTime:0.5 responseTime:0.5];
    }];
    
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
                requestTime:0.5 responseTime:0.5];
    }];
    
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
                requestTime:0.5 responseTime:0.5];
    }];
    
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
                requestTime:0.5 responseTime:0.5];
    }];
    
    [Sqwiggle allInvites:^(NSArray *invites) {
        EndBlock();
        XCTAssertTrue(YES, @"Did succeed");
    } failure:^(NSError *error) {
        EndBlock();
        XCTFail(@"Error returned for test %@", error);
    }];
    
    WaitUntilBlockCompletes();
}

-(void)testGetAllActivities
{
    [self testAuth];
    
    StartBlock();
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        return [request.URL.relativePath containsString:@"activities"];
    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
        return [[OHHTTPStubsResponse responseWithJSONObject:[ResponseFactory fakeActivities] statusCode:200 headers:nil]
                requestTime:0.5 responseTime:0.5];
    }];
    
    [Sqwiggle allActivities:^(NSArray *activities) {
        EndBlock();
        XCTAssertTrue(YES, @"Did succeed");
    } failure:^(NSError *error) {
        EndBlock();
        XCTFail(@"Error returned for test %@", error);
    }];
    
    WaitUntilBlockCompletes();
}


- (void)testGetAllStreams
{
    [self testAuth];
    
    StartBlock();
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        return [request.URL.relativePath containsString:@"streams"];
    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
		return [[OHHTTPStubsResponse responseWithJSONObject:[ResponseFactory fakeStreams] statusCode:200 headers:nil]
				requestTime:0.5
				responseTime:0.5];
	}];
    
    [Sqwiggle allStreams:^(NSArray *streams) {
        EndBlock();
        XCTAssertTrue(YES, @"Did succeed");
    } failure:^(NSError *error) {
		EndBlock();
		XCTFail(@"Error returned for test %@", error);
	}];
    
    WaitUntilBlockCompletes();
}

- (void)testGetAllMessagesForStream
{
    [self testAuth];
    
    StartBlock();
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        return [request.URL.relativePath containsString:@"messages"];
    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
        return [[OHHTTPStubsResponse responseWithJSONObject:[ResponseFactory fakeMessages] statusCode:200 headers:nil]
                requestTime:0.5 responseTime:0.5];
    }];
    
    [Sqwiggle messagesForStreamID:@1
						  success:^(NSArray *items) {
							  EndBlock();
							  XCTAssertTrue(YES, @"Did succeed");
						  } failure:^(NSError *error) {
							  EndBlock();
							  XCTFail(@"Error returned for test %@", error);
						  }];
    
    WaitUntilBlockCompletes();
}

- (void)testGetPagedMessagesForStream
{
    [self testAuth];
    
    StartBlock();
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        return [request.URL.relativePath containsString:@"messages"];
    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
        return [[OHHTTPStubsResponse responseWithJSONObject:[ResponseFactory fakeMessages] statusCode:200 headers:nil]
                requestTime:0.5 responseTime:0.5];
    }];
    
    [Sqwiggle messagesForStreamID:@1
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

- (void)testPing
{
	StartBlock();
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        return [request.URL.relativePath containsString:@"ping"];
    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
		return [[OHHTTPStubsResponse responseWithData:nil statusCode:204 headers:nil] requestTime:0.5 responseTime:0.5];
    }];
    
    [Sqwiggle pingUser:@0
			   success:^{
				   EndBlock();
				   XCTAssertTrue(YES, @"Did succeed");
			   } failure:^(NSError *error) {
				   EndBlock();
				   XCTFail(@"Error returned for test %@", error);
			   }];
    
    WaitUntilBlockCompletes();
}

@end
