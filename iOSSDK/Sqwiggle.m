//
//  Sqwiggle.m
//  libSqwiggle
//
//  Created by Cameron Webb on 11/12/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import "Sqwiggle.h"
#import "SQJuggernaut.h"

#define SQWIGGLE_AUTH_KEY @"SQWIGGLE_USERNAME_KEY"
#define SQWIGGLE_CURRENT_USER @"SQWIGGLE_CURRENT_USER"
#define SQWIGGLE_USER_ROOMS @"SQWIGGLE_CURRENT_ROOMS"

#define SQWIGGLE_ENVIRONMENT_PRODUCTION @"https://api.sqwiggle.com"

@interface Sqwiggle ()

/* Private Method Declaration */
+(void) setAuthToken:(NSString *)authToken;
+(void) setCurrentUser:(SQUser *)currentUser;
@end

@implementation Sqwiggle

+(void) startSqwigglingWithUsername:(NSString *) username
                           password:(NSString *) password
                            success:(void (^)(BOOL signedIn))success
                            failure:(failureResponse)failure
{
    static NSString *tokenKey = @"token";
    static NSString *emailKey = @"email";
    static NSString *passwordKey = @"password";
    
    if (![self currentAPIEndpoint])
    {
        [SQJuggernaut setAPIEndpoint:SQWIGGLE_ENVIRONMENT_PRODUCTION];
    }
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *url = NSStringWithFormat(@"%@/auth/token", [self currentAPIEndpoint]);
    NSDictionary *authInfo = @{emailKey: username, passwordKey: password};
    [manager POST:url parameters:authInfo
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              [self setAuthToken:[responseObject objectForKey:tokenKey]];
              success(YES);
          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              failure(error);
          }];
}

+(void) startSqwigglingWithAuthenticationToken:(NSString *)authToken
{
    [self setAuthToken:authToken];
}

+(void) setAPIEndpoint:(NSString *)endpoint
{
    [SQJuggernaut setAPIEndpoint:endpoint];
}

+(NSString *) currentAPIEndpoint
{
    return [SQJuggernaut currentAPIEndpoint];
}

+(void) stopSqwiggling
{
    [self setAuthToken:nil];
    [self setCurrentUser:nil];
}

+(BOOL) isLoggedIn
{
    return [self authToken] != nil;
}
#pragma mark User Methods

+(void) currentUserForSession:(void (^)(SQUser *user))success
                      failure:(failureResponse)failure
{
    static NSString *me = @"me";
    
    [SQJuggernaut retreiveItemOfType:SQWIGGLE_USER_TYPE
                                byID:me
                          parameters:nil
                           authToken:[self authToken]
                             success:^(id item) {
                                 [Sqwiggle setCurrentUser:item];
                                 success(item);
                             }
                             failure:failure];
}

+(void) allUsers:(void (^)(NSArray *users))success
         failure:(failureResponse)failure
{
    [self allUsersWithLimit:nil
              andPageNumber:nil
                    success:success
                    failure:failure];
}

+(void) allUsersWithLimit:(NSNumber *)limit
            andPageNumber:(NSNumber *) pageNumber
                  success:(void (^)(NSArray *users))success
                  failure:(failureResponse)failure
{
    [SQJuggernaut retreiveItemsOfType:SQWIGGLE_USER_TYPE
                           parameters: @{@"limit": (limit ? limit : @""), \
                                         @"page": (pageNumber ? pageNumber : @"")}
                            authToken:[self authToken]
                              success:success
                              failure:failure];
}

+(void) allContacts:(void (^)(NSArray *users))success
                    failure:(failureResponse)failure
{
    [SQJuggernaut retreiveItemOfType:SQWIGGLE_CONTACT_TYPE
						   mapToType:SQWIGGLE_USER_TYPE
                                byID:nil
                          parameters:nil
                           authToken:[self authToken]
                             success:success
                             failure:failure];
}

