//
//  SQDynamicMappingRequest.m
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/19/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import "SQJuggernaut.h"
#import "SQObject.h"

@implementation SQJuggernaut
#warning I bet you $10 you can reduce the functions

+(void) retreiveItemsOfType:(SQWIGGLE_TYPE)type
              withAuthToken:(id)auth
                    success:(void (^)(id items))success
                    failure:(void (^)(NSError *error))failure
{
    [self retreiveItemOfType:type
                        byID:nil
               withAuthToken:auth
                     success:success
                     failure:failure];
}

+(void) retreiveItemOfType:(SQWIGGLE_TYPE)type
                      byID:(id)ID
             withAuthToken:(NSString *)auth
                   success:(void (^)(id item))success
                   failure:(void (^)(NSError *error))failure
{
    NSString *relativeURL = [SQWIGGLE_RELATIVE_URLS objectForKey:type];
    
    NSString *url = [NSString stringWithFormat:@"%@/%@/%@", SQWIGGLE_URI_API,
                     relativeURL, (ID ? ID : @"")];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setRequestSerializer:[AFHTTPRequestSerializer serializer]];
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:auth password:SUPER_SECRET_PASSWORD];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (!ID)
        {
            NSMutableArray *responseObjects = [NSMutableArray new];
            
            if ([responseObject respondsToSelector:@selector(objectForKey:)])
            {
                success([NSClassFromString(type) objectWithDictionary:responseObject]);
            }
            
            else
            {
                [responseObject each:^(id object) {
                    [responseObjects push:[NSClassFromString(type) objectWithDictionary:object]];
                }];
                success(responseObjects);
            }
        }
        else
        {
            success([NSClassFromString(type) performSelector:@selector(objectWithDictionary:)
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
        NSString *relativeURL = [SQWIGGLE_RELATIVE_URLS objectForKey:filterType];
        NSString *secondaryRelativeURL = [SQWIGGLE_RELATIVE_URLS objectForKey:type];
        
        NSString *url = [NSString stringWithFormat:@"%@/%@/%@/%@/%@", SQWIGGLE_URI_API,
                         relativeURL, filterID, secondaryRelativeURL, (ID ? ID : @"")];
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager setRequestSerializer:[AFHTTPRequestSerializer serializer]];
        [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
        [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:auth password:SUPER_SECRET_PASSWORD];
        [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            if (!ID)
            {
                NSMutableArray *responseObjects = [NSMutableArray new];
                [responseObject each:^(id object) {
                    [responseObjects push:[NSClassFromString(type) objectWithDictionary:object]];
                }];
                success(responseObjects);
            }
            else
            {
                success([NSClassFromString(type) performSelector:@selector(objectWithDictionary:)
                                   withObject:responseObject]);
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            failure(error);
        }];
    }
}

@end
