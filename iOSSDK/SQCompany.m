//
//  Company.m
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import "SQCompany.h"

@interface SQCompany ()
{
    NSDate *_createdAt;
    NSNumber *_ownerID;
    NSString *_name;
    NSString *_path;
    NSDictionary *_billing;
    NSDictionary *_security;
}
@end

@implementation SQCompany

-(NSDictionary *) modelDefinition
{
    return @{@"_ID": @"id", @"_createdAt": @"created_at", @"_name": @"name",
             @"_ownerID": @"owner_id", @"_path": @"path",
             @"_billing": @"billing", @"_security": @"security"};
}

@end
