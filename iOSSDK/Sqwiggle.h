//
//  Sqwiggle.h
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/12/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Company.h"

@interface Sqwiggle : NSObject

//Initializes Sqwiggle API Session. If token is valid, currentCompany is set via API request
+(void) startSqwigglingWithToken:(NSString *) token;

//Removes Sqwiggle data from local device
+(void) stopSqwiggling;

//Current company associated sqwiggle session
+(Company *) currentCompany;

@end