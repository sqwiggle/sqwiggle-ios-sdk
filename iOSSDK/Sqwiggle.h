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

//Creating for Semantics sake
#define SqwiggleType Class

//More Semantics stuff
#define SqwiggleUser [SQUser class]
#define SqwiggleCompany [SQCompany class]
#define SqwiggleStreamItem [SQStreamItem class]
#define SqwiggleWorkroom [SQWorkroom class]


@interface Sqwiggle : NSObject

//Initializes Sqwiggle API Session. If token is valid, currentCompany is set via API request
+(void) startSqwigglingWithToken:(NSString *) token;

//Removes Sqwiggle data from local device
+(void) stopSqwiggling;

/* Retreival Methods */
+(id) retreiveItemsOfType:(SqwiggleType)type;
+(id) retreiveItemOfType:(SqwiggleType)type byID:(NSNumber *)id;


@end