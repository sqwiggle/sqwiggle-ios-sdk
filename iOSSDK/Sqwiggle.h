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
#import "SQRoom.h"
#import "SQNotification.h"
#import "SQInvite.h"
#import "SQConversation.h"

@interface Sqwiggle : NSObject

/* Sqwiggle Session Methods */

//Initializes Sqwiggle API Session Locally.
+(void) startSqwigglingWithUsername:(NSString *) username
                           password:(NSString *) password
                            success:(void (^)(BOOL user))success
                            failure:(void (^)(NSError *error))failure;

//Removes Sqwiggle data from local device
+(void) stopSqwiggling;

//Checks to see if valid authentication token exists
+(BOOL) isLoggedIn;

/* User Methods */

//Current user, stored locally. If nil, call getCurrentUser and currentUser will be automatically updated
+(SQUser *) currentUser;

//Gets authenticated user
+(void) getCurrentUser:(void (^)(SQUser *user))success
               failure:(void (^)(NSError *error))failure;

//Gets all users associated with authenticated user.
+(void) getUserWithID:(NSNumber *)ID
              success:(void (^)(SQUser *user))success
            failure:(void (^)(NSError *error))failure;
                        
//Gets all users associated with authenticated user.
+(void) getAllUsers:(void (^)(NSArray *users))success
                             failure:(void (^)(NSError *error))failure;

/* Room Methods */

//Gets all rooms associated with authenticated user.
+(void) getAllRooms:(void (^)(NSArray *rooms))success
                failure:(void (^)(NSError *error))failure;

//Gets all users associated with authenticated user.
+(void) getRoomWithID:(NSNumber *)ID
              success:(void (^)(SQRoom *user))success
              failure:(void (^)(NSError *error))failure;

//Gets all StreamItems associated with RoomID
+(void) getStreamItemsForRoomID:(NSNumber *)ID
                             success:(void (^)(NSArray *user))success
                             failure:(void (^)(NSError *error))failure;
@end