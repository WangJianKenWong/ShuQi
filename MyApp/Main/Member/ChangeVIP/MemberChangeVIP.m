//
//  MemberChangeVIP.m
//  MyApp
//
//  Created by apple on 2020/4/27.
//  Copyright © 2020 tii. All rights reserved.
//

#import "MemberChangeVIP.h"

@interface MemberChangeVIP ()
@property (weak, nonatomic) IBOutlet UITextField *codeTf;

@end

@implementation MemberChangeVIP

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"兑换VIP";
    ViewRadius(_codeTf, 3.5f);
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    _codeTf.leftView = view;
    _codeTf.leftViewMode = UITextFieldViewModeAlways;
}

@end
