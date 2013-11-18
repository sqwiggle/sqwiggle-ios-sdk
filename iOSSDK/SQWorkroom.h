//
//  Workroom.h
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SQUser.h"
#import "SQObject.h"

@interface SQWorkroom : SQObject

@property (nonatomic, readonly) NSNumber *createdByID;
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *path;
@property (nonatomic, readonly) NSNumber *userCount;

@end
