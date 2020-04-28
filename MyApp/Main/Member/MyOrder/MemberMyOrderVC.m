//
//  MemberMyOrderVC.m
//  MyApp
//
//  Created by apple on 2020/4/28.
//  Copyright © 2020 tii. All rights reserved.
//

#import "MemberMyOrderVC.h"
#import "MemberMyOrderCell.h"

@interface MemberMyOrderVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation MemberMyOrderVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的订单";
    [self.view addSubview:self.tableView];
    self.view.backgroundColor = [UIColor colorWithHexString:@"F1F1F1"];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 152;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MemberMyOrderCell *cell = [[NSBundle mainBundle]loadNibNamed:@"MemberMyOrderCell" owner:nil options:nil][0];
    return cell;
}
//懒加载
- (UITableView *)tableView{
    if (!_tableView) {
         CGFloat heightY= kIs_iPhoneX?88:64;
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height-heightY) style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.backgroundColor = RGB(244, 244, 244);
        _tableView.dataSource = self;
    }
    return _tableView;
}
@end
