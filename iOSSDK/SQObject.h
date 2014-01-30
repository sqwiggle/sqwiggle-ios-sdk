//
//  SQObject.h
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SQConstants.h"

@interface SQObject : NSObject
{
    NSNumber *_ID;
    NSString *_relativeURL;
}

/* Properties */

//Unique ID
@property (nonatomic, strong) NSNumber *ID;

//Relative URL for object in API. NOTE: This must be overriden in each object.
@property (nonatomic, readonly) NSString *relativeURL;

/* Methods */

//Takes dictionary and converts to object. Model needs to be defined before executing.
-(id) initObjectWithDictionary:(NSDictionary *)dictionary;

//Short-hand version of initObjectWithDictionary
+(id) objectWithDictionary:(NSDictionary *)dictionary;

//Exports current object to dictionary. Yes, that easy.
-(NSDictionary *) dictionaryFormat;

//Returns mapping of variables to api keys.
-(NSDictionary *) modelDefinition;

@end
