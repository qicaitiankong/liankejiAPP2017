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



@implementation cellHeaderView3


- (instancetype)initWithFrame:(CGRect)frame clickDelegate:(id<announceButtonClickDelegate>)ownDelegate
{
    self = [super initWithFrame:frame];
    if (self) {
        //self.backgroundColor = [UIColor redColor];
        CGFloat shareLableHeight = 10;
        UILabel *shareLable = [[UILabel alloc]initWithFrame:CGRectMake(0, shareLableHeight, 100, shareLableHeight)];
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
        for(NSInteger i = 0; i < 4; i ++){
            
            CGFloat leftSpace = 26;
            CGFloat buttonSpace = 5;
            
            CGFloat buttonImageViewWidth = (frame.size.width - 2 * leftSpace - (imageArr.count - 1) * buttonSpace) / imageArr.count;
            
            AnounceButtonView *buttonView = [[AnounceButtonView alloc]initWithFrame:CGRectMake(leftSpace + i * (buttonImageViewWidth + buttonSpace), shareLable.frame.origin.y + shareLable.frame.size.height + 20, buttonImageViewWidth, buttonImageViewWidth+ 20)  delegate:ownDelegate buttonTag:i imageViewPropertion:0.4];
            [buttonView.ownImageView setImage:imageArr[i]];
            buttonView.ownLable.text = titleArr[i];
            buttonView.ownLable.font = [UIFont systemFontOfSize:13];
            [self addSubview:buttonView];
            
        }
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
