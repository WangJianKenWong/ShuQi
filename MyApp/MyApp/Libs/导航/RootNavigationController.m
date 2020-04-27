//
//  RootNavigationController.m
//  UniversalApp
//
//  Created by iBamboo on 2017/9/15.
//  Copyright © 2017年 iBamboo. All rights reserved.
//

#import "RootNavigationController.h"

@interface RootNavigationController ()<UIGestureRecognizerDelegate,UINavigationControllerDelegate>

// 记录push标志
@property (nonatomic, getter=isPushing) BOOL pushing;

@end

@implementation RootNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置NavigationBar
    [self setupNavigationBar];
    //设置手势代理
    self.interactivePopGestureRecognizer.delegate = self;
    //导航栏整体颜色的色调
    self.delegate = self;

}


//设置导航栏主题
- (void)setupNavigationBar{
    UINavigationBar *appearance = [UINavigationBar appearance];
    //统一设置导航栏颜色，如果单个见面需要设置，可以在ViewWillAppear方法中设置,在viewWillDisappear设置回统一格式
    
    //隐藏导航下面的线
    appearance.clipsToBounds = NO;
    
    //隐藏导航栏下边缘的分割线
    [appearance setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
//    appearance.shadowImage = [UIImage imageNamed:@"line"];
    appearance.shadowImage = [self imageWithColor:[UIColor whiteColor] size:CGSizeMake(self.view.frame.size.width, 1)];
    //（色号16进制） 导航背景颜色
    [appearance setBarTintColor:[UIColor whiteColor]];
    //关闭导航栏半透明
    appearance.translucent = NO;
    //修改状态栏字体颜色
    appearance.barStyle = UIStatusBarStyleDefault;
    
    //导航栏title格式
    NSMutableDictionary *textAttribute = [NSMutableDictionary dictionary];
    //导航文字颜色
    textAttribute[NSForegroundColorAttributeName] = [UIColor blackColor];
    //导航标题文字大小
    textAttribute[NSFontAttributeName] = [UIFont boldSystemFontOfSize:18];
    [appearance setTitleTextAttributes:textAttribute];
}
- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <=0 || size.height <=0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size,NO, 0);
    CGContextRef context =UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [self.view endEditing:YES];
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
//        self.navigationController.navigationBar.tintColor = [UIColor blackColor];
        UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 36, 36)];
        [backButton setImage:[UIImage imageNamed:@"head-arrow"] forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:@"head-arrow"] forState:UIControlStateHighlighted];
//        [backButton setImageEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
        [backButton.widthAnchor constraintEqualToConstant:15].active = YES;
        [backButton.heightAnchor constraintEqualToConstant:15].active = YES;
        [backButton addTarget:self action:@selector(popView) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    }
    
    //这个判断是防止 在某个点击事件卡顿的时候  连续点击，连续push的情况
    if (self.pushing == YES) {
        return;
    } else {
        self.pushing = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}
- (void)popToViewController:(UIViewController *)viewController animated:(BOOL)animated{
    [super popToViewController:viewController animated:animated];
//    [super popToRootViewControllerAnimated:YES];
}
- (void)popView
{
    [self popViewControllerAnimated:YES];
}


#pragma mark - UINavigationControllerDelegate
-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    self.pushing = NO;
}

//手势代理
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (self.navigationController.viewControllers.count == 1) {
        return NO;
    }else{
        return YES;
    }
    
}
- (BOOL)shouldAutorotate {
    return NO;
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

- (UIBarPosition)positionForBar:(id<UIBarPositioning>)bar
{
    return UIBarPositionTop;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
