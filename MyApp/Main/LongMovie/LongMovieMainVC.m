//
//  LongMovieMainVC.m
//  MyApp
//
//  Created by apple on 2020/4/25.
//  Copyright © 2020 tii. All rights reserved.
//

#import "LongMovieMainVC.h"
#import "ZJScrollPageView.h"
#import "LongMovieSecondColVC.h"
#import "LongMovieAllSectionVC.h"

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
    //
    self.scrollPageView.extraBtnOnClick = ^(UIButton *extraBtn){
        LongMovieAllSectionVC *longMovieAllSectionVC = [LongMovieAllSectionVC new];
        longMovieAllSectionVC.block = ^(int selectIndex) {
            // 额外的按钮响应的block
            [strongSelf.scrollPageView setSelectedIndex:selectIndex animated:true];
        };
        [self.navigationController pushViewController:longMovieAllSectionVC animated:YES];
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
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"LongMovie" bundle:nil];
    LongMovieSecondColVC *vc = [sb instantiateViewControllerWithIdentifier:@"LongMovieSecondColVC"];
    return vc;
}

@end
