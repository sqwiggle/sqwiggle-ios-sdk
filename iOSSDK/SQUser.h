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


@interface SQUser : SQObject

@property (nonatomic, strong) NSString *role;
@property (nonatomic, strong) NSString *mode;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSNumber *roomID;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSTimeZone *timeZone;
@property (nonatomic, strong) NSNumber *timeZoneOffset;
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, strong) NSDate *lastActiveAt;
@property (nonatomic, strong) NSString *avatar;
@property (nonatomic, strong) UIImage *currentStill;
@property (nonatomic) id company;

//Needed to do as helper method because bool doesn't have a ns counterpart.
-(BOOL) confirmed;

@end
