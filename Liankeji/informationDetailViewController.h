//
//  informationDetailViewController.h
//  Liankeji
//
//  Created by mac on 2016/12/30.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//
//点击CELL后切换的控制器

#import <UIKit/UIKit.h>
#import "BasicViewControllerForAddReturnview.h"

@protocol setReadAndAttentionDelegate <NSObject>

- (void)updateCellContent:(NSInteger)readNum commentNum:(NSInteger)commentnum giveMoneyNum:(NSInteger)giveMonyNum cellIndex:(NSInteger)row;

@end


@interface informationDetailViewController : BasicViewControllerForAddReturnview
//
@property (strong,nonatomic)UIImage* imageForView1;

@property (strong,nonatomic)NSString*  titleForView1;

@property (strong,nonatomic)NSString* authorForView1;

//
@property (strong,nonatomic)UIImage *photoImageForView2;

@property (strong,nonatomic)NSString *authorForView2;


@property (strong,nonatomic)NSString *readForView2;

@property (strong,nonatomic)NSString *introduceForView2;

@property (strong,nonatomic)UIButton *concernButtForView2;
//
@property(strong,nonatomic)NSString *mainTitleForView3;

@property (strong,nonatomic)NSString *detaileForView3;
//代理
@property (assign,nonatomic)id<setReadAndAttentionDelegate>targetDelegate;
//前一页点击的cell索引
@property (assign,nonatomic)NSInteger cellRowIndex;
@end
