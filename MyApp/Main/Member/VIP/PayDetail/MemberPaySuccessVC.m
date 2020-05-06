//
//  MemberPaySuccessVC.m
//  MyApp
//
//  Created by apple on 2020/5/6.
//  Copyright © 2020 tii. All rights reserved.
//

#import "MemberPaySuccessVC.h"

@interface MemberPaySuccessVC ()
@property (strong, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIView *smallView;

@end

@implementation MemberPaySuccessVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _backView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.3f];
    ViewRadius(_smallView, 3.5f);
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}
@end
