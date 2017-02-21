//
//  lzhOperationFile.m
//  Liankeji
//
//  Created by mac on 2017/2/21.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "lzhOperationFile.h"
@interface lzhOperationFile (){
}
@end
@implementation lzhOperationFile
NSMutableArray *contentArr;

+ (lzhOperationFile*)operationFile{
    lzhOperationFile *operationFile = [[lzhOperationFile alloc]init];
    if(operationFile){
        contentArr = [NSMutableArray arrayWithCapacity:5];
    }
    return operationFile;
}
- (BOOL)lzhWriteToFile:(NSString*)fileNamePath content:(NSString*)writeContent{
    NSFileManager *manager = [NSFileManager defaultManager];
    NSString *content = [writeContent copy];
    //NSLog(@"content:%@",writeContent);
    BOOL suc = NO;
    BOOL suc2 = NO;
    
   // NSFileHandle *handler = [NSFileHandle fileHandleForUpdatingAtPath:fileNamePath];
    if([manager fileExistsAtPath:fileNamePath] == NO){
        suc = [manager createFileAtPath:fileNamePath contents:nil attributes:nil];
        NSLog(@"文件创建成功");
    }else{
        NSLog(@"历史记录文件存在");
        contentArr= [NSMutableArray arrayWithContentsOfFile:fileNamePath];
        if(contentArr.count == 0){
            contentArr = [[NSMutableArray alloc]initWithCapacity:5];
        }
        BOOL isSame = NO;
        for(NSString *str in contentArr){
            if([str isEqualToString:content]){
                isSame = YES;
                break;
            }
        }
        
        if(NO == isSame){
            //保持只有5个数据
            if(contentArr.count < 5){
                //NSLog(@"插入前:%@",contentArr);
                [contentArr insertObject:content atIndex:0];
                //NSLog(@"插入后:%@",contentArr);
            }
            if(contentArr.count == 5){
                //NSLog(@"插入前:%@",contentArr);
                [contentArr insertObject:content atIndex:0];
                [contentArr removeLastObject];
                //NSLog(@"插入后:%@",contentArr);
                
            }
            suc2 = [contentArr writeToFile:fileNamePath atomically:YES];
            if(suc2){
              //NSLog(@"写入成功");
            }else{
              //NSLog(@"写入失败");
            }
        }
    }
    return suc2;
}

- (NSMutableArray*)readFromFile:(NSString*)fileNamePath{
     NSMutableArray *arr2 = [NSMutableArray arrayWithContentsOfFile:fileNamePath];
    //NSLog(@"内部读取的数组:%@",arr2);
    return arr2;
}

- (BOOL)clearAllContent:(NSString*)fileNamePath{
    BOOL suc  = NO;
    NSArray *arr = @[];
    suc = [arr writeToFile:fileNamePath atomically:YES];
    return suc;
}


@end
