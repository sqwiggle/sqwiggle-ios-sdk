//
//  Sqwiggle.h
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/12/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SQCompany.h"
#import "SQUser.h"
#import "SQStreamItem.h"
#import "SQWorkroom.h"
#import "SQNotification.h"
#import "SQInvite.h"
#import "SQConversation.h"


@interface Sqwiggle : NSObject

//Initializes Sqwiggle API Session. If token is valid, currentCompany is set via API request
+(void) startSqwigglingWithToken:(NSString *) token;

//Removes Sqwiggle data from local device
+(void) stopSqwiggling;

/* User Methods */
+(NSArray *) getUsers;
+(SQUser *) getUserByID:(NSNumber *)id;

/* Company Methods */
+(SQCompany *) getCompany;

/* Workroom Methods */
+(NSArray *) getWorkrooms;
+(SQWorkroom *) getWorkroomByID:(NSNumber *)id;

/* Stream Methods */
+(SQStreamItem *) getStreamItems;



@end