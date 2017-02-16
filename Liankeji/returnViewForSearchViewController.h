//
//  returnViewForSearchViewController.h
//  Liankeji
//
//  Created by mac on 2017/2/16.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//搜索控制器中的返回view

#import <UIKit/UIKit.h>

@protocol searchHistoryDelegate <NSObject>
//添加搜索历史记录
- (void)setSearchHistoryView;
//点击了搜索
- (void)clickSearch:(UITextField*)textField;

@end

@interface returnViewForSearchViewController : UIView

@property (strong,nonatomic)UIButton *returnButt;

@property (strong,nonatomic)UITextField *searchField;

@property (strong,nonatomic)UIButton *searchButt;

@property (assign,nonatomic) id<searchHistoryDelegate> targetDelegate;

@end
