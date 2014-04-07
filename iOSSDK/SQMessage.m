//
//  StreamItem.m
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import "SQMessage.h"


@implementation SQMessage

-(NSDictionary *) modelDefinition
{
    return @{@"ID": @"id", @"_updatedAt" : @"updated_at", @"createdAt": @"created_at",
             @"roomID" : @"room_id", @"mentions": @"mentions",
             @"message": @"message", @"user": @"user"};
}

@end
