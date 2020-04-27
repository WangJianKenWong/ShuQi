//
//  MemberMyCollectVC.m
//  MyApp
//
//  Created by apple on 2020/4/27.
//  Copyright © 2020 tii. All rights reserved.
//

#import "MemberMyCollectVC.h"

@interface MemberMyCollectVC ()

@end

@implementation MemberMyCollectVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpAllChildViewController];
    [self setUpDisplayStyle:^(UIColor *__autoreleasing *titleScrollViewBgColor, UIColor *__autoreleasing *norColor, UIColor *__autoreleasing *selColor, UIColor *__autoreleasing *proColor, UIFont *__autoreleasing *titleFont, CGFloat *titleButtonWidth, BOOL *isShowPregressView, BOOL *isOpenStretch, BOOL *isOpenShade) {
        *titleFont = [UIFont systemFontOfSize:14];
        /*
         以下BOOL值默认都为NO
         */
        *norColor = [UIColor colorWithHexString:@"333333"];
        *selColor = [UIColor colorWithHexString:@"ff0000"];
        *proColor = [UIColor colorWithHexString:@"ff0000"];;
        *isShowPregressView = YES;                      //是否开启标题下部Pregress指示器
        *isOpenStretch = YES;                           //是否开启指示器拉伸效果
        *isOpenShade = YES;                             //是否开启字体渐变
        *titleButtonWidth = kScreenWidth*0.2;           //有默认值
    }];
}
#pragma mark - 添加所有子控制器
- (void)setUpAllChildViewController{
    NSArray *titles = @[@"明星", @"长片", @"短片"];
    for (NSInteger i = 0; i < titles.count; i++) {
        UIViewController *vc = [UIViewController new];
        vc.title = titles[i];
        [self addChildViewController:vc];
    }
}

@end
