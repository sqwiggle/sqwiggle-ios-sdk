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
#import "SQOrganization.h"
#import "SQUser.h"
#import "SQMessage.h"
#import "SQRoom.h"
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

//Current authentication token
+(NSString *) authToken;

/* User Methods */

//Current user, stored locally. If nil, call getCurrentUser and currentUser will be automatically updated
+(SQUser *) currentUser;

//Current rooms, stored locally. If nil, call allRooms and the variable will be automatically updated.
+(NSArray *) currentUserRooms;

//Retreives authenticated user
+(void) currentUserForSession:(void (^)(SQUser *user))success
                      failure:(void (^)(NSError *error))failure;

//Retreives all users associated with authenticated user.
+(void) userWithID:(NSNumber *)ID
           success:(void (^)(SQUser *user))success
           failure:(void (^)(NSError *error))failure;
                        
//Retreives all users associated with authenticated user.
+(void) allUsers:(void (^)(NSArray *users))success
         failure:(void (^)(NSError *error))failure;

/* Room Methods */

//Retreives all rooms associated with authenticated user.
+(void) allRooms:(void (^)(NSArray *rooms))success
         failure:(void (^)(NSError *error))failure;

//Retreives all users associated with authenticated user.
+(void) roomWithID:(NSNumber *)ID
           success:(void (^)(SQRoom *user))success
           failure:(void (^)(NSError *error))failure;

//Retreives all Messages associated with RoomID
+(void) messagesForRoomID:(NSNumber *)ID
                  success:(void (^)(NSArray *user))success
                  failure:(void (^)(NSError *error))failure;


@end