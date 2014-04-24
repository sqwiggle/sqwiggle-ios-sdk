//
//  ResponseFactory.h
//  SqwiggleSDK
//
//  Created by Cameron Webb on 12/2/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResponseFactory : NSObject

+(NSDictionary *) fakeUserResponse;
+(NSDictionary *) fakeUsers;
+(NSDictionary *) fakeRooms;
+(NSDictionary *) fakeMessage;
+(NSDictionary *) fakeMessages;
+(NSDictionary *) fakeAttachment;
+(NSDictionary *) fakeConversation;
+(NSDictionary *) fakeConversations;
+(NSDictionary *) fakeOrganizations;
+(NSDictionary *) fakeConfiguration;
+(NSDictionary *) fakeActivities;

@end
