//
//  BillResponse.m
//  JiaoDaBang
//
//  Created by ott001 on 2017/4/8.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "BillResponse.h"

@implementation BillResponse

- (void)parseResponseObject {
    
    NSDictionary *jsonObject = self.responseObject;
    
    NSInteger code = [[jsonObject objectForKey:@"state"] integerValue];
    
    if (code == CODE_SUCCESS) {
        
        BillListData *listData = [[BillListData alloc] init];
        
        listData.count = [jsonObject objectForKeySafe:@"count"];
        listData.info = [jsonObject objectForKeySafe:@"info"];
        
        NSArray *dataArray = [jsonObject objectForKeySafe:@"data"];
        if ([dataArray isKindOfClass:[NSArray class]]) {
            
            NSMutableArray *mArray = [[NSMutableArray alloc] init];
            
            [dataArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
                NSDictionary *objDic = (NSDictionary *)obj;
                
                BillData *billData = [[BillData alloc] init];
                
                billData.billId = [objDic objectForKeySafe:@"billid"];
                billData.userId = [objDic objectForKeySafe:@"userid"];
                billData.userName = [objDic objectForKeySafe:@"username"];
                billData.money = [objDic objectForKeySafe:@"money"];
                billData.time = [objDic objectForKeySafe:@"time"];
                billData.orderId = [objDic objectForKeySafe:@"orderid"];
                billData.orderType = [objDic objectForKeySafe:@"ordertype"];
                [mArray addObject:billData];
            }];
            
            listData.billDataArray = mArray.copy;
            
            [self showSuccessInfo:listData];
            
        } else {
            
            [self showFailureInfo:NETWORK_ERROR_PARSE_FAILED];
            
        }
        
    } else {
        
        [self showFailureInfo:code];
    }
    
}


@end
