//
//  Sqwiggle.h
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/12/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SQObject.h"
#import "SQCompany.h"
#import "SQUser.h"
#import "SQStreamItem.h"
#import "SQWorkroom.h"
#import "SQNotification.h"
#import "SQInvite.h"
#import "SQConversation.h"

//Creating for Semantics sake
#define SqwiggleType Class

//More Semantics stuff
#define SQWIGGLE_USER_TYPE [SQUser class]
#define SqwiggleCompany [SQCompany class]
#define SqwiggleStreamItem [SQStreamItem class]
#define SqwiggleWorkroom [SQWorkroom class]


@interface Sqwiggle : NSObject

//Initializes Sqwiggle API Session Locally.
+(void) startSqwigglingWithUsername:(NSString *) username
                           password:(NSString *) password
                            success:(void (^)(BOOL resp))success
                            failure:(void (^)(NSError *error))failure;

//Removes Sqwiggle data from local device
+(void) stopSqwiggling;

/* Retreival Methods */
+(void) retrieveItemsOfType:(SqwiggleType)type
            success:(void (^)(NSArray *items))success
            failure:(void (^)(NSError *error))failure;

+(void) retreiveItemOfType:(SqwiggleType)type
                      byID:(NSNumber *)ID
                   success:(void (^)(id item))success
                   failure:(void (^)(NSError *error))failure;


@end