//
//  NewsInfo.h
//  JiaoDaBang
//
//  Created by Heaven on 2017/2/8.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsListData : NSObject

@property (nonatomic, strong) NSArray *dataListArray;

@end

@interface NewsInfoData : NSObject

@property (nonatomic, copy) NSString *newsId;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *newsUrl;
@property (nonatomic, copy) NSString *createtime;

@end
