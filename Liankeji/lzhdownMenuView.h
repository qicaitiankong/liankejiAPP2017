//
//  downMenuView.h
//  Liankeji
//
//  Created by 李自豪 on 16/12/17.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>
//协议
@protocol pullDownMenuDelegate <NSObject>
- (void)downMenuSelect:(NSInteger)_index;
@end

@interface lzhdownMenuView : UIView
//代理属性
@property (assign,nonatomic) id <pullDownMenuDelegate> downMenuDelegate;
//是否弹出
@property (assign,nonatomic)BOOL isOut;
//创建下拉菜单方法
-(instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray*)_titleArr delegate:(id <pullDownMenuDelegate>) _delegate;
//弹出弹入动画
- (void)popAnimation:(BOOL)cancelButtonClick;

@end
