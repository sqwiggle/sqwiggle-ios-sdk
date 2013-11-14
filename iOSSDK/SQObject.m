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

-(id) initObjectWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if (self != nil)
    {
        //Keys are set by names of classes in constants.h
        _relativeURL = [SQWIGGLE_RELATIVE_URLS objectForKey:NSStringFromClass([self class])];
        [[self modelDefinition] enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            key = [dictionary objectForKey:obj];
        }];
    }
    
    return self;
}

#pragma mark Override these SQObjectMethods
-(NSDictionary *) dictionaryFormat
{
    NSAssert(NO, @"Subclasses need to overwrite this method");
    return @{};
}

-(NSDictionary *) modelDefinition
{
    NSAssert(NO, @"Subclasses need to overwrite this method");
    return @{};
}

#pragma mark Make life better methods
-(void) save
{
    #warning Not Implemented
    NSString *url = [NSString stringWithFormat:@"%@/%@/%@", SQWIGGLE_URI_API, _relativeURL, _id];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager PUT:url parameters:[self dictionaryFormat] success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

-(void) delete
{
    #warning Not Implemented
    NSString *url = [NSString stringWithFormat:@"%@/%@/%@", SQWIGGLE_URI_API, _relativeURL, _id];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager DELETE:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

@end
