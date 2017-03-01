//
//  GetMessageFromWXResp+responseWithTextOrMediaMessage.h
//  MiTang_Client
//
//  Created by OTT on 16/5/10.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "WXApiObject.h"

@interface GetMessageFromWXResp (responseWithTextOrMediaMessage)

+ (GetMessageFromWXResp *)responseWithText:(NSString *)text OrMediaMessage:(WXMediaMessage *)message bText:(BOOL)bText;

@end
