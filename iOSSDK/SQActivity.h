//
//  SQActivity.h
//  SqwiggleSDK
//
//  Created by Cameron Webb on 4/24/14.
//  Copyright (c) 2014 Sqwiggle. All rights reserved.
//

#import "SQObject.h"

#define MENTION_ACTIVITY @"mention"
#define SIGN_OUT_ACTIVITY @"sign_out"
#define SIGN_IN_ACTIVITY @"sign_in"
#define CONVERSATION_ACTIVITY @"conversation"
#define PING_ACTIVITY @"ping"

@interface SQActivity : SQObject

@property (nonatomic, copy) NSArray *recipients;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) NSNumber *subjectID;
@property (nonatomic, copy) NSString *subjectType;

@end
