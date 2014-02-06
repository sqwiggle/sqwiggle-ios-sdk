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

+(void) retreiveItemsOfType:(SQWIGGLE_TYPE)type
              authToken:(id)auth
                    success:(void (^)(id items))success
                    failure:(void (^)(NSError *error))failure
{
    [self retreiveItemOfType:type
                        byID:nil
               authToken:auth
                     success:success
                     failure:failure];
}

+(void) retreiveItemOfType:(SQWIGGLE_TYPE)type
                      byID:(id)ID
             authToken:(NSString *)auth
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


@end
