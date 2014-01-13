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
    return @{@"_ID": @"id", @"_updatedAt" : @"updated_at", @"_createdAt": @"created_at",
             @"_roomID" : @"room_id", @"_mentions": @"mentions",
             @"_message": @"message", @"_user": @"user"};
}

-(void) save
{
    
    NSMutableDictionary *params = [NSMutableDictionary new];

    [params setObject:@{@"user": _user} forKey:@"user"];
    [params setObject:_message forKey:@"message"];
    [params setObject:_createdAt forKey:@"created_at"];
    [params setObject:_roomID forKey:@"room_id"];
    [params setObject:_companyID forKey:@"company_id"];
    
    NSString *auth = [[NSUserDefaults standardUserDefaults] objectForKey:@"SQWIGGLE_USERNAME_KEY"];
    _relativeURL = [SQWIGGLE_RELATIVE_URLS objectForKey:NSStringFromClass([self class])];

    NSString *url = [NSString stringWithFormat:@"%@%@?auth_token=%@", SQWIGGLE_URI_API, _relativeURL, auth];
    NSLog(@"%@", url);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Gottt heeeee");
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@" darn %@", error);
    }];
}
@end
