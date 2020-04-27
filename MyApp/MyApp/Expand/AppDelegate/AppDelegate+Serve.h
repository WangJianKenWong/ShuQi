//
//  AppDelegate+Serve.h
//  附近酒行
//
//  Created by apple on 2018/3/27.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (Serve)
/**
 获取当前顶层控制器
 */
+(UIViewController*) getCurrentVC;

+(UIViewController*) getCurrentUIVC;

@end
