//
//  User.m
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import "SQUser.h"


@interface SQUser ()
{
    NSNumber *_confirmed;
}
@end

@implementation SQUser


-(NSDictionary *) modelDefinition
{
    return @{_id: @"id", _role : @"role", _mode: @"mode",
             _status : @"status", _name: @"name",
             _email: @"email", _confirmed: @"confirmed",
             _timeZone: @"timezone", _timeZoneOffset: @"time_zone_offset",
             _createdAt: @"created_at", _lastActiveAt: @"last_active_at",
             _avatar: @"avatar"};
}

-(BOOL) confirmed
{
    return [_confirmed boolValue];
}
@end
