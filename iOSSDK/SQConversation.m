//
//  Conversation.m
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import "SQConversation.h"


@implementation SQConversation

-(NSDictionary *) modelDefinition
{
    return @{@"ID": @"id", @"colorID": @"color_id",
             @"roomID": @"room_id", @"participatingUsers": @"participating"};
}

-(BOOL) containsUser:(SQUser *)user;
{
    for (id rawUser in self.participatingUsersContainer) {
        SQUser *currentUser = [SQUser objectWithDictionary:rawUser];
        if ([user.ID isEqualToNumber:currentUser.ID])
        {
            return YES;
        }
    }
    
    return NO;
}

-(NSArray *) participatingUsers
{
    NSMutableArray *users = [@[] mutableCopy];
    
    for (id user in _participatingUsersContainer)
    {
        SQUser *participant = [SQUser objectWithDictionary:user];
        [users addObject:participant];
    }
    
    return users;
}

- (void)setParticipatingUsers:(NSArray *)participatingUsers
{
	_participatingUsersContainer = participatingUsers;
}


-(UIColor *) color
{
    return COLOR_DEFS[_colorID];
}

-(BOOL) isEqual:(id)object
{
    return [self.ID isEqualToNumber:((SQConversation *)object).ID];
}
@end