+(void) userWithID:(NSNumber *)ID
           success:(void (^)(SQUser *))success
           failure:(failureResponse)failure
{
    [SQJuggernaut retreiveItemOfType:SQWIGGLE_USER_TYPE
                                byID:ID
                          parameters:nil
                           authToken:[self authToken]
                             success:success
                             failure:failure];
}

#pragma mark Attachment Methods
+(void) allAttachments:(void (^)(NSArray *))success
               failure:(failureResponse)failure
{
    [self allAttachmentsWithLimit:nil
                    andPageNumber:nil
                          success:success
                          failure:failure];
}

+(void) allAttachmentsWithLimit:(NSNumber *)limit
                  andPageNumber:(NSNumber *)pageNumber
                        success:(void (^)(NSArray *))success
                        failure:(failureResponse)failure
{
    [SQJuggernaut retreiveItemsOfType:SQWIGGLE_ATTACHMENT_TYPE
                           parameters: @{@"limit": (limit ? limit : @""), \
                                         @"page": (pageNumber ? pageNumber : @"")}
                            authToken:[self authToken]
                              success:success
                              failure:failure];
}

+(void) attachmentByID:(NSNumber *)ID
               success:(void (^)(SQAttachment *attachment))success
               failure:(failureResponse)failure
{
    [SQJuggernaut retreiveItemOfType:SQWIGGLE_ATTACHMENT_TYPE
                                byID:ID
                          parameters:nil
                           authToken:[self authToken]
                             success:success
                             failure:failure];
}

#pragma mark Room Methods

+(void) roomWithID:(NSNumber *)ID
           success:(void (^)(SQRoom *))success
           failure:(failureResponse)failure
{
    [SQJuggernaut retreiveItemOfType:SQWIGGLE_ROOM_TYPE
                                byID:ID
                          parameters: nil
                           authToken:[self authToken]
                             success:success
                             failure:failure];
}

+(void) allRooms:(void (^)(NSArray *))success
         failure:(failureResponse)failure
{
    [self allRoomsWithLimit:nil
              andPageNumber:nil
                    success:success
                    failure:failure];
}

+(void) allRoomsWithLimit:(NSNumber *)limit
            andPageNumber:(NSNumber *) pageNumber
                  success:(void (^)(NSArray *))success
                  failure:(failureResponse)failure
{
    [SQJuggernaut retreiveItemsOfType:SQWIGGLE_ROOM_TYPE
                           parameters:@{@"limit": (limit ? limit : @""), \
                                        @"page": (pageNumber ? pageNumber : @"")}
                            authToken:[self authToken]
                              success:success
                              failure:failure];
}


#pragma mark - Stream Methods

+ (void)allStreams:(void (^)(NSArray *streams))success
		   failure:(failureResponse)failure
{
	[SQJuggernaut retreiveItemsOfType:SQWIGGLE_STREAM_TYPE
						   parameters:nil
							authToken:[self authToken]
							  success:success
							  failure:failure];
}


#pragma mark Organization Methods
+(void) allOrganizations:(void (^)(NSArray *))success
                 failure:(failureResponse)failure
{
    [SQJuggernaut retreiveItemsOfType:SQWIGGLE_ORGANIZATION_TYPE
                           parameters:nil
                            authToken:[self authToken]
                              success:success
                              failure:failure];
}

+(void) organizationWithID:(NSNumber *)ID
                   success:(void (^)(SQOrganization *))success
                   failure:(failureResponse)failure
{
    [SQJuggernaut retreiveItemOfType:SQWIGGLE_ORGANIZATION_TYPE
                                byID:ID
                          parameters:nil
                           authToken:[self authToken]
                             success:success
                             failure:failure];
}
#pragma mark Message Methods
+(void) messagesForStreamID:(NSNumber *)ID
					success:(void (^)(NSArray *messages))success
					failure:(failureResponse)failure
{
    [self messagesForStreamID:ID
					withLimit:nil
				  andBeforeID:nil
					  success:success
					  failure:failure];
}

