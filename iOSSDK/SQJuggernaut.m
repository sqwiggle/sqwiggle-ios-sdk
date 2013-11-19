//
//  SQDynamicMappingRequest.m
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/19/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import "SQJuggernaut.h"

@implementation SQJuggernaut

+(void) retreiveItemsOfType:(SQWIGGLE_TYPE)type
              withAuthToken:(NSString *)auth
                    success:(void (^)(NSArray *items))success
                    failure:(void (^)(NSError *error))failure
{
    [self retreiveItemOfType:type
                        byID:nil
               withAuthToken:auth
                     success:success
                     failure:failure];
}

+(void) retreiveItemOfType:(SQWIGGLE_TYPE)type
                      byID:(NSNumber *)ID
             withAuthToken:(NSString *)auth
                   success:(void (^)(id item))success
                   failure:(void (^)(NSError *error))failure
{
    NSString *relativeURL = [SQWIGGLE_RELATIVE_URLS objectForKey:NSStringFromClass(type)];
    
    NSString *url = [NSString stringWithFormat:@"%@/%@/%@", SQWIGGLE_URI_API,
                     relativeURL, (ID ? ID : @"")];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setRequestSerializer:[AFHTTPRequestSerializer serializer]];
    [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:auth
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

+(void) retreiveItemsOfType:(SQWIGGLE_TYPE)type
             filteredByType:(SQWIGGLE_TYPE)filterType
                     withID:(NSNumber *)filterID
              withAuthToken:(NSString *)auth
                    success:(void (^)(NSArray *items))success
                    failure:(void (^)(NSError *error))failure
{
    [self retreiveItemOfType:type
                        byID:nil
              filteredByType:filterType
                      withID:filterID
               withAuthToken:(NSString *)auth
                     success:success
                     failure:failure];
}
+(void) retreiveItemOfType:(SQWIGGLE_TYPE)type
                      byID:(NSNumber *)ID
            filteredByType:(SQWIGGLE_TYPE)filterType
                    withID:filterID
             withAuthToken:(NSString *)auth
                   success:(void (^)(id item))success
                   failure:(void (^)(NSError *error))failure
{
    {
        NSString *relativeURL = [SQWIGGLE_RELATIVE_URLS objectForKey:NSStringFromClass(filterType)];
        NSString *secondaryRelativeURL = [SQWIGGLE_RELATIVE_URLS objectForKey:NSStringFromClass(type)];
        
        NSString *url = [NSString stringWithFormat:@"%@/%@/%@/%@/%@", SQWIGGLE_URI_API,
                         relativeURL, ID, secondaryRelativeURL, (ID ? ID : @"")];
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager setRequestSerializer:[AFHTTPRequestSerializer serializer]];
        [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:auth
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
}

@end
