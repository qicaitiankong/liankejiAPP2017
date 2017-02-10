//
//  announceWindowView.m
//  Liankeji
//
//  Created by mac on 2017/2/9.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "announceWindowView.h"
#import "appCommonAttributes.h"
#import "AnounceButtonView.h"
#import "ownAnimation.h"
#import <Masonry.h>

//6个按钮组的tag基数
#define BUTTON_TAG 100
//按钮垂直间距
#define BUTTON_VERTICAL_SPACE SCREEN_HEIGHT * 0.074

@interface announceWindowView ()<CAAnimationDelegate>{
    //logo的视图
    UIImageView *animationImageView;
    //按钮组的视图
    UIView *buttonAnimationView;
    //取消按钮
    UIButton *cancelButton;
    //按钮标题数组
    NSMutableArray *buttonTitleArray;
    //第一行按钮
    NSMutableArray *buttonArr1;
    //第二行按钮
    NSMutableArray *buttonArr2;
}
@end

@implementation announceWindowView

@synthesize previousTabbarIndex;

-(instancetype)initWithFrame:(CGRect)frame targetDelegate:(id)_delegate{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor whiteColor];
        buttonArr1 = [[NSMutableArray alloc]initWithCapacity:3];
        buttonArr2 = [[NSMutableArray alloc]initWithCapacity:3];
        buttonTitleArray = [[NSMutableArray alloc]initWithObjects:@"发布技术",@"发布项目",@"发布需求",@"发布资金",@"发布设备",@"发布文章", nil];
        self.targetDelegate = _delegate;
        self.logoDelegate = _delegate;
        [self addAnimationImageView];
        [self addGroupButton];
        [self addCancelButton];
        [self lzhAddConstrains];
    }
    return self;
}

//添加logo
- (void)addAnimationImageView{
    CGFloat orignY = SCREEN_HEIGHT;
    animationImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, orignY, SCREEN_WIDTH  * 0.6, SCREEN_WIDTH * 0.6 * 0.555)];
    animationImageView.center = CGPointMake(self.center.x, animationImageView.center.y);
    //animationImageView.backgroundColor = [UIColor grayColor];
    [animationImageView setImage:[UIImage imageNamed:@"anounce_logo@3x"]];
    [self addSubview:animationImageView];
}
//添加按钮组
- (void)addGroupButton{
    CGFloat buttonWidth = SCREEN_WIDTH * 0.2;
    CGFloat buttonHeight = buttonWidth * 1.333;
    //距离屏幕左边距离
    CGFloat leftSpace = SCREEN_WIDTH * 0.085;
    //按钮之间水平距离
    CGFloat buttonHorizontalSpace = (self.frame.size.width - leftSpace * 2 - buttonWidth * 3) * 0.5;
    //垂直方向开始位置
    CGFloat buttonOrignY = SCREEN_HEIGHT * 0.12 + animationImageView.frame.size.height + 40;
    //NSLog(@"垂直开始位置:%lf",buttonOrignY);
    //按钮之间的垂直距离
    CGFloat buttonVerticalSpace = SCREEN_HEIGHT * 0.074;
    for(NSInteger index = 0; index < 6; index ++){
        if(index != 0 && index % 3 == 0 ){
            buttonOrignY = buttonOrignY + buttonHeight + buttonVerticalSpace ;
        }
        //NSLog(@"垂直开始位置2:%lf",buttonOrignY);
        CGRect ButtonViewFrame = CGRectMake(leftSpace + (buttonWidth + buttonHorizontalSpace) * (index % 3), buttonOrignY, buttonWidth, buttonHeight);
        AnounceButtonView *button = [[AnounceButtonView alloc]initWithFrame:ButtonViewFrame delegate:self.targetDelegate buttonTag:index imageViewPropertion:1];
        button.tag = BUTTON_TAG + index;
        NSString *imageNameStr = [NSString stringWithFormat:@"anounce1_%li",index];
        [button.ownImageView setImage:[UIImage imageNamed:imageNameStr]];
        button.ownLable.text = buttonTitleArray[index];
        button.userInteractionEnabled = NO;
        button.hidden = YES;
        if(index < 3){
            [buttonArr1 addObject:button];
        }else{
            [buttonArr2 addObject:button];
        }
        //button.backgroundColor = [UIColor grayColor];
        [self addSubview:button];
    }
    [self animationLogoViewPopIn];
}
//添加取消按钮
- (void)addCancelButton{
    cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelButton.frame = CGRectMake(0, SCREEN_HEIGHT - 80, SCREEN_WIDTH, 80);
    cancelButton.backgroundColor = [UIColor grayColor];
    
    [cancelButton setImage:[UIImage imageNamed:@"anounce1_cancel.@3x"] forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(cancelHandler:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:cancelButton];
    //起初影藏
    cancelButton.userInteractionEnabled = NO;
    cancelButton.hidden = YES;
}
//logo弹入动画
- (void)animationLogoViewPopIn{
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:0.55 initialSpringVelocity:1 options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{
        animationImageView.transform  = CGAffineTransformMakeTranslation(0, -SCREEN_HEIGHT * 0.88);
    } completion:^(BOOL finished) {
        //按钮组随后进入
        [weakSelf buttonGroupPopIn];
    }];
    
}
//logo弹出动画
- (void)animationLogoViewPopOut{
   // __weak typeof(self) weakSelf = self;

    [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionOverrideInheritedCurve animations:^{
        animationImageView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        if(finished){
            [[LZHTabBarController shareLZHTabbarController]tabBar:nil didClickBtn:previousTabbarIndex];
            [[LZHTabBarController shareLZHTabbarController].myTabBar setSelectIndex:previousTabbarIndex];
            [self.logoDelegate logoOutComplete];
        }
    }];
}

