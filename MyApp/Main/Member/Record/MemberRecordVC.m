//
//  MemberRecordVC.m
//  MyApp
//
//  Created by apple on 2020/4/28.
//  Copyright © 2020 tii. All rights reserved.
//

#import "MemberRecordVC.h"

@interface MemberRecordVC ()

@end

@implementation MemberRecordVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setShadowImage:nil];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"观看记录";
    [self setUpAllChildViewController];
    [self setUpDisplayStyle:^(UIColor *__autoreleasing *titleScrollViewBgColor, UIColor *__autoreleasing *norColor, UIColor *__autoreleasing *selColor, UIColor *__autoreleasing *proColor, UIFont *__autoreleasing *titleFont, CGFloat *titleButtonWidth, BOOL *isShowPregressView, BOOL *isOpenStretch, BOOL *isOpenShade) {
        *titleFont = [UIFont boldSystemFontOfSize:16];
        /*
         以下BOOL值默认都为NO
         */
        *norColor = [UIColor colorWithHexString:@"333333"];
        *selColor = [UIColor colorWithHexString:@"ff0000"];
        *proColor = [UIColor colorWithHexString:@"ff0000"];;
        *isShowPregressView = YES;                      //是否开启标题下部Pregress指示器
        *isOpenStretch = YES;                           //是否开启指示器拉伸效果
        *isOpenShade = YES;                             //是否开启字体渐变
        *titleButtonWidth = kScreenWidth*0.5f;           //有默认值
    }];
    [self setUpProgressAttribute:^(CGFloat *progressLength, CGFloat *progressHeight) {//progressLength 设置底部progress指示器的长度，有默认值为按钮的宽度的百分之56  progressHeight默认高度4(并且不能大于10)
        *progressLength = 20;
        *progressHeight = 3.5f;
    }];
}
#pragma mark - 添加所有子控制器
- (void)setUpAllChildViewController{
    NSArray *titles = @[@"长片", @"短片"];
    NSArray *vcNames = @[@"MemberRecordLongMovieVC", @"MemberRecordShortMovieVC"];
    for (NSInteger i = 0; i < titles.count; i++) {
        UIViewController* vc = [self stringChangeToClass:vcNames[i]];
        if (vc) {
            UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 10, ScreenW, 0.5)];
            backView.backgroundColor = [UIColor colorWithHexString:@"D8D8D8"];
            vc.title = titles[i];
            [vc.view addSubview:backView];
            [self addChildViewController:vc];        }
    }
}
- (UIViewController*)stringChangeToClass:(NSString *)str {
    id vc = [[NSClassFromString(str) alloc]init];
    if ([vc isKindOfClass:[UIViewController class]]) {
        return vc;
    }
    return nil;
}
@end
