//
//  cellHeaderView3.m
//  Liankeji
//
//  Created by mac on 2017/1/5.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "cellHeaderView3.h"
#import "AnounceButtonView.h"
#import "appCommonAttributes.h"
#import <Masonry.h>


@implementation cellHeaderView3


- (instancetype)initWithFrame:(CGRect)frame clickDelegate:(id<announceButtonClickDelegate>)ownDelegate
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = RGBA(246, 246, 246, 1);
        CGFloat shareLableHeight = 10;
        UILabel *shareLable = [[UILabel alloc]initWithFrame:CGRectMake(0, shareLableHeight,SCREEN_WIDTH * 0.2, self.frame.size.height * 0.142)];
        shareLable.textColor = RGBA(119, 119, 119, 1);
        shareLable.textAlignment = NSTextAlignmentCenter;
        shareLable.font = [UIFont systemFontOfSize:16];
        shareLable.text = @"分享文章";
        shareLable.center = CGPointMake(frame.size.width / 2, shareLable.center.y);
        [self addSubview:shareLable];
        
        UIView *lineView1 = [[UIView alloc]initWithFrame:CGRectMake(0, shareLable.center.y - 1, shareLable.frame.origin.x - 2, 1)];
        lineView1.backgroundColor = RGBA(119, 119, 119, 1);
        [self addSubview:lineView1];
        
        UIView *lineView2 = [[UIView alloc]initWithFrame:CGRectMake(shareLable.frame.origin.x + shareLable.frame.size.width + 2, shareLable.center.y - 1, frame.size.width - shareLable.frame.origin.x - shareLable.frame.size.width - 2, 1)];
        lineView2.backgroundColor = RGBA(119, 119, 119, 1);
        [self addSubview:lineView2];
        
        NSMutableArray *imageArr = [[NSMutableArray alloc]init];
        NSMutableArray *imageNameArr = [[NSMutableArray alloc]initWithObjects:@"infoSecondPageWeiXin",@"infoSecondPageFriend",@"infoSecondPageQQ",@"infoSecondPageQZone", nil];

        NSMutableArray *titleArr = [[NSMutableArray alloc]initWithObjects:@"微信好友",@"微信朋友圈",@"qq好友",@"qq空间", nil];
        
        for(int j = 0; j < 4; j ++){
            UIImage *image = [UIImage imageNamed:imageNameArr[j]];
            [imageArr addObject:image];
        }
        NSMutableArray *buttonArr = [NSMutableArray arrayWithCapacity:4];
        for(NSInteger i = 0; i < 4; i ++){
            CGFloat leftSpace = 26;
            CGFloat buttonSpace = 5;
            CGFloat buttonImageViewWidth = (frame.size.width - 2 * leftSpace - (imageArr.count - 1) * buttonSpace) / imageArr.count;
            AnounceButtonView *buttonView = [[AnounceButtonView alloc]initWithFrame:CGRectMake(leftSpace + i * (buttonImageViewWidth + buttonSpace), shareLable.frame.origin.y + shareLable.frame.size.height + 20, buttonImageViewWidth, buttonImageViewWidth+ 20)  delegate:ownDelegate buttonTag:i imageViewPropertion:0.8];
            [buttonView.ownImageView setImage:imageArr[i]];
            buttonView.ownImageView.backgroundColor = RGBA(246, 246, 246, 1);
            buttonView.ownLable.text = titleArr[i];
            buttonView.ownLable.font = [UIFont systemFontOfSize:13];
            buttonView.ownLable.textColor = RGBA(173, 173, 173, 1);
            buttonView.titleButton.userInteractionEnabled = NO;
            [self addSubview:buttonView];
            //buttonView.backgroundColor = [UIColor grayColor];
            [buttonArr addObject:buttonView];
        }
        [buttonArr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:self.frame.size.width * 0.055 leadSpacing:self.frame.size.width * 0.034 tailSpacing:self.frame.size.width * 0.034];
        UIButton *butt = buttonArr[0];
        [buttonArr mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(butt.mas_width).multipliedBy(1.333);
            make.centerY.mas_equalTo(self.mas_centerY);
            
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
