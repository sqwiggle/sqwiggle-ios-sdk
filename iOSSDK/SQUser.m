//
//  User.m
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import "SQUser.h"
#import "SQMedia.h"
#import "Sqwiggle.h"


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
            [mediaDictionary each:^(id key, id value) {
                SQMedia *mediaItem = [SQMedia objectWithDictionary:value];
				[mediaItem setType:key];
                [_media setObject:mediaItem forKey:key];
            }];
        }
    }
    
    return self;
}

-(NSDictionary *) modelDefinition
{
    return @{ @"ID": @"id",
			  @"role" : @"role",
			  @"status" : @"status",
			  @"name": @"name",
			  @"email": @"email",
			  @"timeZone": @"time_zone",
			  @"timeZoneOffset": @"time_zone_offset",
			  @"createdAt": @"created_at",
			  @"lastActiveAt": @"last_active_at",
			  @"avatar": @"avatar",
			  @"message": @"message",
			  @"confirmed": @"confirmed",
			  @"isContact" : @"is_contact",
			  @"snapshot" : @"snapshot",
			  @"snapshotInterval" : @"snapshot_interval",
			  @"idleAt" : @"idle_at",
              @"features" : @"features",
              @"notifications": @"notifications"};
}

-(BOOL) isEqual:(id)object
{
    return [self.ID isEqualToNumber:((SQUser *)object).ID];
}


- (void)updateAppState:(void (^)(id responseObject))success
			   failure:(failureResponse)failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setRequestSerializer:[AFHTTPRequestSerializer serializer]];
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:[Sqwiggle authToken]
                                                              password:SUPER_SECRET_PASSWORD];
    if (self.ID)
    {
        NSString *url = [NSString stringWithFormat:@"%@/%@/%@", [Sqwiggle currentAPIEndpoint], self.relativeURL, self.ID];
        NSMutableDictionary *mediaItems = [[NSMutableDictionary alloc] init];
        
        [_media each:^(NSString *key, NSDictionary *mediaItem) {
            [mediaItems setObject:mediaItem forKey:key];
        }];
        
        [manager PUT:url
          parameters:mediaItems
             success:^(AFHTTPRequestOperation *operation, id responseObject) {
                 success(responseObject);
				 
			 } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
				 failure(error);
			 }
         ];
    }
}


@end
