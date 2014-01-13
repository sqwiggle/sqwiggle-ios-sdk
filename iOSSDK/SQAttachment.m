//
//  SQAttachment.m
//  SqwiggleSDK
//
//  Created by Cameron Webb on 1/13/14.
//  Copyright (c) 2014 Sqwiggle. All rights reserved.
//

#import "SQAttachment.h"

@interface SQAttachment ()
{
    NSNumber *_animated;
    NSString *_type;
    NSString *_url;
    NSString *_title;
    NSString *_description;
    NSString *_image;
    NSString *_status;
    NSDate *_createdAt;
    NSDate *_updatedAt;
}
@end

@implementation SQAttachment
@synthesize type = _type;
@synthesize url = _url;
@synthesize title = _title;
@synthesize description = _description;
@synthesize image = _image;
@synthesize status = _status;
@synthesize createdAt = _createdAt;
@synthesize updatedAt = _updatedAt;

-(BOOL) animated
{
    return [_animated boolValue];
}
@end
