//
//  Constants
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//



#ifndef Sqwiggle_sqconstants_h
#define Sqwiggle_sqconstants_h


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
SQWIGGLE_ATTACHMENT_TYPE : @"attachments", \
SQWIGGLE_MESSAGE_TYPE: @"messages",\
SQWIGGLE_CONFIGURATION_TYPE: @"info/configuration"}

#define SQWIGGLE_STATUS_BUSY @"busy"
#define SQWIGGLE_STATUS_AVAILABLE @"available"
#define SQWIGGLE_STATUS_OFFLINE @"offline"
#define SQWIGGLE_DEFAULT_BUSY_STATUS @"I'm Busy"

#endif