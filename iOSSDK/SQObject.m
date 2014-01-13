//
//  Company.m
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import "SQObject.h"

@implementation SQObject
@synthesize ID = _ID;
@synthesize relativeURL = _relativeURL;

-(id) initObjectWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self != nil)
    {
        //Keys are set by names of classes in constants.h
        _relativeURL = [SQWIGGLE_RELATIVE_URLS objectForKey:NSStringFromClass([self class])];
        [[self modelDefinition] each:^(id key, id value){
            [self setValue:[dictionary valueForKeyPath:value] forKey:key];
        }];
    }
    return self;
}

//Short-hand init
+(id) objectWithDictionary:(NSDictionary *)dictionary
{
    return [[[self class] alloc] initObjectWithDictionary:dictionary];
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
    NSString *url = [NSString stringWithFormat:@"%@/%@/%@", SQWIGGLE_URI_API, _relativeURL, _ID];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager PUT:url parameters:[self dictionaryFormat] success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

-(void) delete
{
    #warning Not Implemented
    NSString *url = [NSString stringWithFormat:@"%@/%@/%@", SQWIGGLE_URI_API, _relativeURL, _ID];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager DELETE:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

- (void)encodeWithCoder:(NSCoder *)coder {
    NSMutableDictionary *encodeDictionary = [NSMutableDictionary new];
    [[self modelDefinition] each:^(id key, id value) {
        if ([self valueForKey:key] != nil)
            [encodeDictionary setObject:[self valueForKey:key] forKey:key];
    }];
    [coder encodeObject:encodeDictionary forKey:NSStringFromClass([self class])];

}

//Handy override function to make sure our stuff can be stored offline :)
- (id)initWithCoder:(NSCoder *)coder {
    self = [[[self class] alloc] init];
    if (self != nil)
    {
        NSDictionary *stored = [coder decodeObjectForKey:NSStringFromClass([self class])];
        [[self modelDefinition] each:^(id key, id value) {
            [self setValue:[stored objectForKey:key] forKey:key];
        }];
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ - ID: %@", [self class], self.ID];
}


@end
