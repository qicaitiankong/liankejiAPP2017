//
//  lzhDealNavigationColor.h
//  Liankeji
//
//  Created by mac on 2017/1/22.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "appCommonAttributes.h"
#import "UINavigationBar+NavigationBarBackground.h"
//首页导航栏渐变
@interface lzhDealNavigationColor : NSObject

+ (lzhDealNavigationColor*)setNavigationControlerrTransparent:(UINavigationController*)nav;

- (void)dealNavigationColor:(UIScrollView*)own_scrollView navigation:(UINavigationController*)nav;
@end
