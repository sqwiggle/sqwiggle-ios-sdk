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

@property (nonatomic, copy) NSDate *createdAt;
@property (nonatomic, copy) NSDate *updatedAt;
@property (nonatomic, copy) NSNumber *roomID;
@property (nonatomic, copy) NSNumber *organziationID;
@property (nonatomic, strong) NSArray *mentions;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, strong) SQUser *user;

@end
