//
//  SQContact.m
//  SqwiggleSDK
//
//  Created by Cameron Webb on 5/5/14.
//  Copyright (c) 2014 Sqwiggle. All rights reserved.
//

#import "SQContact.h"

@implementation SQContact

-(NSDictionary *) modelDefinition
{
    return @{@"ID": @"id", @"state" : @"contact.state",
             @"createdAt": @"created_at"};
}
@end
