//
//  Conversation.h
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SQRoom.h"
#import "SQOrganization.h"

@interface SQConversation : SQObject

@property (nonatomic, readonly) NSNumber *organziationID;
@property (nonatomic, readonly) NSNumber *roomID;
@property (nonatomic, readonly) NSNumber *colorID;
@property (nonatomic, readonly) NSArray *participatingUsers;

//Checks to see if given user is in conversation
-(BOOL) containsUser:(SQUser *)user;

@end
