//
//  User.m
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import "SQUser.h"


@interface SQUser ()

@property (nonatomic, copy) NSNumber *confirmedObject;

@end

@implementation SQUser

-(id) initObjectWithDictionary:(NSDictionary *)dictionary
{
    self = [super initObjectWithDictionary:dictionary];
    
    if (self)
    {
        NSDictionary *contactDictionary = [dictionary objectForKey:@"contact"];
        if (contactDictionary)
        {
            SQContact *contact = [SQContact objectWithDictionary:contactDictionary];
            self.contact = contact;
        }
        
        NSDictionary *mediaDictionary = [dictionary objectForKey:@"media"];
        if (mediaDictionary)
        {
            _media = [[NSMutableDictionary alloc] init];
            [dictionary each:^(id key, id value) {
                SQMedia *mediaItem = [SQMedia objectWithDictionary:value];
                mediaItem.type = key;
                [_media setObject:mediaItem forKey:key];
            }];
        }
    }
    
    return self;
}

-(NSDictionary *) modelDefinition
{
    return @{@"ID": @"id", @"role" : @"role",
             @"status" : @"status", @"name": @"name",
             @"email": @"email", @"confirmedObject": @"confirmed",
             @"timeZone": @"time_zone", @"timeZoneOffset": @"time_zone_offset",
             @"createdAt": @"created_at", @"lastActiveAt": @"last_active_at",
             @"avatar": @"avatar", @"message": @"message" };
}

-(BOOL) isEqual:(id)object
{
    return [self.ID isEqualToNumber:((SQUser *)object).ID];
}


@end
