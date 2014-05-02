//
//  SQStream.h
//  SqwiggleSDK
//
//  Created by Johnny Chan on 4/22/14.
//  Copyright (c) 2014 Sqwiggle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SQObject.h"

@interface SQStream : SQObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *color;
@property (nonatomic, assign) BOOL subscribed;

@end
