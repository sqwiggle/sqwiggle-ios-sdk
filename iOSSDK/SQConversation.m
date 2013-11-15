//
//  Conversation.m
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import "SQConversation.h"

@implementation SQConversation

-(NSDictionary *) modelDefinition
{
    return @{_ID: @"id", _companyID: @"company_id", _colorID: @"color_id",
             _workroomID: @"workroom_id", _users: @"users"};
}

@end
