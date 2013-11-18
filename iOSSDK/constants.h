//
//  constants.h
//  SqwiggleSDK
//
//  Created by Cameron Webb on 11/13/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#define SQWIGGLE_SDK_VERION @"0.0.1"

#define SQWIGGLE_URI_API @"https://sqwiggle-api.herokuapp.com"

#define SQWIGGLE_RELATIVE_URLS @{@"SQUser": @"users", @"SQCompany": @"companies", \
                                @"SQConversation": @"conversations", @"SQWorkroom": @"workrooms",\
                                @"SQInvite": @"invites", \
                                @"SQStreamItems": @"stream_items"}

//Creating for Semantics sake
#define SqwiggleType Class

//More Semantics stuff
#define SqwiggleUser [SQUser class]
#define SqwiggleCompany [SQCompany class]
#define SqwiggleStreamItem [SQStreamItem class]
#define SqwiggleWorkroom [SQWorkroom class]

//Stolen from AFNetworking. Trust me, it's easier this way
static NSString * AFBase64EncodedStringFromString(NSString *string) {
    NSData *data = [NSData dataWithBytes:[string UTF8String] length:[string lengthOfBytesUsingEncoding:NSUTF8StringEncoding]];
    NSUInteger length = [data length];
    NSMutableData *mutableData = [NSMutableData dataWithLength:((length + 2) / 3) * 4];
    
    uint8_t *input = (uint8_t *)[data bytes];
    uint8_t *output = (uint8_t *)[mutableData mutableBytes];
    
    for (NSUInteger i = 0; i < length; i += 3) {
        NSUInteger value = 0;
        for (NSUInteger j = i; j < (i + 3); j++) {
            value <<= 8;
            if (j < length) {
                value |= (0xFF & input[j]);
            }
        }
        
        static uint8_t const kAFBase64EncodingTable[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
        
        NSUInteger idx = (i / 3) * 4;
        output[idx + 0] = kAFBase64EncodingTable[(value >> 18) & 0x3F];
        output[idx + 1] = kAFBase64EncodingTable[(value >> 12) & 0x3F];
        output[idx + 2] = (i + 1) < length ? kAFBase64EncodingTable[(value >> 6)  & 0x3F] : '=';
        output[idx + 3] = (i + 2) < length ? kAFBase64EncodingTable[(value >> 0)  & 0x3F] : '=';
    }
    
    return [[NSString alloc] initWithData:mutableData encoding:NSASCIIStringEncoding];
}