
//
//  UikitMacro.h
//  附近酒行
//
//  Created by apple on 2018/3/23.
//  Copyright © 2018年 apple. All rights reserved.
//

#ifndef UikitMacro_h
#define UikitMacro_h

#define KScreenWidth  [[UIScreen mainScreen] bounds].size.width
#define KScreenHeight [[UIScreen mainScreen] bounds].size.height
#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif
// 取色值相关的方法
#define RGB(r,g,b)          [UIColor colorWithRed:(r)/255.f \
                                            green:(g)/255.f \
                                             blue:(b)/255.f \
                                            alpha:1.f]

#define RGBA(r,g,b,a)       [UIColor colorWithRed:(r)/255.f \
                                            green:(g)/255.f \
                                             blue:(b)/255.f \
                                            alpha:(a)]
//发送通知
#define KPostNotification(name,obj) [[NSNotificationCenter defaultCenter] postNotificationName:name object:obj];

#define kApp                (AppDelegate *)[UIApplication sharedApplication].delegate
#define kAppDelegate        [AppDelegate shareAppDelegate]
//强弱引用
#define kWeakSelf(type)  __weak typeof(type) weak##type = type;
#define kStrongSelf(type) __strong typeof(type) type = weak##type;
//判断字符串为是否为空
#define WJStrIsEmpty(str) ([str isKindOfClass:[NSNull class]] || [str length] < 1 ? YES : NO || [str isEqualToString:@"(null)"] || [str isEqualToString:@"null"] || [str isEqualToString:@"(nil)"]||[str isEqualToString:@"nil"]||[str isEqual:[NSNull null]])
#define IFWJStrIsEmpty(str) WJStrIsEmpty(str)?@"":str
//拼接字符串
#define KNSStringFormat(format,...) [NSString stringWithFormat:format,##__VA_ARGS__]
#define STRFMAT(str) [NSString stringWithFormat:@"%@",str]
//image
#define ImageNamed(name) [UIImage imageNamed:name]
//检查系统版本
#define IOSVersion                          [[[UIDevice currentDevice] systemVersion] floatValue]
#define ISIOS7Later                         !(IOSVersion <= 7.0)
#define ISIOS8Later                         !(IOSVersion <= 8.0)
//View 圆角和加边框
#define ViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]
//URL
#define URLFMAT(imageUrl) [NSURL URLWithString:[NSString stringWithFormat:@"%@", imageUrl]]

// View 圆角
#define ViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]

//是否iPhoneX YES:iPhoneX屏幕 NO:传统屏幕
#define kIs_iPhoneX ([UIScreen mainScreen].bounds.size.height == 812 || [UIScreen mainScreen].bounds.size.height == 896)
//以6为基准比例
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH_SCALE   [UIScreen mainScreen].bounds.size.width/375.0
#define SCREEN_HEIGHT_SCALE  [UIScreen mainScreen].bounds.size.height/667.0
//是否是IphoneX系列
#define isIPhoneXAll ([UIScreen mainScreen].bounds.size.height == 812 || [UIScreen mainScreen].bounds.size.height == 896)

#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhoneXR ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhoneXS_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)

#endif /* UikitMacro_h */
