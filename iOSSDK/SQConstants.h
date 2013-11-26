//
//  constants.h
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#define SQWIGGLE_SDK_VERION @"0.0.1"

#warning change depending on environment
#define SQWIGGLE_URI_API @"http://api.sqwiggle.com"

#define SQWIGGLE_RELATIVE_URLS @{@"SQUser": @"users", @"SQCompany": @"companies", \
                                @"SQConversation": @"conversations", @"SQRoom": @"rooms",\
                                @"SQInvite": @"invites", \
                                @"SQStreamItem": @"stream"}

#import <ObjectiveSugar/ObjectiveSugar.h>
#import <AFNetworking/AFNetworking.h>
