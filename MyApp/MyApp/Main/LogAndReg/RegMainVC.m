//
//  RegMainVC.m
//  MyApp
//
//  Created by apple on 2020/4/26.
//  Copyright © 2020 tii. All rights reserved.
//

#import "RegMainVC.h"

@interface RegMainVC ()

@end

@implementation RegMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)goToLog:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
