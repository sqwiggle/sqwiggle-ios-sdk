//
//  SQObject.h
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface SQObject : NSObject
{
    NSNumber *_id;
    NSString *_relativeURL;
}

/* Properties */

//Unique ID
@property (nonatomic, readonly) NSNumber *id;

//Relative URL for object in API. NOTE: This must be overriden in each object.
@property (nonatomic, readonly) NSString *relativeURL;

/* Methods */

//Takes dictionary and converts to object. Model needs to be defined before executing.
-(id) initObjectWithDictionary:(NSDictionary *)dictionary;

//Saves current object on API. If current object does not exist, it will be created automatically.
-(void) save;

//Deletes current object from API. If current object does not exist, nothing is done.
-(void) delete;

//Exports current object to dictionary. Needs to be overriden by each subclass.
-(NSDictionary *) dictionaryFormat;

//Returns mapping of variables to api keys.
-(NSDictionary *) modelDefinition;

@end
