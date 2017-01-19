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

//6个按钮组的tag基数
#define BUTTON_TAG 100
//按钮最初开始的位置
#define BUTTON_BEGIN_Y 300
//按钮垂直间距
#define BUTTON_VERTICAL_SPACE 10
@interface announceViewController ()<announceButtonClickDelegate,CAAnimationDelegate>{
    annoounceSecondPageViewController *secondVC;
    //主窗口
    UIWindow *rootWindow;
    //基视图
    UIView *baseView;
    //logo的视图
    UIImageView *animationImageView;
    //按钮组的视图
    UIView *buttonAnimationView;
    //取消按钮
    UIButton *cancelButton;
    //按钮标题数组
    NSMutableArray *buttonTitleArray;
    //上一个点击的tabbar按钮索引
    NSInteger previousTabbarIndex;
}

@end

@implementation announceViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    buttonTitleArray = [[NSMutableArray alloc]initWithObjects:@"发布技术",@"发布项目",@"发布需求",@"发布资金",@"发布设备",@"发布文章", nil];
    [self addBaseBackgroundView];
    [self addAnimationImageView];
    [self addGroupButton];
    [self addCancelButton];
    secondVC = [[annoounceSecondPageViewController alloc]init];
    [self presentViewController:secondVC animated:NO completion:nil];
    secondVC.anounceView.baseView = baseView;
    previousTabbarIndex = [LZHTabBarController shareLZHTabbarController].myTabBar.selectButton.tag - 12000;
        // Do any additional setup after loading the view.
}


-(void)viewWillAppear:(BOOL)animated{
    
    

    NSLog(@"发布页面上一个按钮的索引%li",previousTabbarIndex);
}


//以下11个方法中控件代码baseView是添加窗口上
//主窗口添加基view
- (void)addBaseBackgroundView{
    rootWindow = [UIApplication sharedApplication].windows[0];
    baseView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, rootWindow.bounds.size.width, rootWindow.bounds.size.height)];
    baseView.backgroundColor =[UIColor whiteColor];
    [rootWindow addSubview:baseView];
}

//添加logo
- (void)addAnimationImageView{
    CGFloat orginX = 0.1 * SCREEN_WIDTH;
    CGFloat orignY = SCREEN_HEIGHT + 20;
    animationImageView = [[UIImageView alloc]initWithFrame:CGRectMake(orginX, orignY, SCREEN_WIDTH - orginX * 2, 200)];
    //animationImageView.backgroundColor = [UIColor grayColor];
    [animationImageView setImage:[UIImage imageNamed:@"anounce_logo@3x"]];
    [baseView addSubview:animationImageView];
}
//添加按钮组
- (void)addGroupButton{
    CGFloat buttonWidth = 80;
    CGFloat buttonHeight = 100;
    //距离屏幕左边距离
    CGFloat leftSpace = 50;
    //按钮之间水平距离
    CGFloat buttonHorizontalSpace = (baseView.frame.size.width - leftSpace * 2 - buttonWidth * 3) * 0.5;
    //垂直方向开始位置
    CGFloat buttonOrignY = BUTTON_BEGIN_Y;
    //NSLog(@"垂直开始位置:%lf",buttonOrignY);
    //按钮之间的垂直距离
    CGFloat buttonVerticalSpace = BUTTON_VERTICAL_SPACE;
    for(NSInteger index = 0; index < 6; index ++){
        if(index != 0 && index % 3 == 0 ){
            buttonOrignY = buttonOrignY + buttonHeight + buttonVerticalSpace ;
        }
        //NSLog(@"垂直开始位置2:%lf",buttonOrignY);
        CGRect ButtonViewFrame = CGRectMake(leftSpace + (buttonWidth + buttonHorizontalSpace) * (index % 3), buttonOrignY, buttonWidth, buttonHeight);
        AnounceButtonView *button = [[AnounceButtonView alloc]initWithFrame:ButtonViewFrame delegate:self buttonTag:index imageViewPropertion:0.8];
        button.tag = BUTTON_TAG + index;
        NSString *imageNameStr = [NSString stringWithFormat:@"anounce1_%li",index];
        [button.ownImageView setImage:[UIImage imageNamed:imageNameStr]];
        button.ownLable.text = buttonTitleArray[index];
        button.userInteractionEnabled = NO;
        button.hidden = YES;
        //button.backgroundColor = [UIColor grayColor];
        [baseView addSubview:button];
    }
    [self animationLogoViewPopIn];
}
//添加取消按钮
- (void)addCancelButton{
    cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelButton.frame = CGRectMake(0, SCREEN_HEIGHT - 80, SCREEN_WIDTH, 80);
    cancelButton.backgroundColor = [UIColor whiteColor];
    
    [cancelButton setImage:[UIImage imageNamed:@"anounce1_cancel.@3x"] forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(cancelHandler:) forControlEvents:UIControlEventTouchUpInside];
    [baseView addSubview:cancelButton];
    //起初影藏
    cancelButton.userInteractionEnabled = NO;
    cancelButton.hidden = YES;
}
//logo弹入动画
- (void)animationLogoViewPopIn{
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:0.55 initialSpringVelocity:1 options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{
        animationImageView.transform  = CGAffineTransformMakeTranslation(0, -(baseView.frame.size.height - 0.12 * baseView.frame.size.height));
    } completion:^(BOOL finished) {
        //按钮组随后进入
        [weakSelf buttonGroupPopIn];
    }];
    
}
//logo弹出动画
- (void)animationLogoViewPopOut{
    [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionOverrideInheritedCurve animations:^{
        animationImageView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        if(finished){
            //还没完善出场逻辑，
            [UIView animateWithDuration:0.4 animations:^{
                baseView.alpha = 0;
                baseView.userInteractionEnabled = NO;
            } completion:^(BOOL finished) {
                if(baseView){
                   [baseView removeFromSuperview];
                }
                //恢复上一个标签视图及切换标签栏按钮
                [[LZHTabBarController shareLZHTabbarController]tabBar:nil didClickBtn:previousTabbarIndex];
                [[LZHTabBarController shareLZHTabbarController].myTabBar setSelectIndex:previousTabbarIndex];
            }];
            //NSLog(@"弹出logo");
        }
    }];
}

