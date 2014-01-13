//
//  Company.m
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import "SQOrganization.h"

@interface SQOrganization ()
{
    NSDate *_createdAt;
    NSNumber *_ownerID;
    NSString *_name;
    NSString *_path;
    NSDictionary *_billing;
    NSDictionary *_security;
}
@end

@implementation SQOrganization
@synthesize createdAt = _createdAt;
@synthesize ownerID = _ownerID;
@synthesize name = _name;
@synthesize path = _path;
@synthesize billing = _billing;
@synthesize security = _security;

-(NSDictionary *) modelDefinition
{
    return @{@"_ID": @"id", @"_createdAt": @"created_at", @"_name": @"name",
             @"_ownerID": @"owner_id", @"_path": @"path",
             @"_billing": @"billing", @"_security": @"security"};
}

@end
