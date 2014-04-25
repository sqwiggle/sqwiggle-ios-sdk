//
//  Company.h
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SQObject.h"

@interface SQOrganization : SQObject

@property (nonatomic, copy) NSDate *createdAt;
@property (nonatomic, copy) NSNumber *ownerID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *path;
@property (nonatomic, copy) NSDictionary *billing;
@property (nonatomic, copy) NSDictionary *security;

@end
