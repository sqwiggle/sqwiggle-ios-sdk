//
//  User.h
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic) int id;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *email;

@end
