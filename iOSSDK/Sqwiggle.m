//
//  Sqwiggle.m
//  libSqwiggle
//
//  Created by Cameron Webb on 11/12/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import "Sqwiggle.h"
#import <AFNetworking/AFNetworking.h>

#define SQWIGGLE_USERNAME_KEY @"SQWIGGLE_USERNAME_KEY"
#define SQWIGGLE_PW_KEY @"SQWIGGLE_PW_KEY"

@interface Sqwiggle ()

/* Private Method Declaration */
+(NSString *) getUserName;
+(NSString *) getPassword;
+(void) setUserName:(NSString *)userName;
+(void) setPassword:(NSString *)password;

@end

@implementation Sqwiggle

+(void) startSqwigglingWithUsername:(NSString *) username
                           password:(NSString *) password
{
    
}

+(void) stopSqwiggling
{
    
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
    [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:@"rwAx4yqBcNvoyjLsjMKL"
                                                              password:@"x"];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
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
+(NSString *) getUserName
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:SQWIGGLE_USERNAME_KEY];
}
+(NSString *) getPassword
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:SQWIGGLE_PW_KEY];
}

+(void) setUserName:(NSString *)userName
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:userName
                 forKey:SQWIGGLE_USERNAME_KEY];
    [defaults synchronize];
}
+(void) setPassword:(NSString *)password
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:password
                 forKey:SQWIGGLE_USERNAME_KEY];
    [defaults synchronize];
}

@end
