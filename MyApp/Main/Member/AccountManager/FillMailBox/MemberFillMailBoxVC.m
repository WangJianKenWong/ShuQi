//
//  MemberFillMailBoxVC.m
//  MyApp
//
//  Created by apple on 2020/4/27.
//  Copyright © 2020 tii. All rights reserved.
//

#import "MemberFillMailBoxVC.h"

@interface MemberFillMailBoxVC ()

@end

@implementation MemberFillMailBoxVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"填写邮箱";
}

@end
