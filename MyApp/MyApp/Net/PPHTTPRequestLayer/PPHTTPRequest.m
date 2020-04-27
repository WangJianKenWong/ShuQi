//
//  PPHTTPRequest.m
//  PPNetworkHelper
//
//  Created by AndyPang on 2017/4/10.
//  Copyright © 2017年 AndyPang. All rights reserved.
//

#import "PPHTTPRequest.h"
#import "PPInterfacedConst.h"
#import "PPNetworkHelper.h"

@implementation PPHTTPRequest
/** 注册-获取图形验证码*/
+ (NSURLSessionTask *)sellerRegisterImgVcodeParameters:(id)parameters success:(PPRequestSuccess)success failure:(PPRequestFailure)failure{
    NSString *url = [NSString stringWithFormat:@"%@%@",kApiPrefix, ksellerRegisterImgVcode];
    return [self requestWithURL:url parameters:parameters success:success failure:failure];
}

#pragma mark - 请求的公共方法

+ (NSURLSessionTask *)requestWithURL:(NSString *)URL parameters:(NSDictionary *)parameter success:(PPRequestSuccess)success failure:(PPRequestFailure)failure
{
    // 在请求之前你可以统一配置你请求的相关参数 ,设置请求头, 请求参数的格式, 返回数据的格式....这样你就不需要每次请求都要设置一遍相关参数
    // 设置请求头
//    [PPNetworkHelper setValue:@"9" forHTTPHeaderField:@"fromType"];
//    [PPNetworkHelper setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
//    [PPNetworkHelper setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    if (!WJStrIsEmpty([WJUserdefault objectForKey:@"token"])) {
//        DLog(@"token=%@", [WJUserdefault objectForKey:@"token"]);
//        [PPNetworkHelper setValue:[WJUserdefault objectForKey:@"token"] forHTTPHeaderField:@"token"];
//    }
    // 发起请求
    return [PPNetworkHelper POST:URL parameters:parameter success:^(id responseObject) {
        DLog(@"URL=%@", URL);
        DLog(@"parameters=%@", parameter);
        DLog(@"responseObject=%@", responseObject);
        // 在这里你可以根据项目自定义其他一些重复操作,比如加载页面时候的等待效果, 提醒弹窗....
        if ([responseObject[@"code"] intValue] == 1000) {
            [MBProgressHUD showErrorMessage:@"token不合法"];
            return ;
        }
        else{
            success(responseObject);
        }
    } failure:^(NSError *error) {
        // 同上
        DLog(@"error=%@", error);
        failure(error);
        if (error.code == -1001) {
            [MBProgressHUD showErrorMessage:@"网络连接超时"];
            return ;
        }
        else if (error.code == -1004 || error.code == 3840) {
            [MBProgressHUD showErrorMessage:@"服务器连接失败"];
            return ;
        }
        else if (error.code == -1009) {
            [MBProgressHUD showErrorMessage:@"没有网络，请连接好网络再试"];
            return;
        }
        else{
            [MBProgressHUD showErrorMessage:KNSStringFormat(@"请求错误:%ld", error.code)];
            return;
        }
    }];
}
+ (NSURLSessionTask *)getRequestWithURL:(NSString *)URL parameters:(NSDictionary *)parameter success:(PPRequestSuccess)success failure:(PPRequestFailure)failure
{
    // 在请求之前你可以统一配置你请求的相关参数 ,设置请求头, 请求参数的格式, 返回数据的格式....这样你就不需要每次请求都要设置一遍相关参数
    // 设置请求头
    if (!WJStrIsEmpty([WJUserdefault objectForKey:@"token"])) {
        DLog(@"token=%@", [WJUserdefault objectForKey:@"token"]);
        [PPNetworkHelper setValue:[WJUserdefault objectForKey:@"token"] forHTTPHeaderField:@"token"];
    }
//    [PPNetworkHelper setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    //发起请求
    DLog(@"URL=%@", URL);
    DLog(@"parameters=%@", parameter);
    return [PPNetworkHelper GET:URL parameters:nil success:^(id responseObject) {
        DLog(@"responseObject=%@", responseObject);
        // 在这里你可以根据项目自定义其他一些重复操作,比如加载页面时候的等待效果, 提醒弹窗....
        if ([responseObject[@"code"] intValue] == 1000) {
            [MBProgressHUD showErrorMessage:@"token不合法"];
            
            return ;
        }
        else{
            success(responseObject);
        }
    } failure:^(NSError *error) {
        // 同上
        DLog(@"error=%@", error);
        failure(error);
        if (error.code == -1001) {
            [MBProgressHUD showErrorMessage:@"网络连接超时"];
            return ;
        }
        else if (error.code == -1004 || error.code == 3840) {
            [MBProgressHUD showErrorMessage:@"服务器连接失败"];
            return ;
        }
        else if (error.code == -1009) {
            [MBProgressHUD showErrorMessage:@"没有网络，请连接好网络再试"];
            return;
        }
        else{
            [MBProgressHUD showErrorMessage:KNSStringFormat(@"请求错误:%ld", error.code)];
            return;
        }
    }];
}

@end
