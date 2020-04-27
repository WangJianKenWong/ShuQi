//
//  MemberVisiteCodeVC.m
//  MyApp
//
//  Created by apple on 2020/4/27.
//  Copyright © 2020 tii. All rights reserved.
//

#import "MemberVisiteCodeVC.h"

@interface MemberVisiteCodeVC ()

@property (weak, nonatomic) IBOutlet UITextField *codeTf;

@end

@implementation MemberVisiteCodeVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"填写邀请码";
    ViewRadius(_codeTf, 3.5f);
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    _codeTf.leftView = view;
    _codeTf.leftViewMode = UITextFieldViewModeAlways;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
