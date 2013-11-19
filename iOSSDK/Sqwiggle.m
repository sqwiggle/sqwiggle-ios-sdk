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
+(NSString *) getAuthHeader;
+(void) setAuthHeader:(NSString *)authHeader;

@end

@implementation Sqwiggle

+(void) startSqwigglingWithUsername:(NSString *) username
                           password:(NSString *) password
                            success:(void (^)(BOOL resp))success
                            failure:(void (^)(NSError *error))failure
{
    static NSString *tokenKey = @"token";
    if ([self getAuthHeader])
    {
        success(true);
        return;
    }
    
    NSString *url = @"http://api.sqwiggle.com/auth/token";
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *authInfo = @{@"email": username, @"password": password};
    
    [manager POST:url parameters:authInfo
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             [self setAuthHeader:[responseObject objectForKey:tokenKey]];
             success(YES);

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

+(void) stopSqwiggling
{
    [self setAuthHeader:nil];
}

#pragma mark User Methods

+(void) getAllUsers:(void (^)(NSArray *users))success
            failure:(void (^)(NSError *error))failure
{

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
