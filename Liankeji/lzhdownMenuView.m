//
//  downMenuView.m
//  Liankeji
//
//  Created by 李自豪 on 16/12/17.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "lzhdownMenuView.h"
#import "sideMenuButton.h"
#import "appCommonAttributes.h"
#import <QuartzCore/QuartzCore.h>
#import <Masonry.h>
@implementation lzhdownMenuView
//分项按钮
sideMenuButton *sideButton;

-(instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray*)_titleArr delegate:(id <pullDownMenuDelegate>) _delegate{
    self = [super initWithFrame:frame];
    if(self){
        self.alpha = 0.1;
        NSMutableArray *buttonArr = [[NSMutableArray alloc]initWithCapacity:4];
        self.downMenuDelegate = _delegate;
        self.backgroundColor = [UIColor darkGrayColor];
            //添加用户头像按钮
            UIButton *userButton = [UIButton buttonWithType:UIButtonTypeCustom];
            userButton.tag = 0;
            userButton.frame = CGRectMake(0, self.frame.size.height * 0.15, self.frame.size.width * 0.10, self.frame.size.width * 0.10);
            userButton.layer.cornerRadius = userButton.bounds.size.width / 2;
            userButton.backgroundColor = [UIColor whiteColor];
            [userButton setImage:[UIImage imageNamed:@"user"] forState:UIControlStateNormal];
            [userButton addTarget:self action:@selector(menuButtonHandler:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:userButton];
            //添加按钮
            for(NSInteger i = 0; i <_titleArr.count; i ++ ){
               sideButton = [[sideMenuButton alloc]initWithFrame:CGRectMake(0, userButton.frame.origin.y + userButton.frame.size.height + 20 + i *40, self.frame.size.width * 0.25, 40)];
                sideButton.tag = i + 1;
                [self addSubview:sideButton];
                [sideButton.ownImageView setImage:[UIImage imageNamed:@"test"]];
                sideButton.ownTitleLable.text = _titleArr[i];
                [sideButton addTarget:self action:@selector(menuButtonHandler:) forControlEvents:UIControlEventTouchUpInside];
                [buttonArr addObject:sideButton];
            }
        //适配
        if(buttonArr.count > 0){
            CGFloat leadSpace = self.frame.size.height * 0.35;
            CGFloat trailingSpace = self.frame.size.height * 0.35;
            [buttonArr mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:5 leadSpacing:leadSpace tailSpacing:trailingSpace];
            [buttonArr mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self);
                make.width.mas_equalTo(self.mas_width).multipliedBy(0.25);
            }];
        }
        //最后给头像做适配
        UIButton *button0 = buttonArr[0];
        [userButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(self.mas_width).multipliedBy(0.1);
            make.width.mas_equalTo(userButton.mas_height);
            make.bottom.mas_equalTo(button0.mas_top).offset(-0.011 * SCREEN_HEIGHT);
            make.left.mas_equalTo(self).offset(5);
        }];
    }
    return self;
}
//代理事件
- (void)menuButtonHandler:(UIButton*)_b{
    //NSLog(@"点击有效");
    if(self.downMenuDelegate){
        [self.downMenuDelegate downMenuSelect:_b.tag];
    }
}

//弹出动画
- (void)popAnimation:(BOOL)cancelButtonClick{
    if(cancelButtonClick){
        [UIView animateWithDuration:0.8 delay:0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            self.transform = CGAffineTransformMakeTranslation(self.frame.size.width, 0);
            self.alpha = 1;

        } completion:^(BOOL finished) {
            self.isOut = YES;
        }];
    }else{
        [UIView animateWithDuration:0.8 delay:0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            self.transform = CGAffineTransformIdentity;
            self.alpha = 0.1;
        } completion:^(BOOL finished) {
            self.isOut = NO;
            [self removeFromSuperview];
        }];
    }
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    //画蒙版layer
    UIBezierPath *path = [[UIBezierPath alloc]init];
    [path moveToPoint:CGPointMake(0,0)];
    [path addLineToPoint:CGPointMake(0,self.frame.size.height)];
    
    [path addCurveToPoint:CGPointMake(0,0) controlPoint1:CGPointMake(self.frame.size.width * 0.15, self.frame.size.height * 0.75) controlPoint2:CGPointMake(self.frame.size.width * 0.4,self.frame.size.height / 2)];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = [path CGPath];
    //maskLayer.fillColor = [UIColor yellowColor].CGColor;
    self.layer.mask = maskLayer;
    [super drawRect:rect];
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self popAnimation:NO];
}

@end
