//
//  HomeBannerListResponse.m
//  JiaoDaBang
//
//  Created by Heaven on 18/03/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "HomeBannerListResponse.h"

@implementation HomeBannerListResponse

- (void)parseResponseObject {
    
    NSDictionary *jsonObject = self.responseObject;
    
    NSInteger code = [[jsonObject objectForKey:@"state"] integerValue];
    
    if (code == CODE_SUCCESS) {
        
        NSArray *dataArray = [jsonObject objectForKeySafe:@"data"];
        if ([dataArray isKindOfClass:[NSArray class]]) {
            
            HomeBannerInfoData *bannerInfoData = [[HomeBannerInfoData alloc] init];
            
            NSMutableArray *mArray = [[NSMutableArray alloc] init];
            
            [dataArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
                BannerInfoData *infoData = [[BannerInfoData alloc] init];
                
                infoData.bannerId = [obj objectForKey:@"bannerid"];
                infoData.bannerUrl = [obj objectForKey:@"bannerurl"];
                infoData.requestUrl = [obj objectForKey:@"requesturl"];
                
                [mArray addObject:infoData];
            }];
            
            bannerInfoData.bannerDataArray = mArray.copy;
            
            [self showSuccessInfo:bannerInfoData];
        
        } else {
            
            [self showFailureInfo:NETWORK_ERROR_PARSE_FAILED];
            
        }
        
    } else {
        
        [self showFailureInfo:code];
    }
    
}

@end
