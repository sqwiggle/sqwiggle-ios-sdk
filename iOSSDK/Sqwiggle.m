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
+(void) setAuthToken:(NSString *)authToken;
+(void) setCurrentUser:(SQUser *)currentUser;
@end

@implementation Sqwiggle

+(void) startSqwigglingWithUsername:(NSString *) username
                           password:(NSString *) password
                            success:(void (^)(SQUser *user))success
                            failure:(void (^)(NSError *error))failure
{
    static NSString *tokenKey = @"auth_token";

    
    NSString *url = @"https://www.sqwiggle.com/api/v1/users/auth.json";
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *authInfo = @{@"email": username, @"password": password};
    [manager POST:url parameters:authInfo
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             SQUser *user = [[SQUser alloc] init];
             NSLog(@"%@ usser", responseObject);
             user.workRoomID = [[responseObject objectForKey:@"user"] objectForKey:@"workroom_id"];
             user.companyID = [[responseObject objectForKey:@"user"] objectForKey:@"company_id"];
             user.ID = [[responseObject objectForKey:@"user"] objectForKey:@"id"];
             user.name = [[responseObject objectForKey:@"user"] objectForKey:@"name"];
             user.avatar = [[responseObject objectForKey:@"user"] objectForKey:@"avatar"];
             [self setCurrentUser:user];
             [self setAuthToken:[responseObject objectForKey:tokenKey]];
             success(user);

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {

        failure(error);
    }];
}

+(void) stopSqwiggling
{
    [self setAuthToken:nil];
}

+(BOOL) isLoggedIn
{
    return [self authToken] != nil;
}
#pragma mark User Helper Methods

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

#pragma mark Workroom Help Methods

+(void) getAllWorkrooms:(void (^)(NSArray *))success
                failure:(void (^)(NSError *))failure
{
    [SQJuggernaut retreiveItemsOfType:SQWIGGLE_WORKROOM_TYPE
                        withAuthToken:[self authToken]
                              success:success
                              failure:failure];
}

+(void) getWorkroomWithID:(NSNumber *)ID
                  success:(void (^)(SQWorkroom *))success
                  failure:(void (^)(NSError *))failure
{
    [SQJuggernaut retreiveItemOfType:SQWIGGLE_WORKROOM_TYPE
                                byID:ID
                       withAuthToken:[self authToken]
                             success:success
                             failure:failure];
}

+(void) getStreamItemsWithWorkroomID:(NSNumber *)ID
                             success:(void (^)(NSArray *))success
                             failure:(void (^)(NSError *))failure
{
    [SQJuggernaut retreiveItemsOfType:SQWIGGLE_STREAMITEM_TYPE
                       filteredByType:SQWIGGLE_WORKROOM_TYPE
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
