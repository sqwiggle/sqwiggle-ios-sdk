//
//  SQConfiguration.m
//  SqwiggleSDK
//
//  Created by Cameron Webb on 2/2/14.
//  Copyright (c) 2014 Sqwiggle. All rights reserved.
//

#import "SQConfiguration.h"

@interface SQConfiguration ()
{
    NSMutableArray *_iceServers;
    NSMutableDictionary *_storage;
    NSString *_maxUploadFilesize;
}

@end

@implementation SQConfiguration

@synthesize iceServers=_iceServers;
@synthesize storage=_storage;
@synthesize maxUploadFilesize=_maxUploadFilesize;


-(NSDictionary *) modelDefinition
{
    return @{@"_iceServers": @"iceservers", @"_storage": @"storage", \
             @"_maxUploadFilesize": @"max_upload_filesize"};
}

@end
