//
//  Room.m
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import "SQRoom.h"

@interface SQRoom ()
{
    NSNumber *_createdByID;
    NSString *_name;
    NSString *_path;
    NSNumber *_userCount;
}
@end

@implementation SQRoom
@synthesize createdByID = _createdByID;
@synthesize name = _name;
@synthesize path = _path;
@synthesize userCount;

-(NSDictionary *) modelDefinition
{
    return @{@"_ID": @"id", @"_createdByID" : @"user_id", @"_name": @"name",
             @"_path" : @"path", @"_userCount": @"user_count"};
}

@end
