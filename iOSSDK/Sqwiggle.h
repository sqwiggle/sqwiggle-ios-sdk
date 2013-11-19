//
//  Sqwiggle.h
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/12/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ObjectiveSugar/ObjectiveSugar.h>
#import "SQObject.h"
#import "SQCompany.h"
#import "SQUser.h"
#import "SQStreamItem.h"
#import "SQWorkroom.h"
#import "SQNotification.h"
#import "SQInvite.h"
#import "SQConversation.h"

//Creating for Semantics sake
#define SQWIGGLE_TYPE Class

//More Semantics stuff
#define SQWIGGLE_USER_TYPE [SQUser class]
#define SQWIGGLE_COMPANY_TYPE [SQCompany class]
#define SQWIGGLE_STREAMITEM_TYPE [SQStreamItem class]
#define SQWIGGLE_WORKROOM_TYPE [SQWorkroom class]


@interface Sqwiggle : NSObject

//Initializes Sqwiggle API Session Locally.
+(void) startSqwigglingWithUsername:(NSString *) username
                           password:(NSString *) password
                            success:(void (^)(BOOL resp))success
                            failure:(void (^)(NSError *error))failure;

//Removes Sqwiggle data from local device
+(void) stopSqwiggling;

/* Retreival Methods */
+(void) retrieveItemsOfType:(SQWIGGLE_TYPE)type
            success:(void (^)(NSArray *items))success
            failure:(void (^)(NSError *error))failure;

+(void) retreiveItemOfType:(SQWIGGLE_TYPE)type
                      byID:(NSNumber *)ID
                   success:(void (^)(id item))success
                   failure:(void (^)(NSError *error))failure;


@end