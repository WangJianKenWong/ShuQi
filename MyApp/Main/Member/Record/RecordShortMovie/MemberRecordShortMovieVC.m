//
//  MemberRecordShortMovieVC.m
//  MyApp
//
//  Created by apple on 2020/4/28.
//  Copyright © 2020 tii. All rights reserved.
//

#import "MemberRecordShortMovieVC.h"
#import "MemberRecordShortMovieCell.h"

@interface MemberRecordShortMovieVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation MemberRecordShortMovieVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    self.view.backgroundColor = [UIColor whiteColor];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 45;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(15, 15, 100, 15)];
    title.text = @"今天";
    title.font = [UIFont boldSystemFontOfSize:16];
    title.textColor = [UIColor colorWithHexString:@"333333"];
    [view addSubview:title];
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 113+14;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MemberRecordShortMovieCell *cell = [[NSBundle mainBundle]loadNibNamed:@"MemberRecordShortMovieCell" owner:nil options:nil][0];
    return cell;
}
//懒加载
- (UITableView *)tableView{
    if (!_tableView) {
         CGFloat heightY= kIs_iPhoneX?88:64;
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 10, self.view.width, self.view.height-heightY-10-50) style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.tableHeaderView = [UIView new];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.dataSource = self;
    }
    return _tableView;
}
@end
