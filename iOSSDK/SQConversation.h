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

#define SQ_CONVERSATION_STATUS_OPEN @"open"
#define SQ_CONVERSATION_STATUS_CLOSED @"closed"

#define COLOR_ONE [UIColor colorWithRed:0.0/255 green:147.0/255 blue:255.0/255.0 alpha:0.65]
#define COLOR_TWO [UIColor colorWithRed:224.0/255 green:78.0/255 blue:97.0/255.0 alpha:0.65]
#define COLOR_THREE [UIColor colorWithRed:224.0/255 green:188.0/255 blue:78.0/255.0 alpha:0.65]
#define COLOR_FOUR [UIColor colorWithRed:0.0/255 green:204.0/255 blue:0.0/255.0 alpha:0.65]
#define COLOR_FIVE [UIColor colorWithRed:159.0/255 green:89.0/255 blue:160.0/255.0 alpha:0.65]

#define COLOR_DEFS @{ @1: COLOR_ONE, @2: COLOR_TWO, @3: COLOR_THREE, @4: COLOR_FOUR, @5: COLOR_FIVE}

@interface SQConversation : SQObject

@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSNumber *organziationID;
@property (nonatomic, copy) NSNumber *roomID;
@property (nonatomic, copy) NSNumber *colorID;
@property (nonatomic, copy) UIColor *color;
// participatingUsers setter and getter methods are declared for KVC compliance.
@property (nonatomic, copy) NSArray *participatingUsersContainer;

//Checks to see if given user is in conversation
-(BOOL) containsUser:(SQUser *)user;
-(NSArray *) participatingUsers;
-(void) setParticipatingUsers:(NSArray *)participatingUsers;

@end
