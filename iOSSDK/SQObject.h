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

//Unique ID
@property (nonatomic, readonly) int id;

//Saves current object on API. If current object does not exist, it will be created automatically.
-(void) save;

//Deletes current object from API. If current object does not exist, nothing is done.
-(void) delete;

//Exports current object to dictionary. Needs to be overriden by each object.
-(NSDictionary *) dictionaryFormat;

@end
