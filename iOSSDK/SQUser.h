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

@property (nonatomic, retain) NSString *role;
@property (nonatomic, retain) NSString *mode;
@property (nonatomic, retain) NSString *status;
@property (nonatomic, retain) NSNumber *roomID;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSTimeZone *timeZone;
@property (nonatomic, retain) NSNumber *timeZoneOffset;
@property (nonatomic, retain) NSDate *createdAt;
@property (nonatomic, retain) NSDate *lastActiveAt;
@property (nonatomic, retain) NSString *avatar;
@property (nonatomic, retain) UIImage *currentStill;
@property (nonatomic) id company;

//Needed to do as helper method because bool doesn't have a ns counterpart.
-(BOOL) confirmed;

@end
