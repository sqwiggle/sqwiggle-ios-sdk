//
//  SQConstants.h
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#define SQWIGGLE_SDK_VERION @"0.0.1"

#define ENVIRONMENT_PRODUCTION @"production"

#define APP_ENVIRONMENT ENVIRONMENT_PRODUCTION

#define SQWIGGLE_URI_API @"https://api.sqwiggle.com"

#define SQWIGGLE_RELATIVE_URLS @{@"SQUser": @"users", @"SQCompany": @"companies", \
                                @"SQConversation": @"conversations", @"SQRoom": @"rooms",\
                                @"SQInvite": @"invites", \
                                @"SQMessage": @"messages"}

#import <ObjectiveSugar/ObjectiveSugar.h>
#import <AFNetworking/AFNetworking.h>
