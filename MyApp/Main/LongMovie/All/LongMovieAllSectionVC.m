//
//  LongMovieAllSectionVC.m
//  MyApp
//
//  Created by apple on 2020/5/6.
//  Copyright © 2020 tii. All rights reserved.
//

#import "LongMovieAllSectionVC.h"

@interface LongMovieAllSectionVC ()

@end

@implementation LongMovieAllSectionVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"所有栏目";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpAllSectionView];
}

- (void)setUpAllSectionView{
    UILabel *mySectionLab = [[UILabel alloc]initWithFrame:CGRectMake(14, 20, 68, 15)];
    mySectionLab.text = @"我的栏目";
    mySectionLab.textColor = [UIColor colorWithHexString:@"#333333"];
    mySectionLab.font = [UIFont boldSystemFontOfSize:16.f];
    [self.view addSubview:mySectionLab];
    
    UILabel *enterSectionLab = [[UILabel alloc]initWithFrame:CGRectMake(14+68+10, 22.f, 80, 12)];
    enterSectionLab.text = @"点击进入栏目";
    enterSectionLab.textColor = [UIColor colorWithHexString:@"#999999"];
    enterSectionLab.font = [UIFont systemFontOfSize:12.f];
    [self.view addSubview:enterSectionLab];
    
    NSArray *titleArr = [self readLocalFileWithName:@"allAction"];
//    CGFloat gridWidth = (SCREEN_WIDTH - 14*5)/4.f;//格子的宽度
//    CGFloat gridHeight = 30.f;//格子的高度
//    NSInteger rowNumber = 4;//每行几个
//    //间距x,y
//    CGFloat marginX = (SCREEN_WIDTH - gridWidth * rowNumber) / (rowNumber + 1);
//    CGFloat marginY = 14;
    
    for (int i=0; i<titleArr.count; i++) {
        UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [titleBtn setTitle:titleArr[i] forState:UIControlStateNormal];
        [titleBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
        titleBtn.titleLabel.font = [UIFont systemFontOfSize: 14.0];
        ViewBorderRadius(titleBtn, 15.f, 1.f, [UIColor colorWithHexString:@"#C7C7C7"]);
        //下面是九宫格的设计
        NSInteger l = i % 4;
        NSInteger h = i / 4;
        NSInteger kMagin = 14;
        CGFloat width = (self.view.frame.size.width - 5 * kMagin) / 4.f;
        CGFloat height = 30;
        //通过个数位置确定具体的frame
        titleBtn.frame = CGRectMake(kMagin + (kMagin + width) * l, 50 + kMagin + (kMagin + height) * h, width, height);
        [titleBtn addActionHandler:^(NSInteger tag) {
            if (self.block) {
                self.block(i);
            }
            [self.navigationController popViewControllerAnimated:YES];
        }];
        [self.view addSubview:titleBtn];
        
    }
    
}
// 读取本地JSON文件
- (NSArray *)readLocalFileWithName:(NSString *)myValue{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"app_config" ofType:@"json"];
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    return dic[myValue];
}
@end
