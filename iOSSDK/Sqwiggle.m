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



@interface Sqwiggle ()

/* Private Method Declaration */
+(void) setAuthToken:(NSString *)authToken;
+(void) setCurrentUser:(SQUser *)currentUser;
@end

@implementation Sqwiggle

+(void) startSqwigglingWithUsername:(NSString *) username
                           password:(NSString *) password
                            success:(void (^)(BOOL signedIn))success
                            failure:(void (^)(NSError *error))failure
{
    static NSString *tokenKey = @"token";
    static NSString *emailKey = @"email";
    static NSString *passwordKey = @"password";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *url = NSStringWithFormat(@"%@/auth/token", SQWIGGLE_URI_API);
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

+(void) stopSqwiggling
{
    [self setAuthToken:nil];
    [self setCurrentUser:nil];
}

+(BOOL) isLoggedIn
{
    return [self authToken] != nil;
}
#pragma mark User Helper Methods

+(void) currentUserForSession:(void (^)(SQUser *user))success
               failure:(void (^)(NSError *error))failure
{
    static NSString *me = @"me";
    
    [SQJuggernaut retreiveItemOfType:SQWIGGLE_USER_TYPE
                                byID:me
                       withAuthToken:[self authToken]
                             success:^(id item) {
                                 [Sqwiggle setCurrentUser:item];
                                 success(item);
                             }
                             failure:failure];
}

+(void) allUsers:(void (^)(NSArray *users))success
            failure:(void (^)(NSError *error))failure
{
    [SQJuggernaut retreiveItemsOfType:SQWIGGLE_USER_TYPE
                        withAuthToken:[self authToken]
                              success:success
                              failure:failure];
}

+(void) userWithID:(NSNumber *)ID
           success:(void (^)(SQUser *))success
           failure:(void (^)(NSError *))failure
{
    [SQJuggernaut retreiveItemOfType:SQWIGGLE_USER_TYPE
                                byID:ID
                       withAuthToken:[self authToken]
                             success:success
                             failure:failure];
}

#pragma mark Attachment Methods
+(void) allAttachments:(void (^)(NSArray *))success
               failure:(void (^)(NSError *))failure
{
    [SQJuggernaut retreiveItemsOfType:SQWIGGLE_ATTACHMENT_TYPE
                        withAuthToken:[self authToken]
                              success:success
                              failure:failure];
}

+(void) attachmentByID:(NSNumber *)ID
               success:(void (^)(SQAttachment *attachment))success
               failure:(void (^)(NSError *error))failure
{
    [SQJuggernaut retreiveItemOfType:SQWIGGLE_ATTACHMENT_TYPE
                                byID:ID
                       withAuthToken:[self authToken]
                             success:success
                             failure:failure];
}

#pragma mark Room Helper Methods

+(void) allRooms:(void (^)(NSArray *))success
         failure:(void (^)(NSError *))failure
{
    [SQJuggernaut retreiveItemsOfType:SQWIGGLE_ROOM_TYPE
                        withAuthToken:[self authToken]
                              success:^(NSArray *items) {
                                  //storing rooms for quicker access
                                  [Sqwiggle setCurrentUserRooms:items];
                                  success(items);
                              }
                              failure:failure];
}

+(void) roomWithID:(NSNumber *)ID
                  success:(void (^)(SQRoom *))success
                  failure:(void (^)(NSError *))failure
{
    [SQJuggernaut retreiveItemOfType:SQWIGGLE_ROOM_TYPE
                                byID:ID
                       withAuthToken:[self authToken]
                             success:success
                             failure:failure];
}

+(void) messagesForRoomID:(NSNumber *)ID
                             success:(void (^)(NSArray *))success
                             failure:(void (^)(NSError *))failure
{
#warning needs to be updated for parameter-based structure
    [SQJuggernaut retreiveItemsOfType:SQWIGGLE_MESSAGE_TYPE
                       filteredByType:SQWIGGLE_ROOM_TYPE
                               withID:ID
                       withAuthToken:[self authToken]
                             success:success
                             failure:failure];
}

#pragma mark Organization Methods
+(void) allOrganizations:(void (^)(NSArray *))success
                 failure:(void (^)(NSError *))failure
{
    [SQJuggernaut retreiveItemsOfType:SQWIGGLE_ORGANIZATION_TYPE
                        withAuthToken:[self authToken]
                              success:success
                              failure:failure];
}

+(void) organizationWithID:(NSNumber *)ID
                   success:(void (^)(SQOrganization *))success
                   failure:(void (^)(NSError *))failure
{
    [SQJuggernaut retreiveItemOfType:SQWIGGLE_ORGANIZATION_TYPE
                                byID:ID
                       withAuthToken:[self authToken]
                             success:success
                             failure:failure];
}
#pragma mark Message Methods
+(void) messageWithID:(NSNumber *)ID
              success:(void (^)(SQMessage *room))success
              failure:(void (^)(NSError *error))failure
{
    [SQJuggernaut retreiveItemOfType:SQWIGGLE_MESSAGE_TYPE
                                byID:ID
                       withAuthToken:[self authToken]
                             success:success
                             failure:failure];
}

#pragma mark Conversation Methods
+(void) allConversations:(void (^)(NSArray *))success
                 failure:(void (^)(NSError *))failure
{
    [SQJuggernaut retreiveItemsOfType:SQWIGGLE_CONVERSATION_TYPE
                        withAuthToken:[self authToken]
                              success:success
                              failure:failure];
}

+(void) conversationWithID:(NSNumber *)ID success:(void (^)(SQConversation *))success failure:(void (^)(NSError *))failure
{
    [SQJuggernaut retreiveItemOfType:SQWIGGLE_CONVERSATION_TYPE
                                byID:ID
                       withAuthToken:[self authToken]
                             success:success
                             failure:failure];
}

#pragma mark Invite Methods
+(void) allInvites:(void (^)(NSArray *))success
           failure:(void (^)(NSError *))failure
{
    [SQJuggernaut retreiveItemsOfType:SQWIGGLE_INVITE_TYPE
                        withAuthToken:[self authToken]
                              success:success
                              failure:failure];
}

+(void) inviteWithID:(NSNumber *)ID
             success:(void (^)(SQInvite *))success
             failure:(void (^)(NSError *))failure
{
    [SQJuggernaut retreiveItemOfType:SQWIGGLE_INVITE_TYPE
                                byID:ID
                       withAuthToken:[self authToken]
                             success:success
                             failure:failure];
}

#pragma mark Configuration Methods

+(void) configurationInfoForCurrentSession:(void (^)(SQConfiguration *))success
                                   failure:(void (^)(NSError *))failure
{
    [SQJuggernaut retreiveItemsOfType:SQWIGGLE_CONFIGURATION_TYPE
                        withAuthToken:[self authToken]
                              success:success
                              failure:failure];
}

#pragma Session Method
+(NSString *) authToken
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:SQWIGGLE_AUTH_KEY];
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
