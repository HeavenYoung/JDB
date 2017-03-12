//
//  WalletTableViewCell.h
//  页面
//
//  Created by apple on 17/3/2.
//  Copyright © 2017年 Sunjiandong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WalletTableViewCell : UITableViewCell
/*------图-------*/
// 图标
@property (nonatomic, strong) UIImageView *iconImg;
/*------字-------*/
// 标题
@property (nonatomic, strong) UILabel *title;
// 资金
@property (nonatomic, strong) UILabel *money;
@end
