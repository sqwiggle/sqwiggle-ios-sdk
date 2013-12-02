//
//  ResponseFactory.m
//  SqwiggleSDK
//
//  Created by Cameron Webb on 12/2/13.
//  Copyright (c) 2013 Sqwiggle. All rights reserved.
//

#import "ResponseFactory.h"

@implementation ResponseFactory

+(NSDictionary *) fakeUserResponse
{
    NSString *resp = @"{\"id\":13678,\"workroom_id\":1,\"last_active_at\":\"2013-12-02T15:57:40Z\",\"role\":\"owner\",\"status\":\"available\",\"email\":\"cameron@sqwiggle.com\",\"name\":\"Cameron Webb\",\"avatar\":\"https://sqwiggle-photos.s3.amazonaws.com/13678/avatar/356a192b7913b04c54574d18c28d46e6395428ab_120_120.jpg?1383749233104\",\"time_zone\":\"Eastern Time (US & Canada)\",\"time_zone_offset\":-5,\"notification\":{\"login\":\"sound\",\"logout\":\"sound\",\"workroom_enter\":\"sound,desktop\",\"workroom_leave\":\"sound\",\"conversation_enter\":\"desktop\",\"conversation_leave\":\"\",\"stream_item\":\"desktop\",\"stream_item_in_conversation\":\"sound\",\"mention\":\"sound,desktop,email\",\"sqwiggle_news_updates\":\"email\",\"sqwiggle_tips\":\"email\",\"onboard_invite\":\"\",\"onboard_busy\":\"\",\"onboard_conversation_start\":\"\",\"onboard_conversation_leave\":\"\",\"onboard_mentions\":\"\",\"onboard_notifications\":\"\",\"onboard_chrome_access\":\"\",\"onboard_invited\":\"popup\"},\"company\":{\"id\":1,\"name\":\"Sqwiggle\",\"user_count\":14,\"billing\":{\"receipts\":null,\"status\":\"paid\",\"email\":\"ericbieller@gmail.com\"},\"security\":{\"open_invites\":true,\"media_accept\":false},\"created_at\":\"2013-04-04T01:34:04Z\",\"path\":\"sqwiggle\"}}";
    
    NSData *data = [resp dataUsingEncoding:NSUTF8StringEncoding];
    return [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
}
@end
