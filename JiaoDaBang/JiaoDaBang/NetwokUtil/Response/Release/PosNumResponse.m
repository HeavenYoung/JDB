//
//  PosNumResponse.m
//  JiaoDaBang
//
//  Created by ott001 on 2017/4/12.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "PosNumResponse.h"

@implementation PosNumResponse

- (void)parseResponseObject {
    
    NSDictionary *jsonObject = self.responseObject;
    
    NSInteger code = [[jsonObject objectForKey:@"state"] integerValue];
    
    if (code == CODE_SUCCESS) {
        
        PosNumListData *listData = [[PosNumListData alloc] init];
        
        listData.count = [jsonObject integerForKeySafe:@"count"];
        listData.info = [jsonObject objectForKeySafe:@"info"];
        NSArray *dataArray = [jsonObject objectForKeySafe:@"data"];
        if ([dataArray isKindOfClass:[NSArray class]]) {
            
            NSMutableArray *mArray = [[NSMutableArray alloc] init];
            
            [dataArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
                NSDictionary *objDic = (NSDictionary *)obj;
                
                PosNumData *posNumData = [[PosNumData alloc] init];
                
                posNumData.srcId = [objDic objectForKeySafe:@"srcid"];
                posNumData.blockId = [objDic objectForKeySafe:@"blockid"];
                posNumData.count = [objDic objectForKeySafe:@"count"];
                posNumData.lng = [objDic objectForKeySafe:@"lng"];
                posNumData.lat = [objDic objectForKeySafe:@"lat"];
                [mArray addObject:posNumData];
            }];
            
            listData.posNumDataArray = mArray.copy;
            
            [self showSuccessInfo:listData];
            
        } else {
            
            [self showFailureInfo:NETWORK_ERROR_PARSE_FAILED];
            
        }
        
    } else {
        
        [self showFailureInfo:code];
    }
    
}


@end
