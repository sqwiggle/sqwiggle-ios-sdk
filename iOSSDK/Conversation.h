//
//  Conversation.h
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Workroom.h"
#import "Company.h"

@interface Conversation : SQObject

@property (nonatomic, readonly) Company *company;
@property (nonatomic, readonly) Workroom *workroom;
@property (nonatomic, readonly) id colorID;
@property (nonatomic, readonly) NSArray *users;

@end
