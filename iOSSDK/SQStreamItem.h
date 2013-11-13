//
//  StreamItem.h
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SQWorkroom.h"
#import "SQObject.h"


@interface SQStreamItem : SQObject

@property (nonatomic, readonly) NSDate *createdAt;
@property (nonatomic, readonly) NSDate *updatedAt;
@property (nonatomic, readonly) SQWorkroom *workRoom;
@property (nonatomic, readonly) NSArray *mentions;
@property (nonatomic, readonly) NSString *messagePlain;
@property (nonatomic, readonly) SQUser *user;

@end
