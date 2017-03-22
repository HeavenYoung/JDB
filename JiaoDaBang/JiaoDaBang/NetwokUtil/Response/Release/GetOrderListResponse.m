//
//  GetOrderListResponse.m
//  JiaoDaBang
//
//  Created by Heaven on 20/03/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "GetOrderListResponse.h"

@implementation GetOrderListResponse
- (void)parseResponseObject {
    
    NSDictionary *jsonObject = self.responseObject;
    
    NSInteger code = [[jsonObject objectForKey:@"state"] integerValue];
    
    if (code == CODE_SUCCESS) {
        
        OrderListData *listData = [[OrderListData alloc] init];

        listData.orderCount = [jsonObject objectForKeySafe:@"count"];
        listData.orderInfo = [jsonObject objectForKeySafe:@"info"];
        
        NSArray *dataArray = [jsonObject objectForKeySafe:@"data"];
        if ([dataArray isKindOfClass:[NSArray class]]) {
            
            NSMutableArray *mArray = [[NSMutableArray alloc] init];
            
            [dataArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
                NSDictionary *objDic = (NSDictionary *)obj;
                
                OrderData *orderdata = [[OrderData alloc] init];
                
                orderdata.orderId = [objDic objectForKeySafe:@"orderid"];
                orderdata.orderType = [objDic objectForKeySafe:@"ordertype"];
                orderdata.orderTypeName = [objDic objectForKeySafe:@"ordertypename"];
                orderdata.mainType = [objDic objectForKeySafe:@"maintype"];
                orderdata.releaseUserName = [objDic objectForKeySafe:@"releaseusername"];
                orderdata.releaseSex = [objDic objectForKeySafe:@"releasesex"];
                orderdata.releaseNickName = [objDic objectForKeySafe:@"releasenickname"];
                orderdata.releaseAvatar = [objDic objectForKeySafe:@"releaseavatar"];
                orderdata.releaseSchool = [objDic objectForKeySafe:@"releaseschool"];
                orderdata.orderId = [objDic objectForKeySafe:@"orderid"];
                orderdata.orderId = [objDic objectForKeySafe:@"orderid"];
                orderdata.srcId = [objDic objectForKeySafe:@"srcid"];
                orderdata.srcName = [objDic objectForKeySafe:@"srcname"];
                orderdata.srcDetail = [objDic objectForKeySafe:@"srcdetail"];
                orderdata.desId = [objDic objectForKeySafe:@"desid"];
                orderdata.desName = [objDic objectForKeySafe:@"desname"];
                orderdata.desDetail = [objDic objectForKeySafe:@"desdetail"];
                orderdata.money = [objDic objectForKeySafe:@"money"];
                orderdata.payType = [objDic objectForKeySafe:@"paytype"];
                orderdata.remark = [objDic objectForKeySafe:@"remark"];
                orderdata.createTime = [objDic objectForKeySafe:@"createtime"];
                orderdata.stateId = [objDic objectForKeySafe:@"stateid"];
                orderdata.state = [objDic objectForKeySafe:@"state"];
                orderdata.acceptUserName = [objDic objectForKeySafe:@"acceptusername"];
                orderdata.acceptSex = [objDic objectForKeySafe:@"acceptsex"];
                orderdata.acceptNickName = [objDic objectForKeySafe:@"acceptnickname"];
                orderdata.releaseAvatar = [objDic objectForKeySafe:@"acceptavator"];
                orderdata.finishTime = [objDic objectForKeySafe:@"finishtime"];
                
                [mArray addObject:orderdata];
            }];
            
            listData.listDataArray = mArray.copy;
            
            [self showSuccessInfo:listData];
            
        } else {
            
            [self showFailureInfo:NETWORK_ERROR_PARSE_FAILED];
            
        }
        
    } else {
        
        [self showFailureInfo:code];
    }
    
}

@end
