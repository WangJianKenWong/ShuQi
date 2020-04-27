//
//  PPHTTPRequest.h
//  PPNetworkHelper
//
//  Created by AndyPang on 2017/4/10.
//  Copyright © 2017年 AndyPang. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 以下Block的参数你根据自己项目中的需求来指定
 */

/**
 请求成功的block
 
  info     返回信息
 @param response 响应体数据
 */
typedef void(^PPRequestSuccess)(id response);
/**
 请求失败的block
 
  extInfo 扩展信息
 */
typedef void(^PPRequestFailure)(NSError *error);


@interface PPHTTPRequest : NSObject

#pragma mark - 登陆退出
/** 注册-获取图形验证码*/
+ (NSURLSessionTask *)sellerRegisterImgVcodeParameters:(id)parameters success:(PPRequestSuccess)success failure:(PPRequestFailure)failure;


@end
