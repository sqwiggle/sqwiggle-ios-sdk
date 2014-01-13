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

@property (nonatomic, readonly) NSNumber *fromID;
@property (nonatomic, readonly) NSDate *createdAt;
@property (nonatomic, readonly) NSString *email;
@property (nonatomic, readonly) NSString *avatar;
@property (nonatomic, readonly) NSString *path;

@end
