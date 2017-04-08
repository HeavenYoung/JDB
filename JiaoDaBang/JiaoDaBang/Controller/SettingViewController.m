//
//  SettingViewController.m
//  JiaoDaBang
//
//  Created by Heaven on 05/04/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "SettingViewController.h"
#import "AboutViewController.h"
#import "SDImageCache.h"

#import "individualProfileViewController.h"
#import "OrderDetailViewController.h"
#import "AccountViewController.h"

@interface SettingViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"#fafafa"];
    
    [self setUptableView];
    [self setupLogout];
}

- (void)setUptableView {

    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 180) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:tableView];
    self.tableView = tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"setting"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"setting"];
    }
    if (indexPath.row == 0) {
        cell.textLabel.text = @"清除缓存";
    } else if (indexPath.row == 1) {
    
        cell.textLabel.text = @"账户安全";
    } else if (indexPath.row == 2) {
    
        cell.textLabel.text = @"关于我们";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.row == 0) {
        
        NSString *cachPath = [@"com.hackemist.SDWebImageCache.default" appendCacheDir];
        [[NSFileManager defaultManager] removeItemAtPath:cachPath error:NULL];
        [[SDImageCache sharedImageCache] clearDisk];
        
        [SVProgressHUD showInfoWithStatus:@"清理完成"];
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
        
    } else if (indexPath.row == 1) {
//        individualProfileViewController *profile = [[individualProfileViewController alloc] init];
//        [self.navigationController pushViewController:profile animated:YES];
//          OrderDetailViewController *order = [[OrderDetailViewController alloc] init];
//          [self.navigationController pushViewController:order animated:YES];
        AccountViewController *accountVC = [[AccountViewController alloc] init];
        [self.navigationController pushViewController:accountVC animated:YES];
    } else if (indexPath.row == 2) {
    
        AboutViewController *about = [[AboutViewController alloc] init];
        [self.navigationController pushViewController:about animated:YES];
    
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)setupLogout {

    // 按钮
    UIButton *logountBtn = [UIButton buttonWithTitle:@"退出登录"
                                          normalColor:CustomGreen
                                     highlightedColor:CustomGreen
                                            titleFont:[UIFont systemFontOfSize:16]
                                            imageName:nil
                                        backImageName:nil
                                               target:self
                                               action:@selector(logountBtnDidClicked)];
    logountBtn.frame = CGRectMake(10, 260, SCREEN_WIDTH - 20, 40);
    logountBtn.backgroundColor = [UIColor lightTextColor];
    logountBtn.layer.cornerRadius = 5.0;
    logountBtn.layer.masksToBounds = YES;
    [self.view addSubview:logountBtn];
}

- (void)logountBtnDidClicked {

    UIAlertController *alter = [UIAlertController alertControllerWithTitle:nil message:@"确定退出登录" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self logout];
    }];
    
    [alter addAction:cancelAction];
    [alter addAction:confirmAction];
    [self presentViewController:alter animated:YES completion:nil];

}

- (void)logout {

    [[GlobalManager sharedManager] logout];
    
    [self.navigationController popViewControllerAnimated:YES];
   
    [[MessageUtil shareMessageManage] userlogoutWithName:nil password:@"123456"];

    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFCATION_USER_SETTINGLOGOUT object:nil];
    
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
