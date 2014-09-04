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

#define COLOR_ONE [UIColor colorWithRed:0.0/255 green:64.0/255 blue:134.0/255.0 alpha:1]
#define COLOR_TWO [UIColor colorWithRed:221.0/255 green:48.0/255 blue:70.0/255.0 alpha:1]
#define COLOR_THREE [UIColor colorWithRed:204.0/255 green:162.0/255 blue:34.0/255.0 alpha:1]
#define COLOR_FOUR [UIColor colorWithRed:43.0/255 green:172.0/255 blue:0.0/43.0 alpha:1]
#define COLOR_FIVE [UIColor colorWithRed:155.0/255 green:60.0/255 blue:156.0/255.0 alpha:1]

#define COLOR_DEFS @{ @1: COLOR_ONE, @2: COLOR_TWO, @3: COLOR_THREE, @4: COLOR_FOUR, @5: COLOR_FIVE}

@interface SQConversation : SQObject

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
