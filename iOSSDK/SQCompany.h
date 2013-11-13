//
//  Company.h
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SQObject.h"

@interface SQCompany : SQObject

@property (nonatomic, readonly) NSDate *createdAt;
@property (nonatomic, readonly) int ownerID;
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *portalURL;
@property (nonatomic, readonly) NSDictionary *billing;
@property (nonatomic, readonly) NSDictionary *security;

@end
