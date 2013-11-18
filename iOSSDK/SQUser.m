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
    NSLog(@"OH GODWHY");
    return @{@"_ID": @"id", @"_role" : @"role", @"_mode": @"mode",
             @"_status" : @"status", @"_name": @"name",
             @"_email": @"email", @"_confirmed": @"confirmed",
             @"_timeZone": @"time_zone", @"_timeZoneOffset": @"time_zone_offset",
             @"_createdAt": @"created_at", @"_lastActiveAt": @"last_active_at",
             @"_avatar": @"avatar"};
}

-(BOOL) confirmed
{
    return [_confirmed boolValue];
}
@end
