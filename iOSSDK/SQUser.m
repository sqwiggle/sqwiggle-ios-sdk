//
//  User.m
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import "SQUser.h"


@interface SQUser ()

@property (nonatomic, copy) NSNumber *confirmedObject;

@end

@implementation SQUser

-(NSDictionary *) modelDefinition
{
    return @{@"ID": @"id", @"role" : @"role",
             @"status" : @"status", @"name": @"name",
             @"email": @"email", @"confirmedObject": @"confirmed",
             @"timeZone": @"time_zone", @"timeZoneOffset": @"time_zone_offset",
             @"createdAt": @"created_at", @"lastActiveAt": @"last_active_at",
             @"avatar": @"avatar", @"company": @"company", @"message": @"message" };
}

-(BOOL) confirmed
{
    return [_confirmedObject boolValue];
}

-(BOOL) isEqual:(id)object
{
    return [self.ID isEqualToNumber:((SQUser *)object).ID];
}


@end
