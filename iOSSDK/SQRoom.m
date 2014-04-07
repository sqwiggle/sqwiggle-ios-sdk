//
//  Room.m
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import "SQRoom.h"

@implementation SQRoom

-(NSDictionary *) modelDefinition
{
    return @{@"ID": @"id", @"createdByID" : @"user_id", @"name": @"name",
             @"path" : @"path", @"userCount": @"user_count"};
}

@end
