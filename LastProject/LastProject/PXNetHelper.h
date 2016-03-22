//
//  PXNetHelper.h
//  LastProject
//
//  Created by Mac on 16/3/22.
//  Copyright (c) 2016年 QQ:1002766945. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PXNetHelper : NSObject

+ (id)shareInstance;

- (void)getWithURL:(NSString *)urlStr  headerField:(NSDictionary *)header parameters:(NSDictionary *)params completionBlockHandler:(void(^)(NSDictionary *responseDic, NSError *error)) completionBlock;

- (void)postWithURL:(NSString *)urlStr headerField:(NSDictionary *)header parameters:(NSDictionary *)params completionBlockHandler:(void(^)(NSDictionary *responseDic, NSError *error)) completionBlock;

@end
