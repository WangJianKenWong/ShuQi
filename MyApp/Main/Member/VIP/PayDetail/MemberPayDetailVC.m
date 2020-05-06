//
//  MemberPayDetailVC.m
//  MyApp
//
//  Created by apple on 2020/5/6.
//  Copyright © 2020 tii. All rights reserved.
//

#import "MemberPayDetailVC.h"
#import "MemberPaySuccessVC.h"
#import "MemberPayWaitVC.h"

@interface MemberPayDetailVC ()
@property (weak, nonatomic) IBOutlet UIView *smallView;
@property (weak, nonatomic) IBOutlet UIView *bigView;

@end

@implementation MemberPayDetailVC{
    MemberPayWaitVC *memberPayWaitVC;
    MemberPaySuccessVC *memberPaySuccessVC;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [memberPayWaitVC.view removeFromSuperview];
    [memberPayWaitVC removeFromParentViewController];
    [memberPaySuccessVC.view removeFromSuperview];
    [memberPaySuccessVC removeFromParentViewController];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#F0F1F3"];
    self.title = @"支付";
    ViewRadius(_smallView, 3.33f);
    ViewRadius(_bigView, 3.33f);
//    [self addSuccesVC];
    [self addWaitVC];
}
- (void)addSuccesVC{
    AppDelegate *app = kApp;
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Member" bundle:nil];
    memberPaySuccessVC = [sb instantiateViewControllerWithIdentifier:@"MemberPaySuccessVC"];
    [app.window.rootViewController.view addSubview:memberPaySuccessVC.view];
    [app.window.rootViewController addChildViewController:memberPaySuccessVC];
}
- (void)addWaitVC{
    AppDelegate *app = kApp;
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Member" bundle:nil];
    memberPayWaitVC = [sb instantiateViewControllerWithIdentifier:@"MemberPayWaitVC"];
    [app.window.rootViewController.view addSubview:memberPayWaitVC.view];
    [app.window.rootViewController addChildViewController:memberPayWaitVC];
}
@end
