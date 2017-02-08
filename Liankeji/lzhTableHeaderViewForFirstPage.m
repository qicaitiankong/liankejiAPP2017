//
//  lzhTableHeaderViewForFirstPage.m
//  Liankeji
//
//  Created by mac on 2017/2/8.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "lzhTableHeaderViewForFirstPage.h"
#import "appCommonAttributes.h"

//滚动视图高度
#define SCROLLVIEW_HEIGHT SCREEN_HEIGHT * 0.374

//中间按钮组整体的高度
#define BUTTON_GROUP_HEIGHT SCREEN_HEIGHT * 0.287
//公告
#define ANNOUNCE_HEIGHT SCREEN_HEIGHT * 0.067
//科技头条
#define SCIENCE_HEADER_HEIGHT SCREEN_HEIGHT * 0.1

@implementation lzhTableHeaderViewForFirstPage


- (instancetype)initWithFrame:(CGRect)frame targetDelegate:(id)_delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        self.targetDelega = _delegate;
        self.scoView = [self createScrollView];
        self.anounceView = [self createAnounmentView];
        self.groupButton = [self testButtonGroup];
        self.scinenceView = [self createScientHeaderView];
        self.scoView.pageViewDelegate = _delegate;
        [self addSubview:self.scoView];
        [self addSubview:self.anounceView];
        [self addSubview:self.groupButton];
        [self addSubview:self.scinenceView];

    }
    return self;
}
//滚动视图
- (FFScrollView*)createScrollView{
    NSArray *imageSources = @[@"1",@"2",@"2"];
    FFScrollView *scrollView = [[FFScrollView alloc]initPageViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,SCROLLVIEW_HEIGHT) views:imageSources];
    scrollView.backgroundColor = [UIColor whiteColor];
    return scrollView;
}
//创建最新公告
- (newAnnouncementView*)createAnounmentView{
    newAnnouncementView *anounmentView = [[newAnnouncementView alloc]initWithFrame:CGRectMake(0, self.scoView.bounds.size.height, SCREEN_WIDTH, ANNOUNCE_HEIGHT)];
    return anounmentView;
}

//中间button按钮组
- (firstPageButtonGroup*)testButtonGroup{
    NSMutableArray *buttonImageArr = [[NSMutableArray alloc]init];
    NSMutableArray *lableTitleArr = [[NSMutableArray alloc]initWithObjects:@"企业",@"专家",@"技术人才",@"高校",@"第三方",@"更多",nil];
    for(NSInteger i = 0 ; i < 6; i ++){
        NSString *imageName = [NSString stringWithFormat:@"firstpage_buttonGroup_0%li",i];
        UIImage *image = [UIImage imageNamed:imageName];
        [buttonImageArr addObject:image];
    }
    firstPageButtonGroup *buttonGroup = [[firstPageButtonGroup alloc]initWithFrame:CGRectMake(0, self.scoView.bounds.size.height + self.anounceView.bounds.size.height , SCREEN_WIDTH,BUTTON_GROUP_HEIGHT) titleArray:lableTitleArr imageArr:buttonImageArr groupDelegate:self.targetDelega];
    return buttonGroup;
}
//科技头条
- (scinenceHeaderView*)createScientHeaderView{
    scinenceHeaderView *scienceView = [[scinenceHeaderView alloc]initWithFrame:CGRectMake(0, self.groupButton.frame.origin.y+ self.groupButton.bounds.size.height, SCREEN_WIDTH, SCIENCE_HEADER_HEIGHT)];
    return scienceView;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
