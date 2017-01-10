//
//  ownAnimation.m
//  Liankeji
//
//  Created by mac on 2017/1/10.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "ownAnimation.h"

@interface ownAnimation ()<CAAnimationDelegate>
@end

@implementation ownAnimation
AnounceButtonView *buttonView;
CGPoint targetPoint;

+(instancetype)setOwnAnimation:(AnounceButtonView*)animationView viewIndex:(NSInteger)index animationTime:(CGFloat)_animationtime animationSecondControPoint:(CGPoint)secondPoint animationThirdControPoint:(CGPoint)thirdPoint delelgate:(id<CAAnimationDelegate>) _delegate{
    ownAnimation *ownaAnimation = [[ownAnimation alloc]init];
        buttonView = animationView;
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        //创建一个CGPathRef对象，就是动画的路线
        CGMutablePathRef path = CGPathCreateMutable();
    targetPoint = thirdPoint;
        //设置开始位置
        CGPathMoveToPoint(path,NULL,buttonView.center.x,buttonView.center.y);
        CGPathAddCurveToPoint(path, NULL, buttonView.center.x, buttonView.center.y, secondPoint.x,secondPoint.y, thirdPoint.x,thirdPoint.y);
        animation.path=path;
        CGPathRelease(path);
        animation.removedOnCompletion = NO;
        animation.fillMode = kCAFillModeForwards;
        animation.duration = _animationtime;
        animation.beginTime = CACurrentMediaTime() +0.3 *index;
        animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        animation.delegate = _delegate;
        [buttonView.layer addAnimation:animation forKey:nil];
    return ownaAnimation;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
