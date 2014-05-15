//
//  User.h
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SQObject.h"
#import "SQContact.h"
#import "SQMedia.h"

@interface SQUser : SQObject

@property (nonatomic, copy) NSString *role;
@property (nonatomic, copy) NSString *mode;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) NSNumber *roomID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSTimeZone *timeZone;
@property (nonatomic, copy) NSNumber *timeZoneOffset;
@property (nonatomic, copy) NSDate *createdAt;
@property (nonatomic, copy) NSDate *lastActiveAt;
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic) SQContact *contact;
@property (nonatomic) NSMutableDictionary *media;
@property (nonatomic, strong) UIImage *currentStill;
@property (nonatomic, strong) UIImage *previousStill;
@property (nonatomic, assign) BOOL confirmed;
@property (nonatomic, assign) BOOL isContact;



@end
