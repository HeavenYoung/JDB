//
//  ProcessingOrderViewCell.m
//  JiaoDaBang
//
//  Created by Heaven on 08/04/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "ProcessingOrderViewCell.h"

@interface ProcessingOrderViewCell ()

@end

@implementation ProcessingOrderViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        self.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self placeSubviews];
    }
    return self;
}

- (void)placeSubviews {

    UIImageView *avatarView = [[UIImageView alloc] init];
    
    
    UIView *breakLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 115, self.bounds.size.width, 5)];
    breakLineView.backgroundColor = [UIColor colorWithHexString:@"#fafafa"];
    [self.contentView addSubview:breakLineView];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
