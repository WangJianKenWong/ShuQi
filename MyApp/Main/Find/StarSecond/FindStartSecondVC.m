//
//  FindStartSecondVC.m
//  MyApp
//
//  Created by apple on 2020/4/29.
//  Copyright © 2020 tii. All rights reserved.
//

#import "FindStartSecondVC.h"
#import "FindStartSecondCell.h"

@interface FindStartSecondVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation FindStartSecondVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    self.view.backgroundColor = [UIColor colorWithHexString:@"F4F4F4"];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20.f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 32.f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 152;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor colorWithHexString:@"F4F4F4"];
    UILabel *titleLab = [[UILabel alloc]initWithFrame:CGRectMake(14, 0, 30, 20)];
    titleLab.text = @"A";
    titleLab.font = [UIFont systemFontOfSize:12];
    titleLab.textColor = [UIColor colorWithHexString:@"333333"];
    [view addSubview:titleLab];
    return view;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    UIButton *moreBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*0.5-100, 0, 200, 32.f)];
    [moreBtn setTitleColor:[UIColor colorWithHexString:@"333333"] forState:UIControlStateNormal];
    [moreBtn setTitle:@"展开更多" forState:UIControlStateNormal];
    moreBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [moreBtn setImage:ImageNamed(@"find_more") forState:UIControlStateNormal];
    [moreBtn setImage:ImageNamed(@"find_more") forState:UIControlStateHighlighted];
    [moreBtn buttonDistance:6.8 direction:right];
    [view addSubview:moreBtn];
    return view;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 10;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FindStartSecondCell *cell = [[NSBundle mainBundle]loadNibNamed:@"FindStartSecondCell" owner:nil options:nil][0];
    cell.currentVC = self;
    return cell;
}
//懒加载
- (UITableView *)tableView{
    if (!_tableView) {
         CGFloat heightY= kIs_iPhoneX?88:64;
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, -32, self.view.width, self.view.height-heightY-68) style:UITableViewStyleGrouped];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.tableFooterView = [UIView new];
        _tableView.tableHeaderView = [UIView new];
        _tableView.delegate = self;
        _tableView.backgroundColor = [UIColor colorWithHexString:@"F4F4F4"];
        _tableView.dataSource = self;
    }
    return _tableView;
}
@end
