//
//  MemberAccountManagerVC.m
//  MyApp
//
//  Created by apple on 2020/4/27.
//  Copyright © 2020 tii. All rights reserved.
//

#import "MemberAccountManagerVC.h"

@interface MemberAccountManagerVC ()

@end

@implementation MemberAccountManagerVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"账户管理";
}
- (IBAction)goToFillMailBox:(id)sender {
    [self goToDetailVC:@"MemberFillMailBoxVC"];
}
- (IBAction)goToChangePsw:(id)sender {
}
- (void)goToDetailVC:(NSString *)str{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Member" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:str];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
