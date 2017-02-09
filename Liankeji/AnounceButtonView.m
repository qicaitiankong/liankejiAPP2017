//
//  AnounceButtonView.m
//  Liankeji
//
//  Created by 李自豪 on 16/12/26.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "AnounceButtonView.h"
#import <Masonry.h>

@interface AnounceButtonView()
@end

@implementation AnounceButtonView


-(instancetype)initWithFrame:(CGRect)frame delegate:(id<announceButtonClickDelegate>)_delegate buttonTag:(NSInteger)buttonTag imageViewPropertion:(CGFloat)imageViewPropertion {
    self = [super initWithFrame:frame];
    if(self){
        self.announceDelegate = _delegate;
        //self.backgroundColor = [UIColor grayColor];
        self.ownImageView = [[UIImageView alloc]init];
        self.ownImageView.userInteractionEnabled = YES;
        self.ownImageView.layer.cornerRadius = self.ownImageView.bounds.size.width / 2;
        self.ownImageView.center = CGPointMake(self.bounds.size.width / 2, self.ownImageView.center.y);
        self.ownImageView.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.ownImageView];
        //添加imageView上的透明按钮,与ownimageView大小一致
        self.imageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.imageButton.tag = buttonTag;
        self.imageButton.backgroundColor = [UIColor clearColor];
        self.imageButton.layer.cornerRadius = self.imageButton.bounds.size.width / 2;
        [self.imageButton addTarget:self action:@selector(buttonHandler:) forControlEvents:UIControlEventTouchUpInside];
        [self.ownImageView addSubview:self.imageButton];
        //lable
        self.ownLable = [[UILabel alloc]init];
        self.ownLable.font = [UIFont systemFontOfSize:16];
        self.ownLable.textAlignment = NSTextAlignmentCenter;
        //self.ownLable.backgroundColor = [UIColor redColor];
        [self addSubview:self.ownLable];
        
        //titleButton 往self上加而不是lable（lable上不能加按钮）
        self.titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        //self.titleButton.frame = self.ownLable.frame;
        self.titleButton.tag = buttonTag;
        
        self.titleButton.backgroundColor = [UIColor yellowColor];
        self.titleButton.backgroundColor = [UIColor clearColor];
        [self.titleButton addTarget:self action:@selector(buttonHandler:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.titleButton];
        
        //适配
        [self.ownImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(self).multipliedBy(imageViewPropertion);
            make.height.mas_equalTo(self.mas_width).multipliedBy(imageViewPropertion);
            make.top.mas_equalTo(self);
            make.centerX.mas_equalTo(self.mas_centerX);
        }];
        [self.imageButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(self.ownImageView);
            make.height.mas_equalTo(self.ownImageView);
            make.center.mas_equalTo(self.ownImageView);
        }];
        [self.ownLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self);
            make.right.mas_equalTo(self);
            make.top.mas_equalTo(self.ownImageView.mas_bottom).offset(5);
            make.bottom.mas_equalTo(self);
        }];
        [self.titleButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(self);
            make.width.mas_equalTo(self.ownLable);
            make.height.mas_equalTo(self.ownLable);
        }];
    }
    return self;
}
- (void)buttonHandler:(UIButton*)_b{
    //NSLog(@"你在点击发布按钮");
    if(self.announceDelegate){
        [self.announceDelegate announceButtonClick:_b.tag];
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
