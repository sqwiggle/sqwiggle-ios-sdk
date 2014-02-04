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
#import "SQConfiguration.h"
#import "SQAttachment.h"

@interface Sqwiggle : NSObject

#pragma Sqwiggle Session Methods

//Initializes Sqwiggle API Session Locally.
+(void) startSqwigglingWithUsername:(NSString *) username
                           password:(NSString *) password
                            success:(void (^)(BOOL user))success
                            failure:(void (^)(NSError *error))failure;

+(void) startSqwigglingWithAuthenticationToken:(NSString *)authToken;

//Removes Sqwiggle data from local device
+(void) stopSqwiggling;

//Checks to see if valid authentication token exists
+(BOOL) isLoggedIn;

//Current authentication token
+(NSString *) authToken;


#pragma mark User Methods

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


#pragma mark Attachment Methods
/*
 * Updates the specified attachment by setting the values of the parameters passed. 
 * Note that changes made via the API will be immediately reflected in the interface of all connected clients.
 */
+(void) getAttachmentByID:(NSNumber *)ID
                  success:(void (^)(SQAttachment *attachment))success
                  failure:(void (^)(NSError *error))failure;

/*
 * Returns a list of all attachments in the current organization. 
 * The attachments are returned in reverse date order by default.
 */
+(void) allAttachmentsWithLimit:(NSNumber *)limit
                        success:(void (^)(NSArray *rooms))success
                        failure:(void (^)(NSError *error))failure;


#pragma mark Room Methods

/*
 * Returns a list of all rooms in the current organization. 
 * The rooms are returned in sorted alphabetical order by default.
 */
+(void) allRooms:(void (^)(NSArray *rooms))success
         failure:(void (^)(NSError *error))failure;

/* 
 * Retrieves the details of any room that the token has access to. 
 * Supply a room ID and Sqwiggle will return the corresponding room details.
 */
+(void) roomWithID:(NSNumber *)ID
           success:(void (^)(SQRoom *room))success
           failure:(void (^)(NSError *error))failure;

//Retreives all Messages associated with RoomID
+(void) messagesForRoomID:(NSNumber *)ID
                  success:(void (^)(NSArray *user))success
                  failure:(void (^)(NSError *error))failure;


#pragma mark Organization Methods
/*
 * Returns a list of all organizations the current token has access to. 
 * At this time each user can only belong to a single organization and 
 * all API requests are scoped by a single organization.
 */
+(void) allOrganizations:(void (^)(NSArray *rooms))success
                 failure:(void (^)(NSError *error))failure;

/* 
 * Retrieves the details of any organization that the token has access to. 
 * At this time each user can only belong to a single organization and 
 * all API requests are scoped by a single organization.
 */
+(void) organizationWithID:(NSNumber *)ID
                   success:(void (^)(SQOrganization *organization))success
                   failure:(void (^)(NSError *error))failure;


#pragma mark Conversation Methods
/*
 * Returns a list of all conversations within the organization
 * associated with the provided token. This includes both finished and ongoing.
 */
+(void) allConversations:(void (^)(NSArray *conversations))success
                 failure:(void (^)(NSError *error))failure;

/*
 * Retrieves the details of a specific conversation provided the conversation is accessible 
 * via the provided token. Supply a conversation ID and Sqwiggle will return the 
 * corresponding conversation information.
 */
+(void) conversationWithID:(NSNumber *)ID
                   success:(void (^)(SQConversation *conversation))success
                   failure:(void (^)(NSError *error))failure;


#pragma mark Invite Methods
/* 
 * Returns a list of all outstanging invites in the current organization. 
 */
+(void) allInvites:(void (^)(NSArray *rooms))success
           failure:(void (^)(NSError *error))failure;

/*
 * Retrieves the details of any invite that has been previously created. 
 * Supply an invite ID to get details of the invite.
 */
+(void) inviteWithID:(NSNumber *)ID
                   success:(void (^)(SQInvite *invite))success
                   failure:(void (^)(NSError *error))failure;


#pragma mark Configuration Methods

/*
 * Returns configuration information for Sqwiggle clients, such as where to store file uploads, 
 * limits, ice servers and other misc details that are required.
 */ 
+(void) configurationInfoForCurrentSession:(void (^)(SQConfiguration *))success
                                   failure:(void (^)(NSError *error))failure;

@end