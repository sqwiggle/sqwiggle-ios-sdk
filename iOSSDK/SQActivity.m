//
//  SQActivity.m
//  SqwiggleSDK
//
//  Created by Cameron Webb on 4/24/14.
//  Copyright (c) 2014 Sqwiggle. All rights reserved.
//

#import "SQActivity.h"

@implementation SQActivity

-(NSDictionary *) modelDefinition
{
    return @{@"ID": @"id", @"recipients" : @"recipient_ids", @"message": @"message",
             @"subjectID": @"subject_id",
             @"subjectType": @"subject_type"};
}

@end
