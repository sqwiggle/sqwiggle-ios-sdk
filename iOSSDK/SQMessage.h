//
//  StreamItem.h
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SQRoom.h"


@interface SQMessage : SQObject

@property (nonatomic, readonly) NSDate *createdAt;
@property (nonatomic, readonly) NSDate *updatedAt;
@property (nonatomic, readonly) NSNumber *roomID;
@property (nonatomic, readonly) NSNumber *organziationID;
@property (nonatomic, readonly) NSArray *mentions;
@property (nonatomic, readonly) NSString *text;
@property (nonatomic, readonly) NSString *type;
@property (nonatomic, readonly) SQUser *user;

@end
