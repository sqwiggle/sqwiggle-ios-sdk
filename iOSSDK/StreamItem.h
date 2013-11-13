//
//  StreamItem.h
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Workroom.h"
#import "SQObject.h"


@interface StreamItem : SQObject

@property (nonatomic, readonly) int id;
@property (nonatomic, readonly) NSDate *createdAt;
@property (nonatomic, readonly) NSDate *updatedAt;
@property (nonatomic, readonly) Workroom *workRoom;
@property (nonatomic, readonly) NSArray *mentions;
@property (nonatomic, readonly) NSString *messagePlain;
@property (nonatomic, readonly) User *user;

@end
