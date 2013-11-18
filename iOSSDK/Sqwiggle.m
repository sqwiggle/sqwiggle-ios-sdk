//
//  Sqwiggle.m
//  libSqwiggle
//
//  Created by Cameron Webb on 11/12/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import "Sqwiggle.h"
#import <AFNetworking/AFNetworking.h>

#define SQWIGGLE_AUTH_KEY @"SQWIGGLE_USERNAME_KEY"

@interface Sqwiggle ()

/* Private Method Declaration */
+(NSString *) getAuthHeader;
+(void) setAuthHeader:(NSString *)authHeader;

@end

@implementation Sqwiggle

+(void) startSqwigglingWithUsername:(NSString *) username
                           password:(NSString *) password
                            success:(void (^)(BOOL resp))success
                            failure:(void (^)(NSError *error))failure
{
    if ([self getAuthHeader])
    {
        success(true);
        return;
    }
    
    NSString *url = @"http://dev.sqwiggle.com/api/v1/users/auth";
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *authInfo = @{@"email": username, @"password": password};
    
    [manager POST:url parameters:authInfo
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             [self setAuthHeader:[responseObject objectForKey:@"auth_token"]];
             success(YES);

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

+(void) stopSqwiggling
{
    [self setAuthHeader:nil];
}

+(void) retrieveItemsOfType:(SqwiggleType)type
                    success:(void (^)(NSArray *items))success
                    failure:(void (^)(NSError *error))failure
{
    [self retreiveItemOfType:SqwiggleUser
                        byID:nil
                     success:success
                     failure:failure];
}

+(void) retreiveItemOfType:(SqwiggleType)type
                      byID:(NSNumber *)ID
                   success:(void (^)(id item))success
                   failure:(void (^)(NSError *error))failure
{
    NSString *relativeURL = [SQWIGGLE_RELATIVE_URLS objectForKey:NSStringFromClass(type)];
    
    NSString *url = [NSString stringWithFormat:@"%@/%@/%@", SQWIGGLE_URI_API,
                     relativeURL, (ID ? ID : @"")];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setRequestSerializer:[AFHTTPRequestSerializer serializer]];
    [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:[self getAuthHeader]
                                                              password:@"x"];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@", responseObject);
        if (!ID)
        {
            NSMutableArray *responseObjects = [NSMutableArray new];
            [responseObject each:^(id object) {
                [responseObjects push:[type objectWithDictionary:object]];
            }];
            success(responseObjects);
        }
        else
        {
            success([type performSelector:@selector(objectWithDictionary:)
                               withObject:responseObject]);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

#pragma mark private methods

+(NSString *) getAuthHeader
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:SQWIGGLE_AUTH_KEY];
}
+(void) setAuthHeader:(NSString *)authHeader
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:authHeader
                 forKey:SQWIGGLE_AUTH_KEY];
    [defaults synchronize];
}

@end
