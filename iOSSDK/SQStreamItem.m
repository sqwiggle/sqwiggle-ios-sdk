//
//  StreamItem.m
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import "SQStreamItem.h"

@implementation SQStreamItem

-(NSDictionary *) modelDefinition
{
    return @{@"_ID": @"id", @"_updatedAt" : @"updated_at", @"_createdAt": @"created_at",
             @"_workRoomID" : @"workroom_id", @"_mentions": @"mentions",
             @"_message": @"message", @"_user": @"user"};
}

-(void) save
{
    
    NSMutableDictionary *params = [NSMutableDictionary new];

    [params setObject:@{@"user": _user} forKey:@"user"];
    [params setObject:_message forKey:@"message"];
    [params setObject:_createdAt forKey:@"created_at"];
    [params setObject:_workRoomID forKey:@"workroom_id"];
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
