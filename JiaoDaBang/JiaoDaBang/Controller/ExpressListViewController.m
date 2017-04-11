//
//  ExpressListViewController.m
//  JiaoDaBang
//
//  Created by ott001 on 2017/4/10.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "ExpressListViewController.h"
#import "ExpressTableViewCell.h"


@interface ExpressListViewController () <UITableViewDelegate , UITableViewDataSource, ExpressTableViewCellDelegate>

@property (nonatomic , weak) UITableView *tableView;
@property (nonatomic , strong) NSMutableArray *dataListArray;

@end

@implementation ExpressListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的快递";
    self.view.backgroundColor = [UIColor colorWithHexString:@"#fafafa"];
    [self setupUI];
}

- (void)setupUI{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-69) style:UITableViewStylePlain];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    [self loadData];
    
}

- (void)loadData{
    DeliveryListRequest *dlRequest = [[DeliveryListRequest alloc] init];
    [dlRequest setParametersWithUserId:[GlobalManager sharedManager].userId];
    [dlRequest setSuccessBlock:^(id object, id responseObject) {
        DLog("-----zhangdanchengg");
        
        DeliveryListArrayData *deliveryListArrayData = (DeliveryListArrayData *)object;
        
        [self.dataListArray addObjectsFromArray:deliveryListArrayData.deliveryInfoDataArray];
        
        [self.tableView reloadData];
    }];
    
    [dlRequest setFailureBlock:^(NSInteger errorCode, id responseObject) {
        DLog("-----zhangdanshibai");
    }];
    
    [dlRequest sendRequest];
    
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
    
    DeliveryInfoData *deliveryInfoData = self.dataListArray[indexPath.row];
    
    ExpressTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"delivery"];
    
    if (cell == nil) {
        cell = [[ExpressTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"delivery"];
    }
    
    cell.deliveryInfoData = deliveryInfoData;
    
    return cell;
}

- (void)sendExpress:(DeliveryInfoData *)deliveryInfoData {

    
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
