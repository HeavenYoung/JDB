//
//  GetOrderByIdResponse.m
//  JiaoDaBang
//
//  Created by Heaven on 20/03/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "GetOrderByIdResponse.h"

@implementation GetOrderByIdResponse
- (void)parseResponseObject {
    
    NSDictionary *jsonObject = self.responseObject;
    
    NSInteger code = [[jsonObject objectForKey:@"state"] integerValue];
    
    if (code == CODE_SUCCESS) {
        
        NSDictionary *dataDic = [jsonObject objectForKeySafe:@"data"];
        if ([dataDic isKindOfClass:[NSDictionary class]]) {
            
            OrderData *orderdata = [[OrderData alloc] init];
            
            orderdata.orderId = [dataDic objectForKeySafe:@"orderid"];
            orderdata.orderType = [dataDic objectForKeySafe:@"ordertype"];
            orderdata.orderTypeName = [dataDic objectForKeySafe:@"ordertypename"];
            orderdata.mainType = [dataDic objectForKeySafe:@"maintype"];
            orderdata.releaseUserName = [dataDic objectForKeySafe:@"releaseusername"];
            orderdata.releaseSex = [dataDic objectForKeySafe:@"releasesex"];
            orderdata.releaseNickName = [dataDic objectForKeySafe:@"releasenickname"];
            orderdata.releaseAvatar = [dataDic objectForKeySafe:@"releaseavatar"];
            orderdata.releaseSchool = [dataDic objectForKeySafe:@"releaseschool"];
            orderdata.orderId = [dataDic objectForKeySafe:@"orderid"];
            orderdata.orderId = [dataDic objectForKeySafe:@"orderid"];
            orderdata.srcId = [dataDic objectForKeySafe:@"srcid"];
            orderdata.srcName = [dataDic objectForKeySafe:@"srcname"];
            orderdata.srcDetail = [dataDic objectForKeySafe:@"srcdetail"];
            orderdata.desId = [dataDic objectForKeySafe:@"desid"];
            orderdata.desName = [dataDic objectForKeySafe:@"desname"];
            orderdata.desDetail = [dataDic objectForKeySafe:@"desdetail"];
            orderdata.money = [dataDic objectForKeySafe:@"money"];
            orderdata.payType = [dataDic objectForKeySafe:@"paytype"];
            orderdata.remark = [dataDic objectForKeySafe:@"remark"];
            orderdata.createTime = [dataDic objectForKeySafe:@"createtime"];
            orderdata.stateId = [dataDic objectForKeySafe:@"stateid"];
            orderdata.state = [dataDic objectForKeySafe:@"state"];
            orderdata.acceptUserName = [dataDic objectForKeySafe:@"acceptusername"];
            orderdata.acceptSex = [dataDic objectForKeySafe:@"acceptsex"];
            orderdata.acceptNickName = [dataDic objectForKeySafe:@"acceptnickname"];
            orderdata.releaseAvatar = [dataDic objectForKeySafe:@"acceptavator"];
            orderdata.finishTime = [dataDic objectForKeySafe:@"finishtime"];
            
            [self showSuccessInfo:orderdata];
            
        } else {
            
            [self showFailureInfo:NETWORK_ERROR_PARSE_FAILED];
            
        }
        
    } else {
        
        [self showFailureInfo:code];
    }
    
}

@end
