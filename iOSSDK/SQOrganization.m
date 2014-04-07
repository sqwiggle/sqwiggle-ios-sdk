//
//  Company.m
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import "SQOrganization.h"


@implementation SQOrganization

-(NSDictionary *) modelDefinition
{
    return @{@"ID": @"id", @"createdAt": @"created_at", @"name": @"name",
             @"ownerID": @"owner_id", @"path": @"path",
             @"billing": @"billing", @"security": @"security"};
}

@end
