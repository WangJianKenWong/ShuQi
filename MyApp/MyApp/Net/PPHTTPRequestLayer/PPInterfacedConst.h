//
//  PPInterfacedConst.h
//  PPNetworkHelper
//
//  Created by AndyPang on 2017/4/10.
//  Copyright © 2017年 AndyPang. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 将项目中所有的接口写在这里,方便统一管理,降低耦合
 这里通过宏定义来切换你当前的服务器类型,
 将你要切换的服务器类型宏后面置为真(即>0即可),其余为假(置为0)
 如下:现在的状态为测试服务器
 这样做切换方便,不用来回每个网络请求修改请求域名,降低出错事件
 */

#define DevelopSever  0
#define TestSever    0
#define ProductSever 1

/** 接口前缀-开发服务器*/
UIKIT_EXTERN NSString *const kApiPrefix;
/** HTML*/
UIKIT_EXTERN NSString *const kHTMLPrefix;

/** OSS环境配置*/
UIKIT_EXTERN NSString * const BUCKET_NAME;
UIKIT_EXTERN NSString * const WJcallbackAddress;
         
#pragma mark - 详细接口地址
/** 注册-获取图形验证码*/
UIKIT_EXTERN NSString *const ksellerRegisterImgVcode;




