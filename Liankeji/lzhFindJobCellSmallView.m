//
//  lzhFindJobCellSmallView.m
//  suipianTest
//
//  Created by mac on 2017/2/22.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "lzhFindJobCellSmallView.h"
#import <Masonry.h>

@implementation lzhFindJobCellSmallView

- (instancetype)initWithFrame:(CGRect)frame isSecond:(BOOL)isSecond
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        self.firstImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 7, 11)];
        //self.firstImageView.backgroundColor = [UIColor grayColor];
        [self addSubview:self.firstImageView];
        //
        if(isSecond){//比例不同
            [self.firstImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self);
                make.top.bottom.mas_equalTo(self);
                make.width.mas_equalTo(self.firstImageView.mas_height);
            }];
        }else{
            [self.firstImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self);
                make.top.bottom.mas_equalTo(self);
                make.width.mas_equalTo(self.firstImageView.mas_height).multipliedBy(0.63);
            }];
        }
        //
        self.secondTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.firstImageView.frame.origin.x + self.firstImageView.frame.size.width, self.firstImageView.frame.origin.y, self.frame.size.width - self.firstImageView.frame.size.width, self.frame.size.height)];
        self.secondTitleLabel.font = [UIFont systemFontOfSize:10];
        //self.secondTitleLabel.backgroundColor = [UIColor redColor];
        [self addSubview:self.secondTitleLabel];
        //
        [self.secondTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.firstImageView.mas_right).offset(5);
            make.right.mas_equalTo(self);
            make.top.bottom.mas_equalTo(self);
        }];
        
        
    }
    return self;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
