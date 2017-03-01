//
//  OrderTypeResponse.m
//  JiaoDaBang
//
//  Created by Heaven on 2017/2/9.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "OrderTypeResponse.h"

@implementation OrderTypeResponse
- (void)parseResponseObject {
    
    NSDictionary *jsonObject = self.responseObject;
    
    NSInteger code = [[jsonObject objectForKey:@"state"] integerValue];
    
    if (code == CODE_SUCCESS) {
        
        NSArray *dataArray = [jsonObject objectForKeySafe:@"data"];
        if ([dataArray isKindOfClass:[NSArray class]]) {
            
            OrderTypeListData *orderTypeListData = [[OrderTypeListData alloc] init];
            
            NSMutableArray *mArray = [[NSMutableArray alloc] init];
            
            [dataArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
                OrderTypeInfoData *infoData = [[OrderTypeInfoData alloc] init];
                
                infoData.typeId = [obj objectForKey:@"typeid"];
                infoData.orderType = [obj objectForKey:@"ordertype"];
                
                [mArray addObject:infoData];
            }];
            
            orderTypeListData.orderTypeListArray = mArray.copy;
            
            [self showSuccessInfo:orderTypeListData];
            
        } else {
            
            [self showFailureInfo:NETWORK_ERROR_PARSE_FAILED];
            
        }
        
    } else {
        
        [self showFailureInfo:code];
    }
    
}

@end
