//
//  ZHQScrollMenu.h
//  新闻客户端
//
//  Created by zhouqing on 16/4/14.
//  Copyright © 2016年 uplooking. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZHQScrollMenu : UIScrollView
//添加按钮
-(void)addButton:(UIButton *)btn;
//设置选中按钮
-(void)selected:(UIButton *)btn;
//转屏更新控件（目前用不到）
-(void)updateUI;
//标题的正常颜色
@property (strong,nonatomic)UIColor *norMalTitleColor;
//标题改变颜色
@property (strong,nonatomic)UIColor *changeTitleColor;
//线的颜色
@property (strong,nonatomic)UIColor *lineColor;

@property (strong,nonatomic)UIView * lineView;

@end
