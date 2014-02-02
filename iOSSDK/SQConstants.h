//
//  SQConstants.h
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#define SQWIGGLE_SDK_VERION @"0.0.1"

#define ENVIRONMENT_PRODUCTION @"production"
#define ENVIRONMENT_STAGING @"staging"

#define APP_ENVIRONMENT ENVIRONMENT_PRODUCTION

#define PUSHER_ENVIRONMENT_TOKENS @{ENVIRONMENT_PRODUCTION: @"fd4dd9eb82163e6920a0", \
ENVIRONMENT_STAGING: @"ab85ca06db9fadbf7ee3"}

#define PUSHER_API_TOKEN PUSHER_ENVIRONMENT_TOKENS[APP_ENVIRONMENT]

#define SQWIGGLE_ENDPOINTS @{ENVIRONMENT_PRODUCTION: @"https://api.sqwiggle.com", ENVIRONMENT_STAGING: @"https://sqwiggle-staging-api.herokuapp.com"}

#define SQWIGGLE_URI_API SQWIGGLE_ENDPOINTS[APP_ENVIRONMENT]

//Creating for Semantics sake
#define SQWIGGLE_TYPE NSString*

//More Semantics stuff
#define SQWIGGLE_USER_TYPE @"SQUser"
#define SQWIGGLE_ORGANIZATION_TYPE @"SQOrganization"
#define SQWIGGLE_MESSAGE_TYPE @"SQMessage"
#define SQWIGGLE_ROOM_TYPE @"SQRoom"
#define SQWIGGLE_INVITE_TYPE @"SQInvite"
#define SQWIGGLE_ATTACHMENT_TYPE @"SQAttachment"
#define SQWIGGLE_CONVERSATION_TYPE @"SQConversation"
#define SQWIGGLE_CONFIGURATION_TYPE @"SQConfiguration"

#define SUPER_SECRET_PASSWORD @"x"

#define SQWIGGLE_RELATIVE_URLS @{SQWIGGLE_USER_TYPE: @"users", \
                                SQWIGGLE_ORGANIZATION_TYPE: @"organizations", \
                                SQWIGGLE_CONVERSATION_TYPE: @"conversations",\
                                SQWIGGLE_ROOM_TYPE: @"rooms",\
                                SQWIGGLE_INVITE_TYPE: @"invites", \
                                SQWIGGLE_MESSAGE_TYPE: @"messages" }

#import <ObjectiveSugar/ObjectiveSugar.h>
#import <AFNetworking/AFNetworking.h>