//
//  sateliteMenuCenterButton.m
//  Liankeji
//
//  Created by 李自豪 on 16/12/18.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "sateliteMenuCenterButton.h"

//子安扭个数
#define SUB_BUTTON_COUNT 7
//子安扭与中心按钮距离
#define BUTTON_DISTANCE 200



@interface sateliteMenuCenterButton(){
    UIButton *centerButton ;
    NSMutableArray *subButttonArr;
    NSMutableArray *subButtonPositionArr;
    BOOL isOpen;
}
@end

@implementation sateliteMenuCenterButton


-(instancetype)initWithFrame:(CGRect)frame _delegate:(id<clickSubButtonDelegate>)_deleagte{
    self = [super initWithFrame:frame];
    if(self){
        subButttonArr = [[NSMutableArray alloc]init];
        subButtonPositionArr = [[NSMutableArray alloc]init];
        
        self.clickdelegate = _deleagte;
        self.backgroundColor = [UIColor whiteColor];
        //self.alpha = 0.75;
        self.layer.cornerRadius = frame.size.width / 2;
        centerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        centerButton.backgroundColor = [UIColor grayColor];
        centerButton.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        centerButton.layer.cornerRadius = self.layer.cornerRadius;
        
        [self addSubview:centerButton];
        [centerButton addTarget:self action:@selector(centerButtonHandler:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return  self;
}
//点击中心按钮事件
- (void)centerButtonHandler:(UIButton*)_b{
    
    [self createSubButtton];
    
}
//创建子安扭
- (void)createSubButtton{
    
    for(NSInteger i = 0; i <SUB_BUTTON_COUNT; i ++){
        UIButton *subButton  = [UIButton buttonWithType:UIButtonTypeCustom];
        CGFloat subButton_x = self.frame.origin.x;
        CGFloat subButton_y = self.frame.origin.y;
        CGFloat subButton_w = centerButton.frame.size.width / 2;
        CGFloat subButton_h = subButton_w;
        subButton.frame = CGRectMake(subButton_x, subButton_y, subButton_w, subButton_h);
        subButton.center = self.center;
        subButton.layer.cornerRadius = subButton.bounds.size.width / 2;
        
        subButton.backgroundColor = [UIColor yellowColor];
        subButton.tag = i +1 ;
        [subButton addTarget:self action:@selector(subButtonHandler:) forControlEvents:UIControlEventTouchDown];
        
        [subButttonArr addObject:subButton];
        UIWindow *window = [UIApplication sharedApplication].windows[0];
        [window addSubview:subButton];
        subButton.hidden = YES;
    }
    
    [self dealAnimation];
    
}
//计算扇形坐标
- (NSMutableArray *)getXWithTanAngle:(double)tanAngle  isSame:(BOOL)_isSame{
    double x;
    double y;
    NSMutableArray *locationArray = [[NSMutableArray alloc]init];
    x = BUTTON_DISTANCE / (sqrt(1 + tanAngle * tanAngle));
    if (x > 0.00){
        x = -x;
    }
    //NSLog(@"x=%lf",x);
    // y = fabs(tanAngle * x );
    y = tanAngle * x;
    //NSLog(@"y=%lf",y);
    [locationArray addObject:[NSString stringWithFormat:@"%f",x]];
    [locationArray addObject:[NSString stringWithFormat:@"%f",y]];
    return locationArray;
}

//处理动画
- (void)dealAnimation{
    double tanAngle = 0.00;
    for (NSInteger j = 0; j < SUB_BUTTON_COUNT; j ++){
        tanAngle = tan(M_PI_2 / 7 * j);
        NSMutableArray *subButtPosArr = [self getXWithTanAngle:tanAngle isSame:NO];
        [subButtonPositionArr addObject:subButtPosArr];
    }
    //    double tan1 = tan(M_PI * 2 / (n - 1));
    //    double tan2 = tan((M_PI * 2 / (n - 1) * 2));
    
    if (isOpen) {
        [self pullBackSubbutton];
    }
    else {
        [self popSubbutton];
    }
}

//弹出子安扭
- (void)popSubbutton{
    isOpen = YES;
    int i  = 0;
    //CAAnimationGroup *group = [CAAnimationGroup animation];
    //NSMutableArray *animationArr = [[NSMutableArray alloc]init];
    for(NSMutableArray *arr in subButtonPositionArr){
        double x = [arr[0] doubleValue];
        double y = [arr[1] doubleValue];
        UIButton *button = subButttonArr[i];
        
        [UIView animateWithDuration:0.5 animations:^{
            button.hidden = NO;
            button.transform = CGAffineTransformMakeTranslation(x, y);
        } completion:^(BOOL finished) {
        }];
        i ++;
    }
}

//拉回子安扭
- (void)pullBackSubbutton{
    isOpen = NO;
    for(UIButton *button in subButttonArr){
        [UIView animateWithDuration:0.5 animations:^{
            button.transform = CGAffineTransformIdentity;
            button.alpha = 0;
        } completion:^(BOOL finished) {
            [button removeFromSuperview];
        }];
    }
}

//根据点击tag让代理去处理相应方法
- (void)subButtonHandler:(UIButton*)_b{
    if(_clickdelegate){
        [_clickdelegate dealClickHandler:_b.tag];
    }else{
        NSLog(@"代理为空");
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
