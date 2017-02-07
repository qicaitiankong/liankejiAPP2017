//
//  ownImageviewAndLableView.m
//  Liankeji
//
//  Created by mac on 2017/1/3.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "ownImageviewAndLableView.h"
#import "appCommonAttributes.h"
#import <Masonry.h>

@implementation ownImageviewAndLableView
//宽高比
CGFloat smallImageViewWidthHeightProperty;

- (instancetype)initWithFrame:(CGRect)frame imageTag:(NSInteger)imageTag
{
    self = [super initWithFrame:frame];
    if (self) {
        
        switch (imageTag) {//由于三个图片宽高比不同
            case 1:
                smallImageViewWidthHeightProperty = 1.58;
                break;
            case 2:
                smallImageViewWidthHeightProperty = 1.31;
                break;
            case 3:
                smallImageViewWidthHeightProperty = 0.88;
                break;
            default:
                break;
        }
        self.smallImageView = [[UIImageView alloc]init];
        //self.smallImageView.backgroundColor = [UIColor grayColor];
        [self addSubview:self.smallImageView];
        self.smallNumLable = [[UILabel alloc]init];
        //self.smallNumLable.backgroundColor = [UIColor yellowColor];
        self.smallNumLable.textColor = RGBA(107, 107, 107, 1);
        self.smallNumLable.font = [UIFont systemFontOfSize:10];
        [self addSubview:self.smallNumLable];
        [self myUpdateConstraints];
        
    }
    return self;
}
-(void)myUpdateConstraints{
    [self.smallImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self);
        make.height.mas_equalTo(10);
        make.width.mas_equalTo(self.smallImageView.mas_height).multipliedBy(smallImageViewWidthHeightProperty);
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    [self.smallNumLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.smallImageView.mas_right).offset(5);
        make.right.mas_equalTo(self);
        make.top.mas_equalTo(self.smallImageView);
        make.bottom.mas_equalTo(self.smallImageView.mas_bottom);
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
