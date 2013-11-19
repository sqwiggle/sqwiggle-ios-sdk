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
@interface Sqwiggle ()

/* Private Method Declaration */
+(NSString *) authToken;
+(void) setAuthToken:(NSString *)authToken;

@end

@implementation Sqwiggle

+(void) startSqwigglingWithUsername:(NSString *) username
                           password:(NSString *) password
                            success:(void (^)(BOOL resp))success
                            failure:(void (^)(NSError *error))failure
{
    static NSString *tokenKey = @"auth_token";
    if ([self authToken])
    {
        success(true);
        return;
    }
    
    NSString *url = @"http://sqwiggle.com/api/v1/users/auth";
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
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

@end
