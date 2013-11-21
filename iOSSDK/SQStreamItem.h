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

@property (nonatomic, retain) NSDate *createdAt;
@property (nonatomic, readonly) NSDate *updatedAt;
@property (nonatomic, readonly) NSNumber *workRoomID;
@property (nonatomic, readonly) NSArray *mentions;
@property (nonatomic, retain) NSString *message;
@property (nonatomic, readonly) NSNumber *userID;
@property (nonatomic, retain)  NSDictionary *user;

@end
