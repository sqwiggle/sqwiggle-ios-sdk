//
//  SQDynamicMappingRequest.h
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/19/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import <ObjectiveSugar/ObjectiveSugar.h>
#import "SQConstants.h"
#import "SQObject.h"

//Creating for Semantics sake
#define SQWIGGLE_TYPE Class

//More Semantics stuff
#define SQWIGGLE_USER_TYPE [SQUser class]
#define SQWIGGLE_COMPANY_TYPE [SQCompany class]
#define SQWIGGLE_STREAMITEM_TYPE [SQStreamItem class]
#define SQWIGGLE_WORKROOM_TYPE [SQWorkroom class]

@interface SQJuggernaut : NSObject

/* Retreival Methods */
+(void) retreiveItemsOfType:(SQWIGGLE_TYPE)type
              withAuthToken:(NSString *)auth
                    success:(void (^)(NSArray *items))success
                    failure:(void (^)(NSError *error))failure;

+(void) retreiveItemOfType:(SQWIGGLE_TYPE)type
                      byID:(NSNumber *)ID
             withAuthToken:(NSString *)auth
                   success:(void (^)(id item))success
                   failure:(void (^)(NSError *error))failure;

+(void) retreiveItemsOfType:(SQWIGGLE_TYPE)type
                       byID:(NSNumber *)ID
             filteredByType:(SQWIGGLE_TYPE)filter
              withAuthToken:(NSString *)auth
                    success:(void (^)(NSArray *items))success
                    failure:(void (^)(NSError *error))failure;

+(void) retreiveItemOfType:(SQWIGGLE_TYPE)type
                      byID:(NSNumber *)ID
            filteredByType:(SQWIGGLE_TYPE)filter
                    withID:filterID
             withAuthToken:(NSString *)auth
                   success:(void (^)(id item))success
                   failure:(void (^)(NSError *error))failure;

@end
