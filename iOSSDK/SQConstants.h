//
//  SQConstants.h
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#define SQWIGGLE_SDK_VERION @"0.1.0"

#define ENVIRONMENT_PRODUCTION @"production"

#define APP_ENVIRONMENT ENVIRONMENT_PRODUCTION

#define SQWIGGLE_ENDPOINTS @{ENVIRONMENT_PRODUCTION: @"https://api.sqwiggle.com"}

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
                                SQWIGGLE_MESSAGE_TYPE: @"messages", \
                                SQWIGGLE_CONFIGURATION_TYPE: @"info/configuration", \
                                SQWIGGLE_ATTACHMENT_TYPE: @"attachments"}

#import <ObjectiveSugar/ObjectiveSugar.h>
#import <AFNetworking/AFNetworking.h>