//
//  SQDynamicMappingRequest.h
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/19/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SQConstants.h"

@class AFHTTPRequestOperation;
@class AFURLConnectionOperation;
@class AFURLSessionManager;


@interface SQJuggernaut : NSObject

/* Retreival Methods */
+(void) retreiveItemsOfType:(SQWIGGLE_TYPE)type
              withAuthToken:(NSString *)auth
                    success:(void (^)(id items))success
                    failure:(void (^)(NSError *error))failure;

+(void) retreiveItemOfType:(SQWIGGLE_TYPE)type
                      byID:(id)ID
             withAuthToken:(NSString *)auth
                   success:(void (^)(id item))success
                   failure:(void (^)(NSError *error))failure;

+(void) retreiveItemsOfType:(SQWIGGLE_TYPE)type
             filteredByType:(SQWIGGLE_TYPE)filterType
                     withID:(NSNumber *)filterID
              withAuthToken:(NSString *)auth
                    success:(void (^)(NSArray *items))success
                    failure:(void (^)(NSError *error))failure;

+(void) retreiveItemOfType:(SQWIGGLE_TYPE)type
                      byID:(id)ID
            filteredByType:(SQWIGGLE_TYPE)filterType
                    withID:filterID
             withAuthToken:(NSString *)auth
                   success:(void (^)(id item))success
                   failure:(void (^)(NSError *error))failure;

@end
