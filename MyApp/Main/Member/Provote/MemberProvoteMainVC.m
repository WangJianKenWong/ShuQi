//
//  MemberProvoteMainVC.m
//  MyApp
//
//  Created by apple on 2020/4/28.
//  Copyright © 2020 tii. All rights reserved.
//

#import "MemberProvoteMainVC.h"

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
    [_backBtn.imageView setContentMode:UIViewContentModeScaleAspectFill];
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
- (IBAction)goToRule:(id)sender {
}

- (IBAction)goBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
