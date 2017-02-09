//
//  sideMenuButton.m
//  Liankeji
//
//  Created by 李自豪 on 16/12/20.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "sideMenuButton.h"
#import <Masonry.h>

@implementation sideMenuButton

- (UIButton*)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
   // self.backgroundColor = [UIColor yellowColor];
    if (self) {
        CGFloat imageButtonWidth = frame.size.width * 0.25;
        self.ownImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, imageButtonWidth, imageButtonWidth)];
        //self.ownImageView.backgroundColor = [UIColor greenColor];
        self.ownImageView.layer.cornerRadius = self.ownImageView.bounds.size.width / 2;
        [self addSubview:self.ownImageView];
        
        self.ownTitleLable = [[UILabel alloc]init];
        self.ownTitleLable.frame = CGRectMake(self.ownImageView.bounds.size.width, 0, frame.size.width - imageButtonWidth, frame.size.height);
        self.ownTitleLable.font = [UIFont systemFontOfSize:15];
         //self.ownTitleLable.backgroundColor = [UIColor grayColor];
        [self.ownTitleLable setTextColor:[UIColor whiteColor]];
        //重置imageview在Y上的中心点
        self.ownImageView.center = CGPointMake(self.ownImageView.center.x, self.ownTitleLable.center.y);
        [self addSubview: self.ownTitleLable];
        
        
        [self.ownImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).offset(2);
            make.height.mas_equalTo(self).multipliedBy(0.35);
            make.width.mas_equalTo(self.ownImageView.mas_height);
            make.centerY.mas_equalTo(self.mas_centerY);
            
        }];
        [self.ownTitleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.ownImageView.mas_right).offset(2);
            make.right.mas_equalTo(self.mas_right);
            make.top.bottom.mas_equalTo(self);
            //make.centerY.mas_equalTo(self.mas_centerY);
        }];
        
        
    }
    return self;
}
//-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    //NSLog(@"在移动");
//    //self.ownTitleLable.font = [UIFont systemFontOfSize:19];
//}
//
//-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//   
//    // self.ownTitleLable.font = [UIFont systemFontOfSize:15];
//}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
