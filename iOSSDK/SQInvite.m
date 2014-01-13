//
//  Invite.m
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import "SQInvite.h"

@interface SQInvite ()
{
    NSNumber *_fromID;
    NSDate *_createdAt;
    NSString *_email;
    NSString *_avatar;
    NSString *_path;
}
@end

@implementation SQInvite
@synthesize fromID = _fromID;
@synthesize createdAt = _createdAt;
@synthesize email = _email;
@synthesize avatar = _avatar;
@synthesize path = _path;

-(NSDictionary *) modelDefinition
{
    return @{@"_ID": @"id", @"_fromID": @"from_id",
            @"_createdAt": @"created_at", @"_email": @"email",
             @"_avatar": @"avatar", @"_path": @"path"};
}

@end
