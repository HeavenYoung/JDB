//
//  RaiseLabelListResponse.m
//  JiaoDaBang
//
//  Created by Heaven on 20/03/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "RaiseLabelListResponse.h"

@implementation RaiseLabelListResponse

- (void)parseResponseObject {
    
    NSDictionary *jsonObject = self.responseObject;
    
    NSInteger code = [[jsonObject objectForKey:@"state"] integerValue];
    
    if (code == CODE_SUCCESS) {
        
        NSArray *dataArray = [jsonObject objectForKeySafe:@"data"];
        if ([dataArray isKindOfClass:[NSArray class]]) {
            
            RaiseLabelListData *ListData = [[RaiseLabelListData alloc] init];
            
            NSMutableArray *mArray = [[NSMutableArray alloc] init];
            
            [dataArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
                RaiseLabelData *infoData = [[RaiseLabelData alloc] init];
                
                infoData.appraiselabelid = [obj objectForKey:@"appraiselabelid"];
                infoData.appraiselabel = [obj objectForKey:@"appraiselabel"];
                infoData.appraiselevel = [obj objectForKey:@"appraiselevel"];
                
                [mArray addObject:infoData];
            }];
            
            ListData.dataListArray = mArray.copy;
            
            [self showSuccessInfo:ListData];
            
        } else {
            
            [self showFailureInfo:NETWORK_ERROR_PARSE_FAILED];
            
        }
        
    } else {
        
        [self showFailureInfo:code];
    }
    
}

@end
