//
//  Company.m
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import "SQObject.h"

@implementation SQObject
@synthesize id = _id;
@synthesize relativeURL = _relativeURL;

-(void) save
{
    #warning Not Implemented
    NSString *url = [NSString stringWithFormat:@"%@/%@", SQWIGGLE_URI_API, _relativeURL];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager PUT:url parameters:[self dictionaryFormat] success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

-(void) delete
{
    #warning Not Implemented
    NSString *url = [NSString stringWithFormat:@"%@/%@", SQWIGGLE_URI_API, _relativeURL];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager DELETE:url parameters:[self dictionaryFormat] success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

-(NSDictionary *) dictionaryFormat
{
    NSLog(@"Dictionary Format has not been overriden for current object");
    return @{};
}

@end
