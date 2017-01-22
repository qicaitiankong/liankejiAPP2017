//
//  lzhDealNavigationColor.m
//  Liankeji
//
//  Created by mac on 2017/1/22.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "lzhDealNavigationColor.h"

@implementation lzhDealNavigationColor
lzhDealNavigationColor *navigationColor;

//设置导航栏透明
+ (lzhDealNavigationColor*)setNavigationControlerrTransparent:(UINavigationController*)nav{
    lzhDealNavigationColor *navigationColor = [[lzhDealNavigationColor alloc]init];
    if(navigationColor){
        //nav.navigationItem.title = @"链科技ChinaTech";
        [nav.navigationBar hy_setBackgroundViewWithColor:[UIColor whiteColor]];
        [nav.navigationBar hy_setBackgroundViewWithAlpha:0];
    }
    return navigationColor;
}

- (void)dealNavigationColor:(UIScrollView*)own_scrollView navigation:(UINavigationController*)nav{
        CGFloat offsetY = own_scrollView.contentOffset.y;
        CGFloat navgationHeight = nav.navigationBar.frame.size.height;
        if (offsetY > STATUSBAR_HEIGHT + navgationHeight) {
            CGFloat alpha = MIN(1, 1 - ( STATUSBAR_HEIGHT + navgationHeight - offsetY) / (STATUSBAR_HEIGHT + navgationHeight));
            if(alpha > 0.8){
                alpha = 0.8;
            }
            [nav.navigationBar hy_setBackgroundViewWithAlpha:alpha];
            //修改标题颜色
            UIColor *titleColor = NAVIGATION_TITLE_COLOR;
            [nav.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:titleColor}];
        } else {
            [nav.navigationBar hy_setBackgroundViewWithAlpha:0];
            //恢复标题颜色
            [nav.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
        }
}


@end
