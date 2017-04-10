//
//  AcceptOrderViewController.m
//  JiaoDaBang
//
//  Created by ott001 on 2017/4/10.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "AcceptOrderViewController.h"
#import "AcceptOrderTableViewCell.h"
#import "OrderDetailViewController.h"

@interface AcceptOrderViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataListArray;

@property (nonatomic, strong) NSString *page;

@property (nonatomic, strong) NSString *orderType;

@end

@implementation AcceptOrderViewController

- (instancetype)initWithOrderType:(NSString *)orderType {
    
    self = [super init];
    if (self) {
        self.orderType = orderType;
        self.page = @"1";

        [self placeSubview];

    }
    return self;
}

- (void)placeSubview {
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-69) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    RefreshAutoStateNormalFooter *footer = [RefreshAutoStateNormalFooter footerWithRefreshingBlock:^{
        [self loadData];
    }];
    footer.stateLabel.hidden = YES;
    footer.refreshingTitleHidden = YES;
    self.tableView.footer = footer;
    [self.tableView.footer beginRefreshing];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataListArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 160;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    OrderData *orderData = self.dataListArray[indexPath.row];
    
    AcceptOrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"order"];
    if (cell == nil) {
        cell = [[AcceptOrderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"order"];
    }
    
    cell.orderData = orderData;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
        
    OrderData *orderData = self.dataListArray[indexPath.row];
    
    OrderDetailViewController *orderDetailVC = [[OrderDetailViewController alloc] initWithOrderData:orderData];
    [self.navigationController pushViewController:orderDetailVC animated:YES];
}

- (void)loadData {
    
    GetOrderListRequest *request = [[GetOrderListRequest alloc] init];
    [request setParametersWithUserId:[GlobalManager sharedManager].userId acceptUserId:@"" page:self.page action:self.orderType];
    [request setSuccessBlock:^(id object, id responseObject) {
        
        DLog(@"-------订单请求成功-------");
        
        self.page = [NSString stringWithFormat:@"%d", self.page.integerValue+1];
        
        OrderListData *listData = (OrderListData *)object;
        
        [self.dataListArray addObjectsFromArray:listData.listDataArray];
        
        if (self.dataListArray.count >= listData.orderCount.integerValue || listData.listDataArray.count == 0) {
            
            [self.tableView.footer endRefreshingWithNoMoreData];
        } else {
            
            [self.tableView.footer endRefreshing];
        }
        
        [self.tableView reloadData];
    }];
    [request setFailureBlock:^(NSInteger errorCode, id responseObject) {
        
        DLog(@"-------订单请求失败-------");
        
        [self.tableView.footer endRefreshing];
        
    }];
    [request sendRequest];
    
}

- (NSMutableArray *)dataListArray {
    
    if(_dataListArray == nil) {
        
        _dataListArray = [[NSMutableArray alloc] init];
    }
    return _dataListArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
