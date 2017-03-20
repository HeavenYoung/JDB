//
//  DeliveryListResponse.m
//  JiaoDaBang
//
//  Created by Heaven on 18/03/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "DeliveryListResponse.h"

@implementation DeliveryListResponse

- (void)parseResponseObject {
    
    NSDictionary *jsonObject = self.responseObject;
    
    NSInteger code = [[jsonObject objectForKey:@"state"] integerValue];
    
    if (code == CODE_SUCCESS) {
        
        NSArray *dataArray = [jsonObject objectForKeySafe:@"data"];
        if ([dataArray isKindOfClass:[NSArray class]]) {
            
           DeliveryListData *listData = [[DeliveryListData alloc] init];
            
            NSMutableArray *mArray = [[NSMutableArray alloc] init];
            
            [dataArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
                 DeliveryInfoData *infoData = [[BannerInfoData alloc] init];
                infoData.deliveryid = [obj objectForKey:@"deliveryid"];
                infoData.deliverytype = [obj objectForKey:@"deliverytype"];
                infoData.phoneNum = [obj objectForKey:@"phone_num"];
                infoData.stateid = [obj objectForKey:@"stateid"];
                infoData.state = [obj objectForKey:@"state"];
                infoData.orderid = [obj objectForKey:@"orderid"];
                
                [mArray addObject:infoData];
            }];
            
            listData.deliveryInfoDataArray = mArray.copy;
            
            [self showSuccessInfo:listData];
            
        } else {
            
            [self showFailureInfo:NETWORK_ERROR_PARSE_FAILED];
            
        }
        
    } else {
        
        [self showFailureInfo:code];
    }
    
}

@end
