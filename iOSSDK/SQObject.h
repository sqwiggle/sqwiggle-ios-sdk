//
//  SQObject.h
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SQObject : NSObject

//Unique ID
@property (nonatomic, readonly) int id;

-(void) save;
-(void) delete;

@end
