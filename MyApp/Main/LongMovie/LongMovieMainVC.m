//
//  LongMovieMainVC.m
//  MyApp
//
//  Created by apple on 2020/4/25.
//  Copyright © 2020 tii. All rights reserved.
//

#import "LongMovieMainVC.h"
#import "ZJScrollPageView.h"
#import "LongMovieSecondVC.h"

@interface LongMovieMainVC ()<ZJScrollPageViewDelegate>

@property(weak, nonatomic)ZJScrollPageView *scrollPageView;
@property(strong, nonatomic)NSArray<NSString *> *titles;
@property(strong, nonatomic)NSArray<UIViewController<ZJScrollPageViewChildVcDelegate> *> *childVcs;

@end

@implementation LongMovieMainVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"效果示例";
    //必要的设置, 如果没有设置可能导致内容显示不正常
    self.automaticallyAdjustsScrollViewInsets = NO;
    ZJSegmentStyle *style = [[ZJSegmentStyle alloc] init];
    // 缩放标题
    style.scaleTitle = YES;
    // 颜色渐变
    style.gradualChangeTitleColor = YES;
    // 显示附加的按钮
    style.showExtraButton = YES;
    // 设置附加按钮的背景图片
    style.extraBtnBackgroundImageName = @"long_more";
    style.segmentHeight = 88;
    style.scrollLineColor = [UIColor colorWithHexString:@"FF0000"];
    style.scrollLineHeight = 3.33f;
    style.titleFont = [UIFont systemFontOfSize:16];
    style.normalTitleColor = [UIColor colorWithHexString:@"333333"];
    style.selectedTitleColor = [UIColor colorWithHexString:@"FF0000"];
    style.autoAdjustTitlesWidth = NO;
    style.showCover = NO;
    style.titleMargin = 25;
    style.coverHeight = 40;
    //显示滚动条
      style.showLine = YES;
    
    __weak typeof(self) weakSelf = self;

    // 初始化
    CGRect scrollPageViewFrame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    __strong typeof(self) strongSelf = weakSelf;
    self.titles = @[@"精选",
                                  @"动作",
                                  @"喜剧",
                                  @"爱情",
                                  @"科幻",
                                  @"恐怖"
                                  ];
    ZJScrollPageView *scrollPageView = [[ZJScrollPageView alloc] initWithFrame:scrollPageViewFrame segmentStyle:style titles:_titles parentViewController:strongSelf delegate:strongSelf];
    self.scrollPageView = scrollPageView;
            // 额外的按钮响应的block
    //        [strongSelf.scrollPageView setSelectedIndex:1 animated:true];
    self.scrollPageView.extraBtnOnClick = ^(UIButton *extraBtn){
//        weakSelf.title = @"点击了extraBtn";
                NSLog(@"点击了extraBtn");
    };
    [self.view addSubview:strongSelf.scrollPageView];
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods {
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfChildViewControllers {
    return self.titles.count;
}

- (UIViewController<ZJScrollPageViewChildVcDelegate> *)childViewController:(UIViewController<ZJScrollPageViewChildVcDelegate> *)reuseViewController forIndex:(NSInteger)index {
    NSLog(@"%ld---------", index);
    if (index == 0) {
        LongMovieSecondVC *childVc = (LongMovieSecondVC *)reuseViewController;
        if (childVc == nil) {
            childVc = [[LongMovieSecondVC alloc] init];
        }
        return childVc;
    }  else {
        LongMovieSecondVC *childVc = (LongMovieSecondVC *)reuseViewController;
        if (childVc == nil) {
            childVc = [[LongMovieSecondVC alloc] init];
        }
        return childVc;
    }
}
/*
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"LogAndReg" bundle:nil];
    LogUserNameVC *logUserNameVC = [sb instantiateViewControllerWithIdentifier:@"LogUserNameVC"];
    [self.navigationController pushViewController:logUserNameVC animated:YES];
}
 */
@end
