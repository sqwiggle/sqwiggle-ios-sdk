//
//  Sqwiggle.m
//  libSqwiggle
//
//  Created by Cameron Webb on 11/12/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import "Sqwiggle.h"
#import <AFNetworking/AFNetworking.h>
#define SqwiggleUser [SQUser class]
#define SqwiggleCompany [SQCompany class]
#define SqwiggleStreamItem [SQStreamItem class]
#define SqwiggleWorkroom [SQWorkroom class]


@implementation Sqwiggle

+(id) retreiveItemsByType:(Class)type
{
    [self retreiveByType:SqwiggleUser];
    return nil;
}

+(id) retreiveItemOfType:(Class)type byID:(NSNumber *)id
{
    return nil;
}

@end
