//
//  Sqwiggle.m
//  libSqwiggle
//
//  Created by Cameron Webb on 11/12/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import "Sqwiggle.h"
#import <AFNetworking/AFNetworking.h>
#import "SQJuggernaut.h"

#define SQWIGGLE_AUTH_KEY @"SQWIGGLE_USERNAME_KEY"
#define SQWIGGLE_CURRENT_USER @"SQWIGGLE_CURRENT_USER"
@interface Sqwiggle ()

/* Private Method Declaration */
+(SQUser *) currentUser;
+(NSString *) authToken;
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

    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *url = NSStringWithFormat(@"%@/auth/token", SQWIGGLE_URI_API);
    NSDictionary *authInfo = @{@"email": username, @"password": password};
    [manager POST:url parameters:authInfo
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             
             [self setAuthToken:[responseObject objectForKey:tokenKey]];
             success(YES);

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {

        failure(error);
    }];
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

+(void) getCurrentUser:(void (^)(SQUser *user))success
               failure:(void (^)(NSError *error))failure
{
    [SQJuggernaut retreiveItemOfType:SQWIGGLE_USER_TYPE
                                byID:@"me"
                       withAuthToken:[self authToken]
                             success:^(id item) {
                                 [Sqwiggle setCurrentUser:item];
                                 success(item);
                             }
                             failure:failure];
}

+(void) getAllUsers:(void (^)(NSArray *users))success
            failure:(void (^)(NSError *error))failure
{
    [SQJuggernaut retreiveItemsOfType:SQWIGGLE_USER_TYPE
                        withAuthToken:[self authToken]
                              success:success
                              failure:failure];
}

+(void) getUserWithID:(NSNumber *)ID success:(void (^)(SQUser *))success failure:(void (^)(NSError *))failure
{
    [SQJuggernaut retreiveItemOfType:SQWIGGLE_USER_TYPE
                                byID:ID
                       withAuthToken:[self authToken]
                             success:success
                             failure:failure];
}

#pragma mark Room Help Methods

+(void) getAllRooms:(void (^)(NSArray *))success
                failure:(void (^)(NSError *))failure
{
    [SQJuggernaut retreiveItemsOfType:SQWIGGLE_ROOM_TYPE
                        withAuthToken:[self authToken]
                              success:success
                              failure:failure];
}

+(void) getRoomWithID:(NSNumber *)ID
                  success:(void (^)(SQRoom *))success
                  failure:(void (^)(NSError *))failure
{
    [SQJuggernaut retreiveItemOfType:SQWIGGLE_ROOM_TYPE
                                byID:ID
                       withAuthToken:[self authToken]
                             success:success
                             failure:failure];
}

+(void) getStreamItemsForRoomID:(NSNumber *)ID
                             success:(void (^)(NSArray *))success
                             failure:(void (^)(NSError *))failure
{
    [SQJuggernaut retreiveItemsOfType:SQWIGGLE_STREAMITEM_TYPE
                       filteredByType:SQWIGGLE_ROOM_TYPE
                               withID:ID
                       withAuthToken:[self authToken]
                             success:success
                             failure:failure];
}


#pragma mark private methods

+(NSString *) authToken
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:SQWIGGLE_AUTH_KEY];
}

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

@end
