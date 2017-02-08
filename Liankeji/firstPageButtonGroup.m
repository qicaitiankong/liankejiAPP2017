//
//  firstPageButtonGroup.m
//  Liankeji
//
//  Created by 李自豪 on 16/12/15.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "firstPageButtonGroup.h"
#import "appCommonAttributes.h"
@implementation firstPageButtonGroup
NSMutableArray *buttonArr1;
NSMutableArray *buttonArr2;

-(UIView*)initWithFrame:(CGRect)frame titleArray:(NSMutableArray*)_titleArray imageArr:(NSMutableArray*)_imageArr groupDelegate:(id<groupButtonDelegate>)_groupDelegate{
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor whiteColor];
    if(self){
        buttonArr1 = [[NSMutableArray alloc]init];
        buttonArr2 = [[NSMutableArray alloc]init];
        for(NSInteger i = 0; i < _titleArray.count; i ++){
            CenterSmallView *smallView = [[CenterSmallView alloc]initWithFrame:CGRectZero image:_imageArr[i] lableTitle:_titleArray[i] lableTextCenter:YES delegate:_groupDelegate buttonTag:i + 1];
            if(i < 4){
                [buttonArr1 addObject:smallView];
            }else{
                [buttonArr2 addObject:smallView];
            }
            [self addSubview:smallView];
        }
    }
        [self addAdaptation];
       return self;
}

- (void)addAdaptation{
    //NSLog(@"中间按钮组高度=%lf",self.frame.size.height);
    [buttonArr1 mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:self.frame.size.width * 0.08 leadSpacing:self.frame.size.width * 0.041 tailSpacing:self.frame.size.width * 0.041];
    [buttonArr1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(5);
        make.height.mas_equalTo((self.frame.size.height - 15) * 0.5);
    }];
    UIButton *button1 = buttonArr1[0];
    UIButton *button2 = buttonArr1[1];
    //第二行两个按钮
    UIView *view1 = buttonArr2[0];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(button1.mas_leading);
        make.top.equalTo(button1.mas_bottom).offset(5);
        make.width.equalTo(button1.mas_width);
        make.height.equalTo(button1.mas_height);
    }];
    UIView *view2 = buttonArr2[1];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(button2.mas_leading);
        make.top.equalTo(button2.mas_bottom).offset(5);
        make.width.equalTo(button2.mas_width);
        make.height.equalTo(button2.mas_height);
    }];
}

//设置view样式
- (void)setStyleOfView :(UIView*)_view{
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
