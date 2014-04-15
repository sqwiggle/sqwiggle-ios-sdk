//
//  SQDynamicMappingRequest.h
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/19/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SQConstants.h"

#define ENDPOINT_KEY @"SQJUGGARNAUT_ENDPOINT_KEY"

@class AFHTTPRequestOperation;
@class AFURLConnectionOperation;
@class AFURLSessionManager;


@interface SQJuggernaut : NSObject

/* Retreival Methods */
+(void) retreiveItemsOfType:(SQWIGGLE_TYPE)type
				  mapToType:(SQWIGGLE_TYPE)mapType
                 parameters:(NSDictionary *)parameters
                  authToken:(id)auth
                    success:(void (^)(id items))success
                    failure:(void (^)(NSError *error))failure;

+(void) retreiveItemOfType:(SQWIGGLE_TYPE)type
				 mapToType:(SQWIGGLE_TYPE)mapType
                      byID:(id)ID
                parameters:(NSDictionary *)parameters
                 authToken:(NSString *)auth
                   success:(void (^)(id item))success
                   failure:(void (^)(NSError *error))failure;

+(void) retreiveItemsOfType:(SQWIGGLE_TYPE)type
                 parameters:(NSDictionary *)parameters
                  authToken:(id)auth
                    success:(void (^)(id items))success
                    failure:(void (^)(NSError *error))failure;

+(void) retreiveItemOfType:(SQWIGGLE_TYPE)type
                      byID:(id)ID
                parameters:(NSDictionary *)parameters
                 authToken:(NSString *)auth
                   success:(void (^)(id item))success
                   failure:(void (^)(NSError *error))failure;


+(void) sendItemOfType:(SQWIGGLE_TYPE)type
			parameters:(NSDictionary *)parameters
			 authToken:(NSString *)auth
			   success:(void (^)(id item))success
			   failure:(void (^)(NSError *error))failure;

+(void) sendItemOfType:(SQWIGGLE_TYPE)type
				  byID:(id)ID
			parameters:(NSDictionary *)parameters
			 authToken:(NSString *)auth
			   success:(void (^)(id item))success
			   failure:(void (^)(NSError *error))failure;

/*
 * Sets current API Endpoint you are using.
 */
+(void) setAPIEndpoint:(NSString *)endpoint;

/*
 * Returns current API endpoint used in class.
 */
+(NSString *) currentAPIEndpoint;

@end
