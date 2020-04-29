//
//  LongMovieMainVC.m
//  MyApp
//
//  Created by apple on 2020/4/25.
//  Copyright © 2020 tii. All rights reserved.
//

#import "LongMovieMainVC.h"
#import "LogUserNameVC.h"
#import "ZJScrollPageView.h"
#import "FindStartSecondVC.h"
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
//    self.automaticallyAdjustsScrollViewInsets = NO;
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
    
    style.autoAdjustTitlesWidth = NO;
    //显示滚动条
      style.showLine = YES;
    
    __weak typeof(self) weakSelf = self;

    // 初始化
    CGRect scrollPageViewFrame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        __strong typeof(self) strongSelf = weakSelf;
        
        strongSelf.titles = @[@"新闻头条",
                              @"国际要闻",
                              @"中国足球",
                              @"新闻头条",
                              @"国际要闻",
                              @"中国足球"
                              ];
        
        ZJScrollPageView *scrollPageView = [[ZJScrollPageView alloc] initWithFrame:scrollPageViewFrame segmentStyle:style titles:_titles parentViewController:strongSelf delegate:strongSelf];
        strongSelf.scrollPageView = scrollPageView;
        // 额外的按钮响应的block
//        [strongSelf.scrollPageView setSelectedIndex:1 animated:true];
        strongSelf.scrollPageView.extraBtnOnClick = ^(UIButton *extraBtn){
            weakSelf.title = @"点击了extraBtn";
            NSLog(@"点击了extraBtn");
        };
        [strongSelf.view addSubview:strongSelf.scrollPageView];
    });
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
        FindStartSecondVC *childVc = (FindStartSecondVC *)reuseViewController;
        if (childVc == nil) {
            childVc = [[FindStartSecondVC alloc] init];
            childVc.view.backgroundColor = [UIColor yellowColor];
        }
        return childVc;
        
    }  else {
        FindStartSecondVC *childVc = (FindStartSecondVC *)reuseViewController;
        if (childVc == nil) {
            childVc = [[FindStartSecondVC alloc] init];
            childVc.view.backgroundColor = [UIColor greenColor];
        }
        
        if (index%2==0) {
            childVc.view.backgroundColor = [UIColor orangeColor];
        }
        return childVc;
    }
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"LogAndReg" bundle:nil];
    LogUserNameVC *logUserNameVC = [sb instantiateViewControllerWithIdentifier:@"LogUserNameVC"];
    [self.navigationController pushViewController:logUserNameVC animated:YES];
}
@end
