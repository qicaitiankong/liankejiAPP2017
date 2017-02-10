//
//  personalFirstViewOfFirstPage.m
//  Liankeji
//
//  Created by mac on 2017/1/18.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "personalViewOfFirstPage.h"
#import "personalSmallViewOfFirstPage.h"
#import "appCommonAttributes.h"
#import <Masonry.h>

@implementation personalViewOfFirstPage

NSMutableArray *itemArr;

- (instancetype)initWithFrame:(CGRect)frame numArr:(NSArray*)numArr titleArray:(NSArray*)titleArr
{
    self = [super initWithFrame:frame];
    if (self) {
        itemArr = [[NSMutableArray alloc]initWithCapacity:3];
        
        self.backgroundColor = [UIColor whiteColor];
        UIView *spaceLine = [[UIView alloc]initWithFrame:CGRectMake(15, 0, self.frame.size.width, 2)];
        spaceLine.backgroundColor = RGBA(246, 246, 246, 1);
        [self addSubview:spaceLine];
        
        CGFloat horizontalSpace = 30;
        for(NSInteger i  = 0 ; i < 3; i ++){
            personalSmallViewOfFirstPage *smallView = [[personalSmallViewOfFirstPage alloc]initWithFrame:CGRectMake(30 + i * (90 + horizontalSpace) ,10, 90, self.frame.size.height  - 10)];
            smallView.firstLabelOfNum.text = numArr[i];
            smallView.secondLabelOfTitle.text = titleArr[i];
            [itemArr addObject:smallView];
            [self addSubview:smallView];
        }
        [self lzhMakeConstrins];
        UIView *bottomSpaceLine = [[UIView alloc]initWithFrame:CGRectMake(15, self.frame.size.height - 2, self.frame.size.width, 2)];
        bottomSpaceLine.backgroundColor = RGBA(246, 246, 246, 1);
        [self addSubview:bottomSpaceLine];
        [bottomSpaceLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).offset(SCREEN_WIDTH * 0.02);
            make.right.mas_equalTo(self);
             make.bottom.mas_equalTo(self.mas_bottom);
            make.height.mas_equalTo(SCREEN_HEIGHT * 0.002);
        }];
    }
    return self;
}

-(void)lzhMakeConstrins{
    [itemArr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:SCREEN_WIDTH * 0.05 leadSpacing:SCREEN_WIDTH * 0.088 tailSpacing:SCREEN_WIDTH * 0.088];
    [itemArr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(SCREEN_HEIGHT * 0.014);
        make.bottom.mas_equalTo(self).offset(-SCREEN_HEIGHT * 0.014);

    }];
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
