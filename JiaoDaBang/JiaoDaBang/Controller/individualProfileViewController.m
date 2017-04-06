//
//  individualProfileViewController.m
//  JiaoDaBang
//
//  Created by 詹鹏翼 on 2017/4/6.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "individualProfileViewController.h"
#import "AboutViewController.h"

@interface individualProfileViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *profileTableView;

@end

@implementation individualProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithHexString:@"#fafafa"];

    [self setUptableView];
}

- (void)setUptableView {
    
    UITableView *profileTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 300) style:UITableViewStylePlain];
    profileTableView.delegate = self;
    profileTableView.dataSource = self;
    profileTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:profileTableView];
    self.profileTableView = profileTableView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Delegate Method
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 5;
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
        cell.textLabel.text = @"头像";
    } else if (indexPath.row == 1) {
        
        cell.textLabel.text = @"昵称";
    } else if (indexPath.row == 2) {
        
        cell.textLabel.text = @"手机号";
    } else if (indexPath.row == 3) {
        
        cell.textLabel.text = @"性别";
    } else if (indexPath.row == 4) {
        
        cell.textLabel.text = @"学校";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        
    } else if (indexPath.row == 1) {
        
    } else if (indexPath.row == 2) {
        
        AboutViewController *about = [[AboutViewController alloc] init];
        [self.navigationController pushViewController:about animated:YES];
        
    }else if (indexPath.row == 3) {
        
    }else if (indexPath.row == 4) {
        
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
