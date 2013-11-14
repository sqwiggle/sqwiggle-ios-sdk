//
//  User.m
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import "SQUser.h"


@interface SQUser ()
//Helper method to handle media mode
{
    NSNumber *_confirmed;
}

-(NSDictionary *) modelDefinition;
@end

@implementation SQUser


/*@property (nonatomic, readonly) NSString *role;
 @property (nonatomic, readonly) enum MediaMode *mode;
 @property (nonatomic, readonly) NSString *status;
 @property (nonatomic, readonly) NSString *name;
 @property (nonatomic, readonly) NSString *email;
 @property (nonatomic, readonly) BOOL confirmed;
 @property (nonatomic, readonly) NSTimeZone *timeZone;
 @property (nonatomic, readonly) float timeZoneOffset;
 @property (nonatomic, readonly) NSDate *createdAt;
 @property (nonatomic, readonly) NSDate *lastActiveAt;
 @property (nonatomic, readonly) NSURL *avatar;*/


-(NSDictionary *) modelDefinition
{
    return @{_role : @"role", _mode: @"mode",
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
