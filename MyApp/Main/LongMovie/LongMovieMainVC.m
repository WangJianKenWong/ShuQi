//
//  LongMovieMainVC.m
//  MyApp
//
//  Created by apple on 2020/4/25.
//  Copyright © 2020 tii. All rights reserved.
//

#import "LongMovieMainVC.h"
#import "LogUserNameVC.h"

@interface LongMovieMainVC ()

@end

@implementation LongMovieMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"LogAndReg" bundle:nil];
    LogUserNameVC *logUserNameVC = [sb instantiateViewControllerWithIdentifier:@"LogUserNameVC"];
    [self.navigationController pushViewController:logUserNameVC animated:YES];
}
@end
