//
//  SQConfiguration.h
//  SqwiggleSDK
//
//  Created by Cameron Webb on 2/2/14.
//  Copyright (c) 2014 Sqwiggle. All rights reserved.
//

#import "SQObject.h"

@interface SQConfiguration : SQObject

@property (nonatomic, readonly) NSMutableArray *iceServers;
@property (nonatomic, readonly) NSMutableDictionary *storage;
@property (nonatomic, readonly) NSNumber *maxUploadFilesize;
@end
