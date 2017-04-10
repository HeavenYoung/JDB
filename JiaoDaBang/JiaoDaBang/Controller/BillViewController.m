//
//  BillViewController.m
//  JiaoDaBang
//
//  Created by ott001 on 2017/4/7.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "BillViewController.h"
#import "BillTableViewCell.h"

@interface BillViewController () <UITableViewDelegate , UITableViewDataSource>

@property (nonatomic , weak) UITableView *tableView;
@property (nonatomic , strong) NSMutableArray *dataListArray;
@property (nonatomic , copy) NSString *page;


@end

@implementation BillViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"账单记录";
    self.view.backgroundColor = [UIColor colorWithHexString:@"#fafafa"];
    self.page = @"1";
    [self setupUI];
}

- (void)setupUI{
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

- (void)loadData{
    BillRequest *billRequest = [[BillRequest alloc] init];
    [billRequest setParametersWithUserId:[GlobalManager sharedManager].userId page:self.page];
    [billRequest setSuccessBlock:^(id object, id responseObject) {
        DLog("-----zhangdanchengg");
        self.page = [NSString stringWithFormat:@"%d", self.page.integerValue+1];
        
        BillListData *billListData = (BillListData *)object;
        
        [self.dataListArray addObjectsFromArray:billListData.billDataArray];
        
        if (self.dataListArray.count >= billListData.count || billListData.billDataArray.count == 0) {
            [self.tableView.footer endRefreshingWithNoMoreData];
        } else {
        
            [self.tableView.footer endRefreshing];
        }
        
        [self.tableView reloadData];
    }];
    
    [billRequest setFailureBlock:^(NSInteger errorCode, id responseObject) {
        [self.tableView.footer endRefreshing];
        DLog("-----zhangdanshibai");
    }];
    
    [billRequest sendRequest];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return  1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataListArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 75;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    BillData *billData = self.dataListArray[indexPath.row];
    
    BillTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"bill"];
    
    if (cell == nil) {
        cell = [[BillTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"bill"];
    }

    cell.billData = billData;
    
    return cell;
}

- (NSMutableArray *)dataListArray {
    if (_dataListArray == nil) {
        _dataListArray = [[NSMutableArray alloc] init];
    }
    return _dataListArray;
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
