//
//  Sqwiggle.h
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/12/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sqwiggle : NSObject

@property (nonatomic, readonly) NSString *accessToken;

/** Authentication **/

+ (void) login;
+ (void) logOut;

@end
