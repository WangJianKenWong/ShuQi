//
//  FindStartSecondDetailVC.m
//  MyApp
//
//  Created by apple on 2020/4/29.
//  Copyright © 2020 tii. All rights reserved.
//

#import "FindStartSecondDetailVC.h"
#import "FindStartSecondDetailCell.h"
#import "FindStartSecondDetailCell1.h"

@interface FindStartSecondDetailVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation FindStartSecondDetailVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"演员介绍";
    [self.view addSubview:self.tableView];
    self.view.backgroundColor = [UIColor whiteColor];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 152;
    }
    return self.view.height-152;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        FindStartSecondDetailCell *cell = [[NSBundle mainBundle]loadNibNamed:@"FindStartSecondDetailCell" owner:nil options:nil][0];
        return cell;
    }
    FindStartSecondDetailCell1 *cell = [[NSBundle mainBundle]loadNibNamed:@"FindStartSecondDetailCell1" owner:nil options:nil][0];
    return cell;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint offset = self.tableView.contentOffset;
    if (offset.y <= 0) {
        offset.y = 0;
    }
    self.tableView.contentOffset = offset;
}
//懒加载
- (UITableView *)tableView{
    if (!_tableView) {
         CGFloat heightY= kIs_iPhoneX?88:64;
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height-heightY) style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.tableFooterView = [UIView new];
        _tableView.tableHeaderView = [UIView new];
        _tableView.delegate = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.dataSource = self;
    }
    return _tableView;
}
@end
