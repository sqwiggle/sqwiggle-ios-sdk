//
//  constants.h
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#define SQWIGGLE_ACCESS_TOKEN @"ABCDEFGHI"

#ifndef SQWIGGLE_ACCESS_TOKEN
    #error @"SQWIGGLE_ACCESS_TOKEN is undefined"
#endif

#define SQWIGGLE_URI_API @"https://api.sqwiggle.com"

enum MediaMode
{
    AudioOnly,
    VideoOnly,
    AudioAndVideo
};

