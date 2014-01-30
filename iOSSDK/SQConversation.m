//
//  Conversation.m
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import "SQConversation.h"
#import "Sqwiggle.h"

@interface SQConversation ()
{
    NSNumber *_organziationID;
    NSNumber *_roomID;
    NSNumber *_colorID;
    NSArray *_participatingUsers;
}
@end

@implementation SQConversation
@synthesize organziationID = _organziationID;
@synthesize roomID = _roomID;
@synthesize colorID = _colorID;
@synthesize participatingUsers = _participatingUsers;

-(NSDictionary *) modelDefinition
{
    return @{@"_ID": @"id", @"_colorID": @"color_id",
             @"_roomID": @"room_id", @"_participatingUsers": @"participating"};
}

-(BOOL) containsUser:(SQUser *)user;
{
    for (id rawUser in _participatingUsers) {
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
    
    for (id user in _participatingUsers)
    {
        SQUser *participant = [SQUser objectWithDictionary:user];
        [users addObject:participant];
    }
    
    return users;
}

-(UIColor *) color
{
    return COLOR_DEFS[_colorID];
}

-(BOOL) isEqual:(id)object
{
    NSLog(@"%@ object %@ self", self.ID, ((SQConversation *)object).ID);
    return [self.ID isEqualToNumber:((SQConversation *)object).ID];
}
@end
