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

@property (nonatomic, readonly) SQCompany *company;
@property (nonatomic, readonly) SQWorkroom *workroom;
@property (nonatomic, readonly) id colorID;
@property (nonatomic, readonly) NSArray *users;

@end
