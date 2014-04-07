//
//  StreamItem.m
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import "SQMessage.h"

@interface SQMessage ()
{
    NSDate *_createdAt;
    NSDate *_updatedAt;
    NSNumber *_roomID;
    NSNumber *_organziationID;
    NSArray *_mentions;
    NSString *_message;
    SQUser *_user;
}

@end

@implementation SQMessage
@synthesize createdAt = _createdAt;
@synthesize updatedAt = _updatedAt;
@synthesize roomID = _roomID;
@synthesize organziationID = _organziationID;
@synthesize mentions = _mentions;
@synthesize message = _message;
@synthesize user;

-(NSDictionary *) modelDefinition
{
    return @{@"_ID": @"id", @"_updatedAt" : @"updated_at", @"_createdAt": @"created_at",
             @"_roomID" : @"room_id", @"_mentions": @"mentions",
             @"_message": @"message", @"_user": @"user"};
}

@end
