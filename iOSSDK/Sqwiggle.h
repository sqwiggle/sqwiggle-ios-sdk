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

@interface Sqwiggle : NSObject

/* Sqwiggle Session Methods */

//Initializes Sqwiggle API Session Locally.
+(void) startSqwigglingWithUsername:(NSString *) username
                           password:(NSString *) password
                            success:(void (^)(BOOL resp))success
                            failure:(void (^)(NSError *error))failure;

//Removes Sqwiggle data from local device
+(void) stopSqwiggling;


/* User Methods */

//Gets all users associated with authenticated user.
+(void) getAllUsers:(void (^)(NSArray *users))success
            failure:(void (^)(NSError *error))failure;

//Gets all users associated with authenticated user.
+(void) getUserWithID:(NSNumber *)ID
              success:(void (^)(SQUser *user))success
            failure:(void (^)(NSError *error))failure;


/* Workroom Methods */

//Gets all workrooms associated with authenticated user.
+(void) getAllWorkrooms:(void (^)(NSArray *workrooms))success
                failure:(void (^)(NSError *error))failure;

//Gets all users associated with authenticated user.
+(void) getWorkroomWithID:(NSNumber *)ID
              success:(void (^)(SQWorkroom *user))success
              failure:(void (^)(NSError *error))failure;

//Gets all StreamItems associated with WorkroomID
+(void) getStreamItemsWithWorkroomID:(NSNumber *)ID
                             success:(void (^)(NSArray *user))success
                             failure:(void (^)(NSError *error))failure;


@end