+(void) messagesForStreamID:(NSNumber *)ID
				  withLimit:(NSNumber *)limit
				andBeforeID:(NSNumber *) beforeID
					success:(void (^)(NSArray *messages))success
					failure:(failureResponse)failure
{
	NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
	
	if (limit)
		params[@"limit"] = limit;
	
	if (beforeID)
		params[@"before_id"] = beforeID;
	
    //Yep, this is hacky with messages for room, but gets the job done
    [SQJuggernaut retreiveItemOfType:SQWIGGLE_STREAM_TYPE
						   mapToType:SQWIGGLE_MESSAGE_TYPE
                                byID:NSStringWithFormat(@"%@/messages", ID)
                          parameters:params
                           authToken:[self authToken]
                             success:success
                             failure:failure];
}


+ (void)sendMessage:(NSString*)message
		   streamID:(NSNumber*)streamID
			success:(void (^)(id responseObject))success
			failure:(failureResponse)failure
{
	[SQJuggernaut sendItemOfType:SQWIGGLE_MESSAGE_TYPE
					  parameters:@{ @"room_id" : streamID,
									@"text" : message }
					   authToken:[self authToken]
						 success:success
						 failure:failure];
}


+(void) messageWithID:(NSNumber *)ID
              success:(void (^)(SQMessage *room))success
              failure:(failureResponse)failure
{
    [SQJuggernaut retreiveItemOfType:SQWIGGLE_MESSAGE_TYPE
                                byID:ID
                          parameters:nil
                           authToken:[self authToken]
                             success:success
                             failure:failure];
}

+(void) allMessages:(void (^)(NSArray *))success
            failure:(failureResponse)failure
{
    [self allMessagesWithLimit:nil
                   andBeforeID:nil
                       success:success
                       failure:failure];
}

+(void) allMessagesWithLimit:(NSNumber *)limit
                 andBeforeID:(NSNumber *)beforeID
                     success:(void (^)(NSArray *))success
                     failure:(failureResponse)failure
{
    [SQJuggernaut retreiveItemsOfType:SQWIGGLE_MESSAGE_TYPE
                           parameters:@{@"limit": (limit ? limit : @""), \
                                        @"before_id": (beforeID ? beforeID : @"")}
                            authToken:[self authToken]
                              success:success
                              failure:failure];
}


+(void) messagesForRoomID:(NSNumber *)ID
                  success:(void (^)(NSArray *))success
                  failure:(failureResponse)failure
{
    [self messagesForRoomID:ID
                  withLimit:nil
                andBeforeID:nil
                    success:success
                    failure:failure];
}

+(void) messagesForRoomID:(NSNumber *)ID
                withLimit:(NSNumber *)limit
              andBeforeID:(NSNumber *) beforeID
                  success:(void (^)(NSArray *))success
                  failure:(failureResponse)failure
{
	NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
	
	if (limit)
		params[@"limit"] = limit;
	
	if (beforeID)
		params[@"before_id"] = beforeID;
	
    //Yep, this is hacky with messages for room, but gets the job done
    [SQJuggernaut retreiveItemOfType:SQWIGGLE_ROOM_TYPE
						   mapToType:SQWIGGLE_MESSAGE_TYPE
                                byID:NSStringWithFormat(@"%@/messages", ID)
                          parameters:params
                           authToken:[self authToken]
                             success:success
                             failure:failure];
}

+ (void)sendMessage:(NSString*)message
			 roomID:(uint)roomID
			success:(void (^)(id responseObject))success
			failure:(failureResponse)failure
{
	[SQJuggernaut sendItemOfType:SQWIGGLE_MESSAGE_TYPE
					  parameters:@{ @"room_id" : @(roomID),
									@"text" : message }
					   authToken:[self authToken]
						 success:success
						 failure:failure];
}

#pragma mark Conversation Methods
+(void) conversationWithID:(NSNumber *)ID
                   success:(void (^)(SQConversation *))success
                   failure:(failureResponse)failure
{
    [SQJuggernaut retreiveItemOfType:SQWIGGLE_CONVERSATION_TYPE
                                byID:ID
                          parameters: nil
                           authToken:[self authToken]
                             success:success
                             failure:failure];
}

