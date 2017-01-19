//
//  LZHTabBarController.h
//  UITabBarTest
//
//  Created by 李自豪 on 16/12/22.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstPageViewController.h"
#import "informationViewController.h"
#import "announceViewController.h"
#import "CommunicateFirstViewController.h"
#import "personalFirstPageViewController.h"
#import "LZHTabBar.h"



@interface LZHTabBarController : UITabBarController

@property (assign,nonatomic)NSInteger previousSelectTabbarButTag;

@property (strong,nonatomic) LZHTabBar *myTabBar ;
//单利
+(LZHTabBarController*)shareLZHTabbarController;

//切换标签（发布中用到）
- (void)tabBar:(LZHTabBar*)tabBar didClickBtn:(NSInteger)index;

@end
