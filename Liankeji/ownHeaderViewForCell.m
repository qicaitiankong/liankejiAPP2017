//
//  ownHeaderViewForCell.m
//  Liankeji
//
//  Created by mac on 2017/1/4.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "ownHeaderViewForCell.h"
#import "cellHeaderView1.h"


@implementation ownHeaderViewForCell

- (instancetype)initWithFrame:(CGRect)frame headerView2Height:(CGFloat)_headerView2Height mainTitleLabHeight:(CGFloat)mainLableHeight detailLableHeight:(CGFloat)detailHeight clickDelegate:(id<announceButtonClickDelegate>)ownDelegate
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        //第一个view(头像区域)
        cellHeaderView1 *view1 = [[cellHeaderView1 alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 200)];
        [self addSubview:view1];
        self.userImageView = view1.userImageView;
        self.userNameLable = view1.userNameLable;
        self.introduceLable = view1.introduceLable;
        self.readImageView = view1.readImageView;
        self.readLable = view1.readLable;
        self.attentionButton = view1.attentionButton;
        //第二个VIEW(标题及详情内容区域)
        cellHeaderView2 *view2 = [[cellHeaderView2 alloc]initWithFrame:CGRectMake(0, view1.frame.origin.y + view1.frame.size.height, self.frame.size.width, _headerView2Height) lable1Height:mainLableHeight lable2Height:detailHeight];
        self.mainTitleLable = view2.mainTitleLable;
        self.detailContentLable = view2.detailContentLable;
        [self addSubview:view2];
        //NSLog(@"组头前两个VIEW高度%lf",view2.frame.origin.y + view2.bounds.size.height);
        //添加分享模块
        cellHeaderView3 *view3 = [[cellHeaderView3 alloc]initWithFrame:CGRectMake(0, view2.frame.origin.y + view2.frame.size.height, self.frame.size.width, 150) clickDelegate:ownDelegate];
        [self addSubview:view3];
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
