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
    return @{@"_ID": @"id", @"_createdByID" : @"user_id", @"_name": @"name",
             @"_path" : @"path", @"_userCount": @"user_count"};
}


@end
