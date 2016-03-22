//
//  PXFileManager.h
//  LastProject
//
//  Created by Mac on 16/3/22.
//  Copyright (c) 2016年 QQ:1002766945. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PXFileManager : NSObject

+ (instancetype)manager;

- (NSString *)tmpPathWithName:(NSString *)name;

- (NSString *)fileDownloadPath;

- (long long)fileSizeWithPath:(NSString *)path;

@end
