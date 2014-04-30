//
//  SQStream.m
//  SqwiggleSDK
//
//  Created by Johnny Chan on 4/22/14.
//  Copyright (c) 2014 Sqwiggle. All rights reserved.
//

#import "SQStream.h"

@implementation SQStream

- (NSDictionary*)modelDefinition
{
    return @{@"ID": @"id",
			 @"name": @"name",
             @"icon" : @"icon",
			 @"color" : @"color",
			 @"subscribed": @"subscribed"};
}

@end
