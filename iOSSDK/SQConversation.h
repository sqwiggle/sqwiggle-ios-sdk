//
//  Conversation.h
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SQRoom.h"
#import "SQCompany.h"

@interface SQConversation : SQObject

@property (nonatomic, readonly) NSNumber *companyID;
@property (nonatomic, strong) NSNumber *roomID;
@property (nonatomic, strong) NSNumber *colorID;
@property (nonatomic, strong) NSArray *participatingUsers;

-(BOOL) containsUser:(SQUser *)user;

@end
