//
//  PPInterfacedConst.m
//  PPNetworkHelper
//
//  Created by YiAi on 2017/7/6.
//  Copyright © 2017年 AndyPang. All rights reserved.
//

#import "PPInterfacedConst.h"

#if DevelopSever
/** 接口前缀-开发服务器*/
//外网地址
NSString *const kApiPrefix = @"http://test-seller.jiulianchu.cn";
NSString * const BUCKET_NAME = @"test-jlc-oss";
NSString * const WJcallbackAddress = @"http://test-jlc-oss.oss-cn-beijing.aliyuncs.com/";

#elif TestSever
/** 接口前缀-测试服务器*/
//bai
//NSString *const kApiPrefix = @"http://192.168.0.155:8000";
NSString *const kApiPrefix = @"http://192.168.0.163:8000";
NSString * const BUCKET_NAME = @"test-jlc-oss";
NSString * const WJcallbackAddress = @"http://test-jlc-oss.oss-cn-beijing.aliyuncs.com/";
#elif ProductSever
/** 接口前缀-生产服务器*/
NSString *const kApiPrefix = @"http://seller.jiulianchu.cn";
//阿里云OSS环境
NSString * const WJcallbackAddress = @"http://jlc-oss.oss-cn-beijing.aliyuncs.com/";
NSString * const BUCKET_NAME = @"jlc-oss";

#endif
/** 注册-获取图形验证码*/
NSString *const ksellerRegisterImgVcode = @"/seller/register/imgVcode";