+(void) allConversations:(void (^)(NSArray *))success
                 failure:(failureResponse)failure
{
    [self allConversationsWithLimit:nil
                      andPageNumber:nil
                            success:success
                            failure:failure];
}

+(void) allConversationsWithLimit:(NSNumber *)limit
                    andPageNumber:(NSNumber *)pageNumber
                          success:(void (^)(NSArray *))success
                          failure:(failureResponse)failure
{
    [SQJuggernaut retreiveItemsOfType:SQWIGGLE_CONVERSATION_TYPE
                           parameters:@{@"limit": (limit ? limit : @""), \
                                        @"page": (pageNumber ? pageNumber : @"")}
                            authToken:[self authToken]
                              success:success
                              failure:failure];
}

#pragma mark Invite Methods
+(void) inviteWithID:(NSNumber *)ID
             success:(void (^)(SQInvite *))success
             failure:(failureResponse)failure
{
    [SQJuggernaut retreiveItemOfType:SQWIGGLE_INVITE_TYPE
                                byID:ID
                          parameters:nil
                           authToken:[self authToken]
                             success:success
                             failure:failure];
}

+(void) allInvites:(void (^)(NSArray *))success
           failure:(failureResponse)failure
{
    [self allInvitesWithLimit:nil
                andPageNumber:nil
                      success:success
                      failure:failure];
}

+(void) allInvitesWithLimit:(NSNumber *)limit
              andPageNumber:(NSNumber *)pageNumber
                    success:(void (^)(NSArray *))success
                    failure:(failureResponse)failure
{
    [SQJuggernaut retreiveItemsOfType:SQWIGGLE_INVITE_TYPE
                           parameters:@{@"limit": (limit ? limit : @""), \
                                        @"page": (pageNumber ? pageNumber : @"")}
                            authToken:[self authToken]
                              success:success
                              failure:failure];
}



#pragma mark Configuration Methods

+(void) configurationInfoForCurrentSession:(void (^)(SQConfiguration *))success
                                   failure:(failureResponse)failure
{
    [SQJuggernaut retreiveItemsOfType:SQWIGGLE_CONFIGURATION_TYPE
                           parameters:nil
                            authToken:[self authToken]
                              success:success
                              failure:failure];
}

#pragma Session Method
+(NSString *) authToken
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:SQWIGGLE_AUTH_KEY];
}

#pragma mark Activity Methods
+(void) allActivities:(void (^)(NSArray *activities))success
              failure:(failureResponse)failure
{
    [SQJuggernaut retreiveItemsOfType:SQWIGGLE_ACTIVITY_TYPE
                           parameters:nil
                            authToken:[self authToken]
                              success:success
                              failure:failure];
}

+(void) allActivitiesWithLimit:(NSNumber *)limit
                 andPageNumber:(NSNumber *)pageNumber
                       success:(void (^)(NSArray *))success
                       failure:(failureResponse)failure
{
    [SQJuggernaut retreiveItemsOfType:SQWIGGLE_ACTIVITY_TYPE
                           parameters:@{@"limit": (limit ? limit : @""), \
                                        @"page": (pageNumber ? pageNumber : @"")}
                            authToken:[self authToken]
                              success:success
                              failure:failure];
}

#pragma mark private methods
+(void) setAuthToken:(NSString *)authToken
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:authToken
                 forKey:SQWIGGLE_AUTH_KEY];
    [defaults synchronize];
}


+(SQUser *) currentUser
{
    return (SQUser *) [NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:SQWIGGLE_CURRENT_USER]];
}

+(void) setCurrentUser:(SQUser *)currentUser
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSKeyedArchiver archivedDataWithRootObject:currentUser]
                 forKey:SQWIGGLE_CURRENT_USER];
    [defaults synchronize];
}

+(NSArray *) currentUserRooms
{
    return (NSArray *) [NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:SQWIGGLE_USER_ROOMS]];
}

+(void) setCurrentUserRooms:(NSArray *)rooms
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSKeyedArchiver archivedDataWithRootObject:rooms]
                 forKey:SQWIGGLE_USER_ROOMS];
    [defaults synchronize];
}


@end
