//
//  LocalPointResponse.m
//  JiaoDaBang
//
//  Created by Heaven on 2017/2/9.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "LocalPointResponse.h"

@implementation LocalPointResponse

- (void)parseResponseObject {
    
    NSDictionary *jsonObject = self.responseObject;
    
    NSInteger code = [[jsonObject objectForKey:@"state"] integerValue];
    
    if (code == CODE_SUCCESS) {
        
        NSArray *dataArray = [jsonObject objectForKeySafe:@"data"];
        if ([dataArray isKindOfClass:[NSArray class]]) {
            
            LocalPointListData *localPointList = [[LocalPointListData alloc] init];
            
            NSMutableArray *mArray = [[NSMutableArray alloc] init];
            
            [dataArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
                LocalPointInfoData *infoData = [[LocalPointInfoData alloc] init];
                
                infoData.posId = [obj objectForKey:@"posid"];
                infoData.blockId = [obj objectForKey:@"blockid"];
                infoData.posName = [obj objectForKey:@"posname"];
                
                [mArray addObject:infoData];
            }];
            
            localPointList.localPointListArray = mArray.copy;
            
            [self showSuccessInfo:localPointList];
            
        } else {
            
            [self showFailureInfo:NETWORK_ERROR_PARSE_FAILED];
            
        }
        
    } else {
        
        [self showFailureInfo:code];
    }
    
}


@end
