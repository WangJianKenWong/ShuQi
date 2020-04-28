//
//  MemberMainVC.m
//  MyApp
//
//  Created by apple on 2020/4/25.
//  Copyright © 2020 tii. All rights reserved.
//

#import "MemberMainVC.h"
#import "MemeberNoLogVC.h"
#import "MemberMyCollectVC.h"
#import "MemberMyOrderVC.h"
#import "MemberRecordVC.h"

@interface MemberMainVC ()
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIView *centerView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIButton *shareBtn;
@property (weak, nonatomic) IBOutlet UIButton *collecBtn;
@property (weak, nonatomic) IBOutlet UIButton *recordBtn;
@property (weak, nonatomic) IBOutlet UIButton *orderBtn;
@property (weak, nonatomic) IBOutlet UIButton *contactBtn;

@end

@implementation MemberMainVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewDidAppear:(BOOL)animated{
//    self.tableView.frame = CGRectMake(0, -20, SCREEN_WIDTH, SCREEN_HEIGHT+20);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    ViewRadius(_topView, 3.5f);
    ViewRadius(_centerView, 3.5f);
    ViewRadius(_bottomView, 3.5f);
    [self.shareBtn buttonDistance:5 direction:left];
    [self.collecBtn buttonDistance:8 direction:top];
    [self.recordBtn buttonDistance:8 direction:top];
    [self.orderBtn buttonDistance:8 direction:top];
    [self.contactBtn buttonDistance:8 direction:top];
//    [self addNOLogVC];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint offset = self.tableView.contentOffset;
    if (offset.y <= 0) {
        offset.y = 0;
    }
    self.tableView.contentOffset = offset;
}
//我的收藏
- (IBAction)goToMyCollect:(id)sender {
    MemberMyCollectVC *memberMyCollectVC = [MemberMyCollectVC new];
    [self.navigationController pushViewController:memberMyCollectVC animated:YES];
}
//观看记录
- (IBAction)goToRecord:(id)sender {
    MemberRecordVC *memberRecordVC = [MemberRecordVC new];
    [self.navigationController pushViewController:memberRecordVC animated:YES];
}
//我的订单
- (IBAction)goToMyOrder:(id)sender {
    MemberMyOrderVC *memberMyOrderVC = [MemberMyOrderVC new];
    [self.navigationController pushViewController:memberMyOrderVC animated:YES];
}
//联系客服
- (IBAction)goToContact:(id)sender {
    
}

//兑换vip
- (IBAction)goToChangeVip:(id)sender {
    [self goToMemberDetailVC:@"MemberChangeVIP"];
}
//支付申诉
- (IBAction)toToPayShensu:(id)sender {
    [self goToMemberDetailVC:@"MemberPayShensuVC"];
}
//填写邀请码
- (IBAction)goToVisiteCode:(id)sender {
    [self goToMemberDetailVC:@"MemberVisiteCodeVC"];
}
//账户管理
- (IBAction)goToAccountManager:(id)sender {
    [self goToMemberDetailVC:@"MemberAccountManagerVC"];
}

- (void)goToMemberDetailVC:(NSString *)str{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Member" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:str];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)addNOLogVC{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Member" bundle:nil];
    MemeberNoLogVC *memeberNoLogVC = [sb instantiateViewControllerWithIdentifier:@"MemeberNoLogVC"];
    [self.view addSubview:memeberNoLogVC.view];
    [self addChildViewController:memeberNoLogVC];
}
@end
