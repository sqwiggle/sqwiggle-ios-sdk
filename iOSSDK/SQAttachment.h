//
//  SQAttachment.h
//  SqwiggleSDK
//
//  Created by Cameron Webb on 1/13/14.
//  Copyright (c) 2014 Sqwiggle. All rights reserved.
//

#import "SQObject.h"

@interface SQAttachment : SQObject

@property (nonatomic, readonly) NSString *type;
@property (nonatomic, readonly) NSString *url;
@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSString *description;
@property (nonatomic, readonly) NSString *image;
@property (nonatomic, readonly) NSString *status;
@property (nonatomic, readonly) NSDate *createdAt;
@property (nonatomic, readonly) NSDate *updatedAt;

-(BOOL) animated;

@end
