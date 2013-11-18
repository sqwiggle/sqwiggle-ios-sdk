//
//  Workroom.m
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import "SQWorkroom.h"

@implementation SQWorkroom

-(NSDictionary *) modelDefinition
{
    return @{@"_ID": @"id", @"_createdByID" : @"user_id", @"_name": @"name",
             @"_path" : @"address", @"_userCount": @"user_count"};
    
}
@end
