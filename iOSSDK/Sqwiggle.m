//
//  Sqwiggle.m
//  libSqwiggle
//
//  Created by Cameron Webb on 11/12/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import "Sqwiggle.h"
#import <AFNetworking/AFNetworking.h>



@implementation Sqwiggle

+(void) retrieveItemsOfType:(SqwiggleType)type
                    success:(void (^)(NSArray *items))success
                    failure:(void (^)(NSError *error))failure
{
    [self retreiveItemOfType:SqwiggleUser
                        byID:nil
                     success:success
                     failure:failure];
}

+(void) retreiveItemOfType:(SqwiggleType)type
                      byID:(NSNumber *)ID
                   success:(void (^)(id item))success
                   failure:(void (^)(NSError *error))failure
{
    NSString *relativeURL = [SQWIGGLE_RELATIVE_URLS objectForKey:NSStringFromClass(type)];
    
    NSString *url = [NSString stringWithFormat:@"%@/%@/%@", SQWIGGLE_URI_API,
                     relativeURL, (ID ? ID : @"")];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *objectDefinition = [type performSelector:@selector(modelDefinition)];
        [type performSelector:@selector(objectWithDictionary:) withObject:objectDefinition];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

@end
