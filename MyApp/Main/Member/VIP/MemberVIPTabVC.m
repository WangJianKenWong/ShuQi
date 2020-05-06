
//
//  MemberVIPTabVC.m
//  MyApp
//
//  Created by apple on 2020/5/6.
//  Copyright © 2020 tii. All rights reserved.
//

#import "MemberVIPTabVC.h"
#import "MemberVIPColCell.h"
#import "MemberPayDetailVC.h"

@interface MemberVIPTabVC ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIView *zhouqiView;
@property (weak, nonatomic) IBOutlet UIButton *paypalBtn;
@property (weak, nonatomic) IBOutlet UIButton *wechatBtn;

@end

@implementation MemberVIPTabVC

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    ViewBorderRadius(self.zhouqiView, 3.33f, 1.f, [UIColor colorWithHexString:@"#F0F0F0"]);
    [self.collectionView registerNib:[UINib nibWithNibName:@"MemberVIPColCell" bundle:nil] forCellWithReuseIdentifier:@"MemberVIPColCell"];
    [self.paypalBtn setImage:ImageNamed(@"member_paypal_select") forState:UIControlStateNormal];
    [self.wechatBtn setImage:ImageNamed(@"member_wechat_noSelect") forState:UIControlStateNormal];
}
- (IBAction)goBACK:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Table view data source

- (IBAction)choosePayPal:(UIButton *)sender {
    self.wechatBtn.selected = NO;
    sender.selected = YES;
    [self.paypalBtn setImage:ImageNamed(@"member_paypal_select") forState:UIControlStateNormal];
    [self.wechatBtn setImage:ImageNamed(@"member_wechat_noSelect") forState:UIControlStateNormal];
}
- (IBAction)chooseWechat:(UIButton *)sender {
    self.paypalBtn.selected = NO;
    sender.selected = YES;
    [self.paypalBtn setImage:ImageNamed(@"member_paypal_noSelect") forState:UIControlStateNormal];
    [self.wechatBtn setImage:ImageNamed(@"member_wechat_select") forState:UIControlStateNormal];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return CGSizeMake(97, 125);
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MemberVIPColCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MemberVIPColCell" forIndexPath:indexPath];
    return cell;
}
- (IBAction)goToPayDetail:(id)sender {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Member" bundle:nil];
    MemberPayDetailVC *memberPayDetailVC = [sb instantiateViewControllerWithIdentifier:@"MemberPayDetailVC"];
    [self.navigationController pushViewController:memberPayDetailVC animated:YES];
}

@end
