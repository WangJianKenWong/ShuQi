//
//  PXFileManager.m
//  LastProject
//
//  Created by Mac on 16/3/22.
//  Copyright (c) 2016年 QQ:1002766945. All rights reserved.
//

#import "PXFileManager.h"

@implementation PXFileManager

static PXFileManager *fileManager = nil;

+ (instancetype)manager
{
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        fileManager = [[super allocWithZone:NULL] init];
        
    });
    
    return fileManager;
}

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    return [self manager];
}

- (NSString *)fileDownloadPath
{
    NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    
    NSString *filePath = [docPath stringByAppendingPathComponent:@"downloadPath"];
    
    return filePath;
}

- (NSString *)tmpDownloadPath
{
    NSString *filePath = [self fileDownloadPath];
    
    NSString *tmpPath = [filePath stringByAppendingPathComponent:@"tmp"];
    
    if (![kUSER_M  fileExistsAtPath:tmpPath])
    {
        [kUSER_M createDirectoryAtPath:tmpPath withIntermediateDirectories:YES attributes:nil error:NULL];
    }
    
    return tmpPath;
}


- (NSString *)tmpPathWithName:(NSString *)name
{
    NSString *filePath = [[self tmpDownloadPath] stringByAppendingPathComponent:name];
    
    return filePath;
}


- (long long)fileSizeWithPath:(NSString *)path
{
    NSDictionary *dic = [kUSER_M attributesOfItemAtPath:path error:nil];
    return [dic[NSFileSize] longLongValue];
}

@end