//按钮组弹进动画
- (void)buttonGroupPopIn{
    //NSLog(@"按钮组弹进");
    for(NSInteger i = 0 ; i < 6; i ++){
        AnounceButtonView *buttonView = [self viewWithTag:BUTTON_TAG + i];
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
        AnounceButtonView *buttonView = [self viewWithTag:BUTTON_TAG + i];
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.15 initialSpringVelocity:1 options:UIViewAnimationOptionTransitionCurlDown animations:^{
            buttonView.userInteractionEnabled = NO;
            [ownAnimation setOwnAnimation:buttonView viewIndex:i animationTime:0.5 startPoint:CGPointMake(buttonView.center.x, buttonView.center.y) animationSecondControPoint:CGPointMake(buttonView.center.x, buttonView.center.y + 100)  animationThirdControPoint:CGPointMake(buttonView.center.x,self.frame.size.height + buttonView.frame.size.height) delelgate:self];
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

//取消按钮
- (void)cancelHandler:(UIButton*)_b{
    cancelButton.hidden = YES;
    cancelButton.userInteractionEnabled = NO;
    [self buttonGroupPopOut];
    
}
//添加适配
- (void)lzhAddConstrains{
    [buttonArr1 mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0.136 * SCREEN_WIDTH leadSpacing:SCREEN_WIDTH * 0.085 tailSpacing:SCREEN_WIDTH * 0.085];
    UIButton *button1 = buttonArr1[0];
    [buttonArr1 mas_makeConstraints:^(MASConstraintMaker *make) {
        CGFloat top = SCREEN_HEIGHT * (0.12 + 0.131) + animationImageView.bounds.size.height;
        make.top.mas_equalTo(top);
        make.height.mas_equalTo(button1.mas_width).multipliedBy(1.333);
    }];
    
    [buttonArr2 mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0.136 * SCREEN_WIDTH leadSpacing:SCREEN_WIDTH * 0.085 tailSpacing:SCREEN_WIDTH * 0.085];
    [buttonArr2 mas_makeConstraints:^(MASConstraintMaker *make) {
        CGFloat top = SCREEN_HEIGHT * (0.12 + 0.131 + 0.074) + animationImageView.bounds.size.height + button1.bounds.size.height;
        make.top.mas_equalTo(top);
        make.height.mas_equalTo(button1.mas_width).multipliedBy(1.333);
    }];
    //获取第二行按钮样本
    UIButton *button2 = buttonArr2[0];
    [cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(button2.mas_bottom).offset(SCREEN_HEIGHT * 0.097);
        make.width.mas_equalTo(self).multipliedBy(0.6);
        make.centerX.mas_equalTo(self.mas_centerX);
        make.height.mas_equalTo(cancelButton.mas_width).multipliedBy(0.21);
    }];
}

@end
