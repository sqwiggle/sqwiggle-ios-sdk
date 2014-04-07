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
    return @{@"ID": @"id", @"fromID": @"from_id",
            @"createdAt": @"created_at", @"email": @"email",
             @"avatar": @"avatar", @"path": @"path"};
}

@end
