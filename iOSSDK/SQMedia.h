//
//  SQMedia.h
//  Sqwiggle
//
//  Created by Cameron Webb on 5/15/14.
//  Copyright (c) 2014 Sqwiggle, Inc. All rights reserved.
//

#import "SQObject.h"

@interface SQMedia : SQObject

@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *label;

@end
