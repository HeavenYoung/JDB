//
//  OrderTableViewCell.h
//  JiaoDaBang
//
//  Created by ott001 on 2017/4/10.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ReleaseOrderTableViewCellDelegate <NSObject>

- (void)confirmOrder:(OrderData *)orderData;


@end

@interface ReleaseOrderTableViewCell : UITableViewCell

@property (nonatomic, weak) id <ReleaseOrderTableViewCellDelegate> delegate;

@property (nonatomic, strong) OrderData *orderData;

@end
