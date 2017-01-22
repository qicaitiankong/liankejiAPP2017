//
//  CenterSmallView.m
//  Liankeji
//
//  Created by 李自豪 on 16/12/16.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//
//首页中间的企业、专家等分类自定义视图
#import "CenterSmallView.h"

@implementation CenterSmallView
- (instancetype)initWithFrame:(CGRect)frame image:(UIImage*)_image lableTitle:(NSString*)_text lableTextCenter:(BOOL)_isCenter delegate:(id<groupButtonDelegate>)_delegate buttonTag:(NSInteger)_buttonTag
{
    self = [super initWithFrame:frame];
    if (self) {
        //self.backgroundColor = [UIColor grayColor];
        self.groupdelegate = _delegate;
        _imageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _imageButton.tag = _buttonTag;
        [_imageButton setImage:_image forState:UIControlStateNormal];
        //_imageButton.backgroundColor = [UIColor grayColor];
        [_imageButton addTarget:self action:@selector(buttonHandler:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_imageButton];
        [_imageButton mas_makeConstraints:^(MASConstraintMaker *make) {
            //make.left.equalTo(self).offset(self.frame.size.width * 0.125);
            make.centerX.equalTo(self);
            make.top.equalTo(self);
            make.height.equalTo(_imageButton.mas_width);
            make.width.equalTo(self).multipliedBy(0.75);
        }];
        _titleLable = [[UILabel alloc]init];
        _titleLable.text = _text;
        _titleLable.font = [UIFont systemFontOfSize:15];
        _titleLable.textAlignment = NSTextAlignmentCenter;
        //_titleLable.backgroundColor = [UIColor blueColor];
        [self addSubview:_titleLable];
        [_titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.width.equalTo(self);
            make.top.equalTo(_imageButton.mas_bottom).offset(2);
            make.bottom.equalTo(self);
        }];
    }
    return self;
}

- (void)buttonHandler:(UIButton*)_b{
    if(self.groupdelegate){
        //NSLog(@"按钮组点击代理");
        [self.groupdelegate groupButtonClickHandler:_b.tag];
    }
    //NSLog(@"点击按钮中2016");
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
