//
//  LogMailBoxVC.m
//  MyApp
//
//  Created by apple on 2020/4/26.
//  Copyright © 2020 tii. All rights reserved.
//

#import "LogMailBoxVC.h"
#import "RegMainVC.h"
#import "ForgetPswMainVC.h"

@interface LogMailBoxVC ()

@end

@implementation LogMailBoxVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.topItem.title = @"";
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    UIButton *cancleButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [cancleButton setTitle:@"用户号登录" forState:UIControlStateNormal];
    cancleButton.titleLabel.font = [UIFont boldSystemFontOfSize: 14.0];
    [cancleButton setTitleColor:[UIColor colorWithHexString:@"999999"] forState:UIControlStateNormal];
    [cancleButton addTarget:self action:@selector(goToMainBoxLog) forControlEvents:UIControlEventTouchUpInside];
        
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:cancleButton];
//    rightItem.imageEdgeInsets = UIEdgeInsetsMake(0, -15,0, 0);//设置向左偏移
    self.navigationItem.rightBarButtonItem = rightItem;
}
- (void)goToMainBoxLog{
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)goToForgetPsw:(id)sender {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"LogAndReg" bundle:nil];
    ForgetPswMainVC *forgetPswMainVC = [sb instantiateViewControllerWithIdentifier:@"ForgetPswMainVC"];
    [self.navigationController pushViewController:forgetPswMainVC animated:YES];
}
- (IBAction)goToReg:(id)sender {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"LogAndReg" bundle:nil];
    RegMainVC *regMainVC = [sb instantiateViewControllerWithIdentifier:@"RegMainVC"];
    [self.navigationController pushViewController:regMainVC animated:YES];
}

@end
