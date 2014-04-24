//
//  Invite.h
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SQUser.h"
#import "SQOrganization.h"


@interface SQInvite : SQObject

@property (nonatomic, copy) NSNumber *fromID;
@property (nonatomic, copy) NSDate *createdAt;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *path;

@end
