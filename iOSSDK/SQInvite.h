//
//  Invite.h
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SQObject.h"
#import "SQUser.h"
#import "SQCompany.h"


@interface SQInvite : SQObject

@property (nonatomic, readonly) SQUser *from;
@property (nonatomic, readonly) SQCompany *company;
@property (nonatomic, readonly) NSURL *avatar;
@property (nonatomic, readonly) NSURL *url;

@end
