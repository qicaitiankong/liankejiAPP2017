//
//  ownHeaderViewForCell.m
//  Liankeji
//
//  Created by mac on 2017/1/4.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "ownHeaderViewForCell.h"
#import "cellHeaderView1.h"
#import "HotCommentView.h"
#import "firstOwnCellView.h"

@implementation ownHeaderViewForCell

- (instancetype)initWithFrame:(CGRect)frame headerView2Height:(CGFloat)_headerView2Height mainTitleLabHeight:(CGFloat)mainLableHeight detailLableHeight:(CGFloat)detailHeight clickDelegate:(id<announceButtonClickDelegate>)ownDelegate
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        //第一个view(上部图片标题加作者)
      firstOwnCellView *firstView = [[firstOwnCellView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, SCREEN_HEIGHT * 0.506) titleString:@""];
        self.firstView0ImageView = firstView.ownImageView;
        self.firstView0TitleLabel = firstView.ownFirstTitleLable;
        self.firstView0AuthorLabel = firstView.ownAuthorLable;
        [self addSubview:firstView];
        
        //第2个view(头像区域)
        cellHeaderView1 *view1 = [[cellHeaderView1 alloc]initWithFrame:CGRectMake(0, firstView.frame.origin.y + firstView.frame.size.height, self.frame.size.width, SCREEN_HEIGHT * 0.272)];
        [self addSubview:view1];
        self.userImageView = view1.userImageView;
        self.userNameLable = view1.userNameLable;
        self.introduceLable = view1.introduceLable;
        //self.readImageView = view1.readImageView;
        [view1.readImageView setImage:[UIImage imageNamed:@"infoSecondPageReadNumber"]];
        self.readLable = view1.readLable;
        self.attentionButton = view1.attentionButton;
        //第3个VIEW(标题及详情内容区域)
        cellHeaderView2 *view2 = [[cellHeaderView2 alloc]initWithFrame:CGRectMake(0, view1.frame.origin.y + view1.frame.size.height, self.frame.size.width, _headerView2Height) lable1Height:mainLableHeight lable2Height:detailHeight];
        self.mainTitleLable = view2.mainTitleLable;
        self.detailContentLable = view2.detailContentLable;
        [self addSubview:view2];
        //NSLog(@"组头前两个VIEW高度%lf",view2.frame.origin.y + view2.bounds.size.height);
        //添加分享模块
        cellHeaderView3 *view3 = [[cellHeaderView3 alloc]initWithFrame:CGRectMake(0, view2.frame.origin.y + view2.frame.size.height, self.frame.size.width, SCREEN_HEIGHT * 0.239) clickDelegate:ownDelegate];
        [self addSubview:view3];
        //添加热门评论
        HotCommentView *hotView = [[HotCommentView alloc]initWithFrame:CGRectMake(0, view3.frame.origin.y + view3.frame.size.height, self.frame.size.width, SCREEN_HEIGHT * 0.07)];
        //hotView.backgroundColor = [UIColor grayColor];
        [self addSubview:hotView];
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
