//
//  MemberProvoteRuleVC.m
//  MyApp
//
//  Created by apple on 2020/4/29.
//  Copyright © 2020 tii. All rights reserved.
//

#import "MemberProvoteRuleVC.h"

@interface MemberProvoteRuleVC ()
@property (strong, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIView *smallView;
@end

@implementation MemberProvoteRuleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _backView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.3f];
    ViewRadius(_smallView, 3.5f);
}
- (IBAction)close:(id)sender {
    [self goToClose];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self goToClose];
}
- (void)goToClose{
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}
@end
