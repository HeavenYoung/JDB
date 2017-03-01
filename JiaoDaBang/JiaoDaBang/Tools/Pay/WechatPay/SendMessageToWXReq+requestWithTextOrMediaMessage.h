//
//  SendMessageToWXReq+requestWithTextOrMediaMessage.h
//  MiTang_Client
//
//  Created by OTT on 16/5/10.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "WXApiObject.h"

@interface SendMessageToWXReq (requestWithTextOrMediaMessage)


+ (SendMessageToWXReq *)requestWithText:(NSString *)text
                         OrMediaMessage:(WXMediaMessage *)message
                                  bText:(BOOL)bText
                                InScene:(enum WXScene)scene;

@end
