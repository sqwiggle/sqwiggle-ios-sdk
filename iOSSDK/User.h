//
//  User.h
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Conversation.h"

@interface User : NSObject

@property (nonatomic, readonly) int id;
@property (nonatomic, readonly) NSString *role;
@property (nonatomic, readonly) enum MediaMode *mode;
@property (nonatomic, readonly) NSString *status;
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *email;
@property (nonatomic, readonly) BOOL confirmed;
@property (nonatomic, readonly) NSTimeZone *timeZone;
@property (nonatomic, readonly) float timeZoneOffset;
@property (nonatomic, readonly) NSDate *createdAt;
@property (nonatomic, readonly) NSDate *lastActiveAt;
@property (nonatomic, readonly) NSURL *avatar;
@property (nonatomic, readonly) Conversation *conversation;
@property (nonatomic, readonly) UIImage *picture;

//Converts Friendly Time Zone name to TimeZone object. See http://api.rubyonrails.org/classes/ActiveSupport/TimeZone.html for more info on format.
-(void) setTimeZoneFromString:(NSString *) timeZoneName;


@end