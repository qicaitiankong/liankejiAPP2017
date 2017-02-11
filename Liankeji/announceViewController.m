//
//  announceViewController.m
//  Liankeji
//
//  Created by 李自豪 on 16/12/23.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "announceViewController.h"
#import "appCommonAttributes.h"
#import "AnounceButtonView.h"
#import "ownAnimation.h"
#import "LZHTabBarController.h"
#import "annoounceSecondPageViewController.h"
#import "announceWindowView.h"
//本控制器只是盛放代码的辅助作用，真正显示的是窗口上的windowView,以及通过本控制器切换进来的第二个控制器
@interface announceViewController ()<announceButtonClickDelegate,logoOutComplete>{
    //发布页面的第二个控制器
    annoounceSecondPageViewController *secondVC;
    //上一个点击的tabbar按钮索引
    NSInteger previousTabbarIndex;
    //窗口发布view
    announceWindowView *windowView;
}

@end

@implementation announceViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    //self.isExchangeFromeOut = YES;
    self.view.backgroundColor = [UIColor whiteColor];
        // Do any additional setup after loading the view.
}

- (void)createWindowView{
    UIWindow * window  = APP_MAIN_WINDOW;
    windowView = [[announceWindowView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) targetDelegate:self];
    [window addSubview:windowView];
}
-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"视图将要出现");
    if(self.isExchangeFromeOut){
        previousTabbarIndex = [LZHTabBarController shareLZHTabbarController].myTabBar.selectButton.tag - 12000;
        if(windowView == nil){
            NSLog(@"发布view是空");
            [self createWindowView];
            windowView.previousTabbarIndex = previousTabbarIndex;
            self.isExchangeFromeOut = NO;
        }
        if(windowView != nil){
            NSLog(@"发布view已存在");
        }
    }else{
        //
    }
    //NSLog(@"发布页面上一个按钮的索引%li",previousTabbarIndex);
}
//按钮组点击代理方法
-(void)announceButtonClick:(NSInteger)index{
    NSLog(@"你在点击按钮:tag = %li",index);
    [UIView animateWithDuration:0.5 animations:^{
        
        secondVC = [[annoounceSecondPageViewController alloc]init];
        secondVC.windowView = windowView;
        [self presentViewController:secondVC animated:YES completion:nil];
       
    } completion:^(BOOL finished) {
        windowView.transform = CGAffineTransformMakeTranslation(-SCREEN_WIDTH, 0);
    }];
}
//logo退场完成代理方法
-(void)logoOutComplete{
    [windowView removeFromSuperview];
    windowView = nil;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
