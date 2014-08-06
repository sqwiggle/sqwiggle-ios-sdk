//
//  SQConfiguration.m
//  SqwiggleSDK
//
//  Created by Cameron Webb on 2/2/14.
//  Copyright (c) 2014 Sqwiggle. All rights reserved.
//

#import "SQConfiguration.h"


@implementation SQConfiguration


-(NSDictionary *) modelDefinition
{
    return @{@"iceServers": @"iceservers", @"storage": @"storage", \
             @"maxUploadFilesize": @"max_upload_filesize", \
             @"releases": @"releases"};
}

@end
