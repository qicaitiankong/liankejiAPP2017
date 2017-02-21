//
//  lzhOperationFile.h
//  Liankeji
//
//  Created by mac on 2017/2/21.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//搜索历史读写入文件

#import <Foundation/Foundation.h>

@interface lzhOperationFile : NSObject

+ (lzhOperationFile*)operationFile;

//写入文件内容（相同或写入失败都会返回NO）
- (BOOL)lzhWriteToFile:(NSString*)fileNamePath content:(NSString*)writeContent;
//读取文件
- (NSMutableArray*)readFromFile:(NSString*)fileNamePath;
//清除所有数据
- (BOOL)clearAllContent:(NSString*)fileNamePath;

@end
