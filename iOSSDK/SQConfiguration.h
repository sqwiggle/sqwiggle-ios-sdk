//
//  SQConfiguration.h
//  SqwiggleSDK
//
//  Created by Cameron Webb on 2/2/14.
//  Copyright (c) 2014 Sqwiggle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SQObject.h"

@interface SQConfiguration : SQObject

@property (nonatomic, copy) NSMutableArray *iceServers;
@property (nonatomic, copy) NSMutableDictionary *storage;
@property (nonatomic, copy) NSString *maxUploadFilesize;
@end
