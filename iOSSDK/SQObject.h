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

/* Properties */

//Unique ID
@property (nonatomic, strong) NSNumber *ID;

//Relative URL for object in API. NOTE: This must be overriden in each object.
@property (nonatomic, copy) NSString *relativeURL;

/* Methods */

//Takes dictionary and converts to object. Model needs to be defined before executing.
-(id) initObjectWithDictionary:(NSDictionary *)dictionary;

//Short-hand version of initObjectWithDictionary
+(id) objectWithDictionary:(NSDictionary *)dictionary;

//Exports current object to dictionary. Yes, that easy.
-(NSDictionary *) dictionaryFormat;

//Returns mapping of variables to api keys.
-(NSDictionary *) modelDefinition;

/*! Check whether the object coming from the server is a valid, assignable object.
 */
+ (BOOL)isValidObject:(id)object;

/*! Check whether the object coming from the server is a valid NSDictionary.
 */
+ (BOOL)isValidDictionary:(id)object;

/*! Check whether the object coming from the server is a valid NSArray.
 */
+ (BOOL)isValidArray:(id)object;


#pragma mark API State Methods
/*!
 * Updates current object or saves new one in database.
 * Note that changes made via the API will be immediately reflected in the interface
 * of all connected clients.
 */
-(void) save:(void (^)(id object))success
     failure:(void (^)(NSError *error))failure;

/*!
 * Removes object.
 */
-(void) delete:(void (^)(void))success
failure:(void (^)(NSError *error))failure;

@end
