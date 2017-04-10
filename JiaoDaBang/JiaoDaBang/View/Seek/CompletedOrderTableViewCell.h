//
//  CompletedOrderTableViewCell.h
//  JiaoDaBang
//
//  Created by ott001 on 2017/4/9.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CompletedOrderTableViewCellDelegate <NSObject>

- (void)confirmOrder:(OrderData *)orderData;

- (void)chatWithUser:(OrderData *)orderData;

@end


@interface CompletedOrderTableViewCell : UITableViewCell

@property (nonatomic, strong) OrderData *orderData;
@property (nonatomic, weak) id <CompletedOrderTableViewCellDelegate> delegate;

@end
