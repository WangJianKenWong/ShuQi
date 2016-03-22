//
//  PXNetHelper.m
//  LastProject
//
//  Created by Mac on 16/3/22.
//  Copyright (c) 2016年 QQ:1002766945. All rights reserved.
//

#import "PXNetHelper.h"


@interface PXNetHelper ()

@property (nonatomic, strong)AFHTTPSessionManager *manager;

@end

@implementation PXNetHelper

static PXNetHelper *staicInstance = nil;

+ (id)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        staicInstance = [[super allocWithZone:NULL] init];
    });
    return staicInstance;
}

+(id)allocWithZone:(struct _NSZone *)zone
{
    return [self shareInstance];
}


- (void)getWithURL:(NSString *)urlStr  headerField:(NSDictionary *)header parameters:(NSDictionary *)params completionBlockHandler:(void(^)(NSDictionary *responseDic, NSError *error)) completionBlock
{
    [self createManager];
    
    
    AFJSONRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
    
    if (header!=nil) {
        
        for (NSString *key in header.allKeys) {
            
            [requestSerializer setValue:header[key] forHTTPHeaderField:key];
        }
        
    }
    _manager.requestSerializer = requestSerializer;
    
    NSURLSessionDataTask *dataTask = [_manager GET:urlStr parameters:params success:^void(NSURLSessionDataTask *task, id responseObject) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        completionBlock(dic, nil);
        
    } failure:^void(NSURLSessionDataTask * task, NSError * error) {
        
        completionBlock(nil, error);
        
    }];
    
    [dataTask resume];
}

- (void)postWithURL:(NSString *)urlStr headerField:(NSDictionary *)header parameters:(NSDictionary *)params completionBlockHandler:(void(^)(NSDictionary *responseDic, NSError *error)) completionBlock
{
    [self createManager];
    
    AFJSONRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
    
    if (header!=nil) {
        
        for (NSString *key in header.allKeys) {
            
            [requestSerializer setValue:header[key] forHTTPHeaderField:key];
        }
        
    }
    _manager.requestSerializer = requestSerializer;
    
    NSURLSessionDataTask *dataTask = [_manager POST:urlStr parameters:params success:^void(NSURLSessionDataTask *task, id responseObject) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        completionBlock(dic, nil);
        
    } failure:^void(NSURLSessionDataTask * task, NSError * error) {
        
        completionBlock(nil, error);
        
    }];
    
    [dataTask resume];
}

- (void)createManager
{
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        _manager = [AFHTTPSessionManager manager];
        
    });
    
}

@end
