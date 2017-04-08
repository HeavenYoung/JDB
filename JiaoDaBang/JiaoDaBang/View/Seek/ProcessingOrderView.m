//
//  ProcessingOrderView.m
//  JiaoDaBang
//
//  Created by Heaven on 08/04/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "ProcessingOrderView.h"
#import "ProcessingOrderViewCell.h"

@interface ProcessingOrderView () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataListArray;

@end

@implementation ProcessingOrderView

- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
    
        [self placeSubview];
    }
    return self;
}

- (void)placeSubview {
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addSubview:tableView];
    self.tableView = tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 120;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    return [[ProcessingOrderViewCell alloc] init];
}

- (void)setDataArray:(NSArray *)dataArray {

    [self.dataListArray addObjectsFromArray:dataArray];
    [self.tableView reloadData];
}

- (NSMutableArray *)dataListArray {

    if(_dataListArray == nil) {
    
        _dataListArray = [[NSMutableArray alloc] init];
    }
    return _dataListArray;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
