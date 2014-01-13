//
//  StreamItem.h
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SQRoom.h"


@interface SQStreamItem : SQObject

@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, strong) NSDate *updatedAt;
@property (nonatomic, strong) NSNumber *roomID;
@property (nonatomic, strong) NSNumber *companyID;
@property (nonatomic, strong) NSArray *mentions;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) SQUser *user;

@end
