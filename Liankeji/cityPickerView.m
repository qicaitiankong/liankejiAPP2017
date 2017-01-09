//
//  cityPickerView.m
//  Liankeji
//
//  Created by mac on 2017/1/9.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "cityPickerView.h"

#import "appCommonAttributes.h"

@interface cityPickerView()
@property (strong,nonatomic)AddressPickerView *addressPickerView;
@end

@implementation cityPickerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *transparentBut = [UIButton buttonWithType:UIButtonTypeCustom];
        transparentBut.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        transparentBut.alpha = 0.3;
        [transparentBut addTarget:self action:@selector(transparentButHandler:) forControlEvents:UIControlEventTouchUpInside];
        transparentBut.backgroundColor = [UIColor grayColor];
        [self addSubview:transparentBut];
        [self addSubview:self.addressPickerView];
       
        //[_addressPickerView addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:nil];
        
        [UIView animateWithDuration:0.5 animations:^{
            _addressPickerView.transform = CGAffineTransformMakeTranslation(0, -250);
        }];

    }
    return self;
}
//懒加载
-(AddressPickerView *)addressPickerView{
    if(!_addressPickerView){
        _addressPickerView = [[AddressPickerView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 250)];
        _addressPickerView.delegate = self;
    }
    return _addressPickerView;
}

- (void)transparentButHandler:(UIButton*)_b{
    [UIView animateWithDuration:(0.5) animations:^{
        _addressPickerView.transform = CGAffineTransformIdentity;
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];

    NSLog(@"按钮点击");
}
//地点选择器取消
-(void)cancelBtnClick{

    [UIView animateWithDuration:(0.5) animations:^{
        _addressPickerView.transform = CGAffineTransformIdentity;

    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
    }];
    

}
//地点选择器选择完成
-(void)sureBtnClickReturnProvince:(NSString *)province City:(NSString *)city Area:(NSString *)area{
    [UIView animateWithDuration:(0.5) animations:^{
        _addressPickerView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        if(self.ownCityDelegate){
            [self.ownCityDelegate getCityInformation:province city:city area:area];
        }
        [self removeFromSuperview];
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
