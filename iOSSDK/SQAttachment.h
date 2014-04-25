//
//  SQAttachment.h
//  SqwiggleSDK
//
//  Created by Cameron Webb on 1/13/14.
//  Copyright (c) 2014 Sqwiggle. All rights reserved.
//

#import "SQObject.h"

@interface SQAttachment : SQObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *status;

@end
