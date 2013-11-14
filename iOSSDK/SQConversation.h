//
//  Conversation.h
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SQWorkroom.h"
#import "SQCompany.h"

@interface SQConversation : SQObject

@property (nonatomic, readonly) NSNumber *companyID;
@property (nonatomic, readonly) NSNumber *workroomID;
@property (nonatomic, readonly) NSNumber *colorID;
@property (nonatomic, readonly) NSArray *users;


@end
