//
//  GetMessageFromWXResp+responseWithTextOrMediaMessage.m
//  MiTang_Client
//
//  Created by OTT on 16/5/10.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "GetMessageFromWXResp+responseWithTextOrMediaMessage.h"

@implementation GetMessageFromWXResp (responseWithTextOrMediaMessage)

+ (GetMessageFromWXResp *)responseWithText:(NSString *)text OrMediaMessage:(WXMediaMessage *)message bText:(BOOL)bText {
    GetMessageFromWXResp *resp = [[GetMessageFromWXResp alloc] init];
    resp.bText = bText;
    if (bText)
        resp.text = text;
    else
        resp.message = message;
    return resp;
}

@end
