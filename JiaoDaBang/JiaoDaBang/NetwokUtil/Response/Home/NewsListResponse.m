//
//  NewsListResponse.m
//  JiaoDaBang
//
//  Created by Heaven on 18/03/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "NewsListResponse.h"

@implementation NewsListResponse

- (void)parseResponseObject {
    
    NSDictionary *jsonObject = self.responseObject;
    
    NSInteger code = [[jsonObject objectForKey:@"state"] integerValue];
    
    if (code == CODE_SUCCESS) {
        
        NSArray *dataArray = [jsonObject objectForKeySafe:@"data"];
        if ([dataArray isKindOfClass:[NSArray class]]) {
            
            NewsListData *listData = [[NewsListData alloc] init];
            
            NSMutableArray *mArray = [[NSMutableArray alloc] init];
            
            [dataArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
                NewsInfoData *infoData = [[NewsInfoData alloc] init];
                NSString *newsIdStr = [obj objectForKey:@"newsid"];
                infoData.newsId = newsIdStr;
                infoData.title = [obj objectForKey:@"title"];
                infoData.content = [obj objectForKey:@"content"];
                infoData.newsUrl = [obj objectForKey:@"newsurl"];
                infoData.createtime = [obj objectForKey:@"createtime"];
                
                [mArray addObject:infoData];
            }];
            
            listData.dataListArray = mArray.copy;
            
            [self showSuccessInfo:listData];
            
        } else {
            
            [self showFailureInfo:NETWORK_ERROR_PARSE_FAILED];
            
        }
        
    } else {
        
        [self showFailureInfo:code];
    }
    
}

@end
