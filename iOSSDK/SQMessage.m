//
//  StreamItem.m
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import "SQMessage.h"


@implementation SQMessage

-(NSDictionary *) modelDefinition
{
    return @{@"ID": @"id",
			 @"updatedAt" : @"updated_at",
			 @"createdAt": @"created_at",
             @"roomID" : @"room_id",
			 @"mentions" : @"mentions",
             @"text" : @"text",
			 @"type" : @"type",
			 @"user": @"author"};
}

- (id)mapObject:(id)object withValues:(NSDictionary *)dictionary
{
    self.relativeURL = [SQWIGGLE_RELATIVE_URLS objectForKey:NSStringFromClass([object class])];
    [[object modelDefinition] each:^(id key, id value)
     {
		 // Validate incoming object. NSNull objects should not be stored.
		 id incomingObject = [dictionary valueForKeyPath:value];
		 if ([SQObject isValidObject:incomingObject])
		 {
			 // Special handling for user objects.
			 if ([SQObject isValidDictionary:incomingObject] && [key isEqualToString:@"user"])
				 _user = [[SQUser alloc] initObjectWithDictionary:incomingObject];
			 else if ([key isEqualToString:@"createdAt"])
				 _createdAt = [SQObject dateWithString:incomingObject];
			 else if ([key isEqualToString:@"updatedAt"])
				 _updatedAt = [SQObject dateWithString:incomingObject];
			 else
				 [object setValue:incomingObject forKey:key];
		 }
     }];
    
    return object;
}

@end
