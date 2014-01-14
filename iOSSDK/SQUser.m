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
    NSString *_role;
    NSString *_mode;
    NSString *_status;
    NSNumber *_roomID;
    NSString *_name;
    NSString *_email;
    NSTimeZone *_timeZone;
    NSNumber *_timeZoneOffset;
    NSDate *_createdAt;
    NSDate *_lastActiveAt;
    NSString *_avatar;
    id _company;
}
@end

@implementation SQUser

@synthesize role = _role;
@synthesize mode = _mode;
@synthesize status = _status;
@synthesize roomID = _roomID;
@synthesize name = _name;
@synthesize email = _email;
@synthesize timeZone = _timeZone;
@synthesize timeZoneOffset = _timeZoneOffset;
@synthesize createdAt = _createdAt;
@synthesize lastActiveAt = _lastActiveAt;
@synthesize avatar = _avatar;
@synthesize company = _company;

-(NSDictionary *) modelDefinition
{
    return @{@"_ID": @"id", @"_role" : @"role", @"_mode": @"mode",
             @"_status" : @"status", @"_name": @"name",
             @"_email": @"email", @"_confirmed": @"confirmed",
             @"_timeZone": @"time_zone", @"_timeZoneOffset": @"time_zone_offset",
             @"_createdAt": @"created_at", @"_lastActiveAt": @"last_active_at",
             @"_avatar": @"avatar", @"_company": @"company" };
}

-(BOOL) confirmed
{
    return [_confirmed boolValue];
}

@end
