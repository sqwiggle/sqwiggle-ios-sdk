//
//  Company.m
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import "SQObject.h"
#import "Sqwiggle.h"

/// Date formatter is cached since creating it is slow.
static NSDateFormatter *sharedDateFormatter = nil;

@implementation SQObject

-(id) initObjectWithDictionary:(NSDictionary *)dictionary
{
    if (!self)
        self = [super init];
    
    if (self != nil)
    {
        //Keys are set by names of classes in SQConstants
        [self mapObject:self withValues:dictionary];
    }
    return self;
}

+ (NSDateFormatter*)dateFormatter
{
	if (!sharedDateFormatter)
	{
		sharedDateFormatter = [[NSDateFormatter alloc] init];
		[sharedDateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
		// Timezone from server is always GMT.
		[sharedDateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
	}
	
	return sharedDateFormatter;
}

-(id) mapObject:(id)object withValues:(NSDictionary *)dictionary
{
    _relativeURL = [SQWIGGLE_RELATIVE_URLS objectForKey:NSStringFromClass([object class])];
    [[object modelDefinition] each:^(id key, id value)
     {
		 // Validate incoming object. NSNull objects should not be stored.
		 id incomingObject = [dictionary valueForKeyPath:value];
		 if ([SQObject isValidObject:incomingObject])
			 [object setValue:incomingObject forKey:key];
     }];
    
    return object;
}

+ (BOOL)isValidObject:(id)object
{
	if (!object || [object isKindOfClass:[NSNull class]])
		return NO;
	
	return YES;
}

+ (BOOL)isValidDictionary:(id)object
{
	if (object && [object isKindOfClass:[NSDictionary class]] && ([[object allKeys] count] > 0))
		return YES;
	
	return NO;
}

+ (BOOL)isValidArray:(id)object
{
	if (object && [object isKindOfClass:[NSArray class]] && ([object count] > 0))
		return YES;
	
	return NO;
}


+ (NSDate*)dateWithString:(NSString*)dateString
{
	NSDate *date = [[SQObject dateFormatter] dateFromString:dateString];
	return date;
}


//Short-hand init
+(id) objectWithDictionary:(NSDictionary *)dictionary
{
    return [[[self class] alloc] initObjectWithDictionary:dictionary];
}

-(NSDictionary *) dictionaryFormat
{
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    
    [[self modelDefinition] each:^(id key, id value)
     {
         //Not gonna map item if it's null
         if([self valueForKeyPath:key])
             [dictionary setObject:[self valueForKeyPath:key] forKey:value];
     }];
    
    return dictionary;
}

#pragma mark Override these SQObjectMethods
-(NSDictionary *) modelDefinition
{
    NSAssert(NO, @"Subclasses need to overwrite this method");
    return @{};
}

#pragma mark Make life better methods
-(void) save:(void (^)(id object))success
     failure:(void (^)(NSError *error))failure
{
    NSString *url;
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setRequestSerializer:[AFHTTPRequestSerializer serializer]];
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:[Sqwiggle authToken]
                                                              password:SUPER_SECRET_PASSWORD];
    if (_ID)
    {
        url = [NSString stringWithFormat:@"%@/%@/%@", [Sqwiggle currentAPIEndpoint], _relativeURL, _ID];
        [manager PUT:url
          parameters:[self dictionaryFormat]
             success:^(AFHTTPRequestOperation *operation, id responseObject) {
                 success(responseObject);
				 
			 } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
				 failure(failure);
			 }];
    }
    else
    {
        //No ID. Let's attempt to create a new one.
        url = [NSString stringWithFormat:@"%@/%@", [Sqwiggle currentAPIEndpoint], _relativeURL];
        [manager POST:url
		   parameters:[self dictionaryFormat]
			  success:^(AFHTTPRequestOperation *operation, id responseObject) {
				  [self mapObject:self withValues:responseObject];
				  success(responseObject);
				  
			  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
				  failure(failure);
			  }];
    }
    
}

-(void) delete:(void (^)(void))success
       failure:(void (^)(NSError *error))failure
{
    NSString *url = [NSString stringWithFormat:@"%@/%@/%@", [Sqwiggle currentAPIEndpoint], _relativeURL, _ID];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setRequestSerializer:[AFHTTPRequestSerializer serializer]];
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:[Sqwiggle authToken]
                                                              password:SUPER_SECRET_PASSWORD];
    [manager DELETE:url
		 parameters:[self dictionaryFormat]
			success:^(AFHTTPRequestOperation *operation, id responseObject) {
				success();
			} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
				failure(failure);
			}];
}
#pragma mark NSObject methods for storage/etc
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

#pragma mark SQObject Description method
- (NSString *)description {
    return [NSString stringWithFormat:@"%@ - ID: %@", [self class], self.ID];
}


@end
