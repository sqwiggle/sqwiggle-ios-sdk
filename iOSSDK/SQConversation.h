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

#define COLOR_ONE [UIColor colorWithRed:0.0/255 green:147.0/255 blue:255.0/255.0 alpha:0.45]
#define COLOR_TWO [UIColor colorWithRed:224.0/255 green:78.0/255 blue:97.0/255.0 alpha:0.45]
#define COLOR_THREE [UIColor colorWithRed:224.0/255 green:188.0/255 blue:78.0/255.0 alpha:0.45]
#define COLOR_FOUR [UIColor colorWithRed:0.0/255 green:204.0/255 blue:0.0/255.0 alpha:0.45]
#define COLOR_FIVE [UIColor colorWithRed:159.0/255 green:89.0/255 blue:160.0/255.0 alpha:0.45]

#define COLOR_DEFS @{ @1: COLOR_ONE, @2: COLOR_TWO, @3: COLOR_THREE, @4: COLOR_FOUR, @5: COLOR_FIVE}

@interface SQConversation : SQObject

@property (nonatomic, readonly) NSNumber *organziationID;
@property (nonatomic, readonly) NSNumber *roomID;
@property (nonatomic, readonly) NSNumber *colorID;
@property (nonatomic, readonly) UIColor *color;
@property (nonatomic, readonly) NSArray *participatingUsers;

//Checks to see if given user is in conversation
-(BOOL) containsUser:(SQUser *)user;

@end
