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
    return @{_id: @"id", _createdByID : @"owner_id", _name: @"name",
             _path : @"path"};
}
@end
