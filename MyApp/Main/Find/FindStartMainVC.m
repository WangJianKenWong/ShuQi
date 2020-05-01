//
//  FindStartMainVC.m
//  MyApp
//
//  Created by apple on 2020/4/29.
//  Copyright © 2020 tii. All rights reserved.
//

#import "FindStartMainVC.h"
#import "ZJScrollPageView.h"
#import "FindStartSecondVC.h"

@interface FindStartMainVC ()<ZJScrollPageViewDelegate>
@property (weak, nonatomic) ZJScrollPageView *scrollPageView;
@property(strong, nonatomic)NSArray<NSString *> *titles;

@end

@implementation FindStartMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    ZJSegmentStyle *style = [[ZJSegmentStyle alloc] init];
        //显示遮盖
    style.showCover = YES;
        // 颜色渐变
    style.gradualChangeTitleColor = YES;
    style.titleFont = [UIFont boldSystemFontOfSize:14.f];
    style.normalTitleColor = [UIColor colorWithHexString:@"333333"];
    style.selectedTitleColor = [UIColor colorWithHexString:@"FF0000"];
    style.coverBackgroundColor = [UIColor colorWithHexString:@"FFE0E0"];
    style.scrollContentView = NO;
    style.adjustCoverOrLineWidth = YES;
    style.coverHeight = 30;
    style.segmentHeight = 50;
    self.titles = [self readLocalFileWithName:@"findStart"];
    // 初始化
    ZJScrollPageView *scrollPageView = [[ZJScrollPageView alloc] initWithFrame:CGRectMake(0, 15, self.view.bounds.size.width, self.view.bounds.size.height - 15) segmentStyle:style titles:self.titles parentViewController:self delegate:self];
    
    self.scrollPageView = scrollPageView;
    
    // 设置默认下标
    [self.scrollPageView setSelectedIndex:0 animated:NO];
    [self.view addSubview:self.scrollPageView];
}

// 读取本地JSON文件
- (NSArray *)readLocalFileWithName:(NSString *)myValue{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"app_config" ofType:@"json"];
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    return dic[myValue];
}
- (NSInteger)numberOfChildViewControllers {
    return self.titles.count;
}

- (UIViewController<ZJScrollPageViewChildVcDelegate> *)childViewController:(UIViewController<ZJScrollPageViewChildVcDelegate> *)reuseViewController forIndex:(NSInteger)index {
//    UIViewController<ZJScrollPageViewChildVcDelegate> *childVc = reuseViewController;
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Find" bundle:nil];
    FindStartSecondVC *childVc = [sb instantiateViewControllerWithIdentifier:@"FindStartSecondVC"];
    return childVc;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods {
    return NO;
}
@end
