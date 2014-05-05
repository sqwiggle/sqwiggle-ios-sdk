//
//  SQContact.h
//  SqwiggleSDK
//
//  Created by Cameron Webb on 5/5/14.
//  Copyright (c) 2014 Sqwiggle. All rights reserved.
//

#import "SQObject.h"

#define SQ_CONTACT_APPROVED @"approved"
#define SQ_CONTACT_REQUESTED @"requested"

@interface SQContact : SQObject

@property (nonatomic, copy) NSString *state;
@property (nonatomic, copy) NSDate *createdAt;

@end
