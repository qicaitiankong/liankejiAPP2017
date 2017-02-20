//
//  searchHistoryTableView.h
//  Liankeji
//
//  Created by mac on 2017/2/17.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol searchHistoryTableViewDelegate <NSObject>
//设置历史记录给输入框
-(void)setHistoryContentGiveTextField:(NSString*)contentStr;

//-(void)deleteSingleHistoryContent:(NSInteger)tag;
//清除历史记录
-(void)deleteAllHistoryContent;

@end


@interface searchHistoryTableView : UITableView

//显示内容
@property (strong,nonatomic)NSMutableArray *contentArr;


@property (assign,nonatomic)id<searchHistoryTableViewDelegate> targetDelegate;

@end
