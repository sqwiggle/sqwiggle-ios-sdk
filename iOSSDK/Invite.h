//
//  Invite.h
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SQObject.h"
#import "User.h"
#import "Company.h"


@interface Invite : SQObject

@property (nonatomic, readonly) int id;
@property (nonatomic, readonly) User *from;
@property (nonatomic, readonly) Company *company;
@property (nonatomic, readonly) NSURL *avatar;
@property (nonatomic, readonly) NSURL *url;

@end