//按钮组弹进动画
- (void)buttonGroupPopIn{
    //NSLog(@"按钮组弹进");
    for(NSInteger i = 0 ; i < 6; i ++){
        AnounceButtonView *buttonView = [baseView viewWithTag:BUTTON_TAG + i];
        [UIView animateWithDuration:1.6 delay:0 usingSpringWithDamping:0.25 initialSpringVelocity:1 options:UIViewAnimationOptionOverrideInheritedCurve animations:^{
            //先隐藏弹出窗口外，因为是帧动画，移动的是层，
            [ownAnimation setOwnAnimation:buttonView viewIndex:i animationTime:0.01 startPoint:CGPointMake(buttonView.center.x, buttonView.center.y) animationSecondControPoint:CGPointMake(animationImageView.center.x, animationImageView.center.y)  animationThirdControPoint:CGPointMake(buttonView.center.x,-(buttonView.frame.size.height + 20)) delelgate:self];
            buttonView.hidden = NO;
            //再显示弹进
            [ownAnimation setOwnAnimation:buttonView viewIndex:i animationTime:1.5 startPoint:CGPointMake(buttonView.center.x, -(buttonView.frame.size.height + 20)) animationSecondControPoint:CGPointMake(animationImageView.center.x, animationImageView.center.y)  animationThirdControPoint:CGPointMake(buttonView.center.x,buttonView.center.y) delelgate:self];
        } completion:^(BOOL finished) {
            buttonView.userInteractionEnabled = YES;
        }];
    }
    //取消按钮跟着显示
    [UIView animateWithDuration:0.5 animations:^{
        cancelButton.hidden = NO;
        cancelButton.userInteractionEnabled = YES;
    }];
}
//按钮组弹出动画
- (void)buttonGroupPopOut{
    for(NSInteger i = 0 ; i < 6; i ++){
        AnounceButtonView *buttonView = [baseView viewWithTag:BUTTON_TAG + i];
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.15 initialSpringVelocity:1 options:UIViewAnimationOptionTransitionCurlDown animations:^{
            buttonView.userInteractionEnabled = NO;
            [ownAnimation setOwnAnimation:buttonView viewIndex:i animationTime:0.5 startPoint:CGPointMake(buttonView.center.x, buttonView.center.y) animationSecondControPoint:CGPointMake(buttonView.center.x, buttonView.center.y + 100)  animationThirdControPoint:CGPointMake(buttonView.center.x,baseView.frame.size.height + buttonView.frame.size.height) delelgate:self];
        } completion:^(BOOL finished) {
        }];
    }
}

//动画代理方法
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    static NSInteger i = 0;
    i ++;
    if(flag){
        if(0 == i % 18){//按钮组弹出完成
            //logo弹出
            [self animationLogoViewPopOut];
        }
    }
}
//按钮组点击代理方法
-(void)announceButtonClick:(NSInteger)index{
    NSLog(@"你在点击按钮:tag = %li",index);
    [UIView animateWithDuration:0.01 animations:^{
        baseView.transform = CGAffineTransformMakeTranslation(-SCREEN_WIDTH, 0);
    } completion:^(BOOL finished) {
        
    }];
}
//取消按钮
- (void)cancelHandler:(UIButton*)_b{
    if(secondVC){
        NSLog(@"发布中第二个控制器还存在");
        [secondVC dismissViewControllerAnimated:NO completion:^{
            
        }];
    }
    cancelButton.hidden = YES;
    cancelButton.userInteractionEnabled = NO;
    [self buttonGroupPopOut];
    
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
