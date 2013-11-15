//
//  Invite.m
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import "SQInvite.h"

@implementation SQInvite

-(NSDictionary *) modelDefinition
{
    return @{_ID: @"id", _fromID: @"from_id",
             _createdAt: @"created_at", _email: @"email",
             _avatar: @"avatar", _path: @"path"};
}

@end
