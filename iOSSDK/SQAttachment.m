//
//  SQAttachment.m
//  SqwiggleSDK
//
//  Created by Cameron Webb on 1/13/14.
//  Copyright (c) 2014 Sqwiggle. All rights reserved.
//

#import "SQAttachment.h"


@implementation SQAttachment

-(NSDictionary *) modelDefinition
{
    return @{@"ID": @"id", @"url" : @"url", @"title": @"title",
             @"description": @"description",
             @"image": @"image", @"status": @"status"};
}

@end
