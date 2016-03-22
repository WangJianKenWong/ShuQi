//
//  PXCatalogViewController.m
//  LastProject
//
//  Created by Mac on 16/3/22.
//  Copyright (c) 2016年 QQ:1002766945. All rights reserved.
//

#import "PXCatalogViewController.h"
#import "PXCatalogTableViewCell.h"
@interface PXCatalogViewController ()

@end

@implementation PXCatalogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 233;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PXCatalogTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"books" forIndexPath:indexPath];
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
