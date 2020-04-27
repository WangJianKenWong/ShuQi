//
//  MBProgressHUD+XY.m
//  UniversalApp
//
//  Created by iBamboo on 2017/9/27.
//  Copyright © 2017年 iBamboo. All rights reserved.
//

#import "MBProgressHUD+XY.h"
#import "YYLabel.h"
#import "AppDelegate+Serve.h"

const NSInteger hideTime = 2;

@implementation MBProgressHUD (XY)

+ (MBProgressHUD*)createMBProgressHUDviewWithMessage:(NSString*)message isWindiw:(BOOL)isWindow
{
    
    UIView  *view = isWindow? (UIView*)[UIApplication sharedApplication].delegate.window:[AppDelegate  getCurrentUIVC].view;
    MBProgressHUD * hud = [MBProgressHUD HUDForView:view];
    if (!hud) {
        hud =[MBProgressHUD showHUDAddedTo:view animated:YES];
    }else{
        [hud showAnimated:YES];
    }
    hud.minSize = CGSizeMake(100, 100);
    hud.label.text=message?message:@"加载中...";
    hud.label.font=[UIFont systemFontOfSize:15];
//    hud.label.textColor= [UIColor redColor];
    hud.label.numberOfLines = 0;
//    hud.bezelView.style = MBProgressHUDBackgroundStyleBlur;
//    hud.bezelView.color = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.6];
    hud.removeFromSuperViewOnHide = YES;
//    [hud setContentColor:KWhiteColor];
//    hud.backgroundView.style = MBProgressHUDBackgroundStyleBlur;
//    hud.backgroundView.color = kHUDBgColor;
    return hud;
}
#pragma mark-------------------- show Tip----------------------------

+ (void)showTipMessageInWindow:(NSString*)message
{
    [self showTipMessage:message isWindow:true timer:hideTime];
}
+ (void)showTipMessageInView:(NSString*)message
{
    [self showTipMessage:message isWindow:false timer:hideTime];
}
+ (void)showTipMessageInWindow:(NSString*)message timer:(float)aTimer
{
    [self showTipMessage:message isWindow:true timer:aTimer];
}
+ (void)showTipMessageInView:(NSString*)message timer:(float)aTimer
{
    [self showTipMessage:message isWindow:false timer:aTimer];
}
+ (void)showTipMessage:(NSString*)message isWindow:(BOOL)isWindow timer:(int)aTimer
{
    MBProgressHUD *hud = [self createMBProgressHUDviewWithMessage:message isWindiw:isWindow];
    hud.mode = MBProgressHUDModeText;
    [hud hideAnimated:YES afterDelay:hideTime];
}
#pragma mark-------------------- show Activity----------------------------

+ (void)showActivityMessageInWindow:(NSString*)message
{
    [self showActivityMessage:message isWindow:true timer:0];
}
+ (void)showActivityMessageInView:(NSString*)message
{
    [self showActivityMessage:message isWindow:false timer:0];
}
+ (void)showActivityMessageInWindow:(NSString*)message timer:(float)aTimer
{
    [self showActivityMessage:message isWindow:true timer:aTimer];
}
+ (void)showActivityMessageInView:(NSString*)message timer:(float)aTimer
{
    [self showActivityMessage:message isWindow:false timer:aTimer];
}
+ (void)showActivityMessage:(NSString*)message isWindow:(BOOL)isWindow timer:(int)aTimer
{
    MBProgressHUD *hud  =  [self createMBProgressHUDviewWithMessage:message isWindiw:isWindow];
    hud.mode = MBProgressHUDModeIndeterminate;
    if (aTimer>0) {
        [hud hideAnimated:YES afterDelay:aTimer];
    }
}


#pragma mark-------------------- show Image----------------------------

+ (void)showSuccessMessage:(NSString *)Message
{
    [self showCustomIconInWindow:@"sucess-icon" message:Message];
}
+ (void)showErrorMessage:(NSString *)Message
{
    [self showCustomIconInWindow:@"error-icon" message:Message];
}
+ (void)showInfoMessage:(NSString *)Message
{
    [self showCustomIconInWindow:@"error-icon" message:Message];
}
+ (void)showWarnMessage:(NSString *)Message
{
    [self showCustomIconInWindow:@"error-icon" message:Message];
}

//自定义icon
+ (void)showCustomIconInWindow:(NSString *)iconName message:(NSString *)message
{
    [self showCustomIcon:iconName message:message isWindow:true];
}
+ (void)showCustomIconInView:(NSString *)iconName message:(NSString *)message
{
    [self showCustomIcon:iconName message:message isWindow:false];
}

+ (void)showCustomIcon:(NSString *)iconName message:(NSString *)message isWindow:(BOOL)isWindow
{
    MBProgressHUD *hud  =  [self createMBProgressHUDviewWithMessage:message isWindiw:isWindow];
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:iconName]];
    hud.mode = MBProgressHUDModeCustomView;
    [hud hideAnimated:YES afterDelay:hideTime];
}

//隐藏
+ (void)hideHUD
{
    __weak typeof(self)weakself = self;
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0/*延迟执行时间*/ * NSEC_PER_SEC));
    
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        UIView  *winView =(UIView*)[UIApplication sharedApplication].delegate.window;
        [weakself hideAllHUDsForView:winView animated:YES];
        [weakself hideAllHUDsForView:[AppDelegate getCurrentUIVC].view animated:YES];
    });
}

#pragma mark ————— 顶部tip —————
+ (void)showTopTipMessage:(NSString *)msg {
    [self showTopTipMessage:msg isWindow:NO];
}
+ (void)showTopTipMessage:(NSString *)msg isWindow:(BOOL) isWindow{
    CGFloat padding = 10;
    
    YYLabel *label = [YYLabel new];
    label.text = msg;
    label.font = [UIFont systemFontOfSize:16];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor redColor];
    label.backgroundColor = [UIColor colorWithRed:0.033 green:0.685 blue:0.978 alpha:0.8];
    label.width = KScreenWidth;
    label.textContainerInset = UIEdgeInsetsMake(padding+padding, padding, 0, padding);
    
    if (isWindow) {
        label.height = 64;
        label.bottom = 0;
        [[UIApplication sharedApplication].delegate.window addSubview:label];
        
        [UIView animateWithDuration:0.3 animations:^{
            label.top = 0;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.2 delay:2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                label.bottom = 0;
            } completion:^(BOOL finished) {
                [label removeFromSuperview];
            }];
        }];
        
    }else{
        label.height = [msg heightForFont:label.font width:label.width] + 2 * padding;
        label.bottom = (kiOS7Later ? 64 : 0);
        [[AppDelegate getCurrentUIVC].view addSubview:label];
        
        [UIView animateWithDuration:0.3 animations:^{
            label.top = (kiOS7Later ? 64 : 0);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.2 delay:2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                label.bottom = (kiOS7Later ? 64 : 0);
            } completion:^(BOOL finished) {
                [label removeFromSuperview];
            }];
        }];
        
    }
    
}
@end

