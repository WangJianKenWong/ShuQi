//
//  MemeberNoLogVC.m
//  MyApp
//
//  Created by apple on 2020/4/27.
//  Copyright © 2020 tii. All rights reserved.
//

#import "MemeberNoLogVC.h"

@interface MemeberNoLogVC ()
@property (strong, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIView *smallView;

@end

@implementation MemeberNoLogVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _backView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.3f];
    ViewRadius(_smallView, 3.5f);
}

@end
