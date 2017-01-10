//
//  ownAnimation.h
//  Liankeji
//
//  Created by mac on 2017/1/10.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//自定义曲线运动动画

#import <UIKit/UIKit.h>
#import "AnounceButtonView.h"

@interface ownAnimation : UIView
//+(void)ownAnimation:(UIView*)animationView viewIndex:(NSInteger)index animationTime:(CGFloat)_animationtime animationSecondControPoint:(CGPoint)secondPoint animationThirdControPoint:(CGPoint)thirdPoint;
+(instancetype)setOwnAnimation:(AnounceButtonView*)animationView viewIndex:(NSInteger)index animationTime:(CGFloat)_animationtime animationSecondControPoint:(CGPoint)secondPoint animationThirdControPoint:(CGPoint)thirdPoint delelgate:(id<CAAnimationDelegate>) _delegate;
@end
