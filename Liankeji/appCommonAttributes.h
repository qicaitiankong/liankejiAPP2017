//
//  appCommonAttributes.h
//  Liankeji
//
//  Created by 李自豪 on 16/12/17.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#ifndef appCommonAttributes_h
#define appCommonAttributes_h
#import "LZHTabBarController.h"
//自定义颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a];
//导航栏标题颜色
#define NAVIGATION_TITLE_COLOR RGBA(201,201,201,1);

#define RED_COLOR RGBA(255,0,0,1);
#define ORANGE_COLOR RGBA(255,165,0,1);
#define YELLOW_COLOR RGBA(255,255,0,1);
#define GREEN_COLOR RGBA(0,255,0,1);
#define CYAN_COLOR RGBA(0,127,255,1);
#define BLUE_COLOR RGBA(0,0,255,1);
#define PURPER_COLOR RGBA(139,0,255,1);
#define BLACK_COLOR RGBA(76,76,76,1);
//屏幕高度、宽度
#define SCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
//导航栏
#define NAVIGATION_HEIGHT [UIScreen mainScreen].bounds.size.height * 0.065
//电池栏高度
#define STATUSBAR_HEIGHT     [UIApplication sharedApplication].statusBarFrame.size.height

//标签栏高度
#define TABBAR_HEIGHT [LZHTabBarController shareLZHTabbarController].myTabBar.frame.size.height

//主窗口
#define APP_MAIN_WINDOW [UIApplication sharedApplication].windows[0]

// 获取系统版本号
#define SysVer [[[UIDevice currentDevice] systemVersion] floatValue]
// 改写为弱引用
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;


#endif /* appCommonAttributes_h */
