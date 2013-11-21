//
//  StreamItem.h
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SQRoom.h"
#import "SQObject.h"


@interface SQStreamItem : SQObject

@property (nonatomic, retain) NSDate *createdAt;
@property (nonatomic, retain) NSDate *updatedAt;
@property (nonatomic, retain) NSNumber *workRoomID;
@property (nonatomic, retain) NSNumber *companyID;
@property (nonatomic, retain) NSArray *mentions;
@property (nonatomic, retain) NSString *message;
@property (nonatomic, retain) SQUser *user;

@end
