//
//  MemberProvoteMainVC.m
//  MyApp
//
//  Created by apple on 2020/4/28.
//  Copyright © 2020 tii. All rights reserved.
//

#import "MemberProvoteMainVC.h"
#import "MemberProvoteRuleVC.h"
#import "MemberProvoteDetailVC.h"

@interface MemberProvoteMainVC ()

@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIButton *wechatBtn;
@property (weak, nonatomic) IBOutlet UIButton *wechatCirBtn;
@property (weak, nonatomic) IBOutlet UIButton *myCopyBtn;
@property (weak, nonatomic) IBOutlet UIButton *photoBtn;
@property (weak, nonatomic) IBOutlet UIButton *ruleBtn;

@end

@implementation MemberProvoteMainVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    ViewRadius(_backView, 3.5f);
    [self bezierPathView:_ruleBtn roundingCornersOne:UIRectCornerTopLeft roundingCornersTwo:UIRectCornerBottomLeft size:CGSizeMake(6.7f, 6.7f)];
    [_wechatBtn buttonDistance:6 direction:top];
    [_wechatCirBtn buttonDistance:6 direction:top];
    [_myCopyBtn buttonDistance:6 direction:top];
    [_photoBtn buttonDistance:6 direction:top];
}
- (IBAction)goToWechat:(id)sender {
    
}
- (IBAction)goToWechatCir:(id)sender {
    
}
- (IBAction)goToCopy:(id)sender {
    
}
- (IBAction)goToPhoto:(id)sender {
    
}

//邀请详情
- (IBAction)goToRuleDetail:(id)sender {
     MemberProvoteDetailVC *memberProvoteDetailVC = [MemberProvoteDetailVC new];
    [self.navigationController pushViewController:memberProvoteDetailVC animated:YES];
}
//展示规则
- (IBAction)goToRule:(id)sender {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Member" bundle:nil];
    MemberProvoteRuleVC *memberProvoteRuleVC = [sb instantiateViewControllerWithIdentifier:@"MemberProvoteRuleVC"];
    [self.view addSubview:memberProvoteRuleVC.view];
    [self addChildViewController:memberProvoteRuleVC];
}
- (IBAction)goBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)bezierPathView :(UIView *)needCutview roundingCornersOne :(UIRectCorner)rectCornerOne roundingCornersTwo :(UIRectCorner)roundingCornersTwo size:(CGSize)size{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:needCutview.bounds byRoundingCorners:rectCornerOne | roundingCornersTwo cornerRadii:size];
    CAShapeLayer *layer = [[CAShapeLayer alloc]init];
    layer.frame = needCutview.bounds;
    layer.path = maskPath.CGPath;
    needCutview.layer.mask = layer;
}
@end
