//
//  StreamItem.m
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import "SQStreamItem.h"

@implementation SQStreamItem

-(NSDictionary *) modelDefinition
{
    return @{@"_ID": @"id", @"_updatedAt" : @"updated_at", @"_createdAt": @"created_at",
             @"_workRoomID" : @"workroom_id", @"_mentions": @"mentions",
             @"_messagePlain": @"message", @"_userID": @"user_id"};
}

@end
