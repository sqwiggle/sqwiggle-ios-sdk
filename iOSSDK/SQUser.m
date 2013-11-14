//
//  User.m
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import "SQUser.h"


@interface SQUser ()
//Helper method to handle media mode
-(NSDictionary *) modelDefinition;
@end

@implementation SQUser


/*@property (nonatomic, readonly) NSString *role;
 @property (nonatomic, readonly) enum MediaMode *mode;
 @property (nonatomic, readonly) NSString *status;
 @property (nonatomic, readonly) NSString *name;
 @property (nonatomic, readonly) NSString *email;
 @property (nonatomic, readonly) BOOL confirmed;
 @property (nonatomic, readonly) NSTimeZone *timeZone;
 @property (nonatomic, readonly) float timeZoneOffset;
 @property (nonatomic, readonly) NSDate *createdAt;
 @property (nonatomic, readonly) NSDate *lastActiveAt;
 @property (nonatomic, readonly) NSURL *avatar;*/


-(id) initObjectWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if (self != nil)
    {
        _role = [dictionary objectForKey:@"role"];
        _status = [dictionary objectForKey:@"status"];
        _name = [dictionary objectForKey:@"name"];
        _email = [dictionary objectForKey:@"email"];
        _confirmed = [dictionary objectForKey:@"confirmed"]
        
    }
    
    return self;
}

-(NSDictionary *) modelDefinition
{
    return @{_role : @"role", _mode: @"mode",
            _status : @"status"};
}
@end
