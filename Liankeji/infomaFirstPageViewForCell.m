//
//  infomaFirstPageViewForCell.m
//  Liankeji
//
//  Created by mac on 2017/2/7.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "infomaFirstPageViewForCell.h"
#import <Masonry.h>

@interface infomaFirstPageViewForCell (){
}
@end

@implementation infomaFirstPageViewForCell

@synthesize firstSmallDisplayView;
@synthesize secondSmallDisplayView;
@synthesize thirdSmallDisplayView;
@synthesize viewArr;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        viewArr = [[NSMutableArray alloc]initWithCapacity:3];
        //第一个小view浏览量
        firstSmallDisplayView = [[ownImageviewAndLableView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) imageTag:1];
        UIImage *firstImage = [UIImage imageNamed:@"informationSkim"];
        [firstSmallDisplayView.smallImageView setImage:firstImage];
        //firstSmallDisplayView.backgroundColor = [UIColor yellowColor];
        
        [self addSubview:firstSmallDisplayView];
        //评论量view
        secondSmallDisplayView = [[ownImageviewAndLableView alloc]initWithFrame:CGRectMake(0, 0, 50, 15) imageTag:2];
        UIImage *secondImage = [UIImage imageNamed:@"informationComment"];
        [secondSmallDisplayView.smallImageView setImage:secondImage];
        //secondSmallDisplayView.smallNumLable.text = self.secondSmallNumberString;
        [self addSubview:secondSmallDisplayView];
        
        //悬赏view
        thirdSmallDisplayView = [[ownImageviewAndLableView alloc]initWithFrame:CGRectMake(0, 0, 50, 15) imageTag:3];
        UIImage *thirdImage = [UIImage imageNamed:@"informationReward"];
        //NSLog(@"imageWidth = %lf:%lf",thirdImage.size.width,thirdImage.size.height);
        [thirdSmallDisplayView.smallImageView setImage:thirdImage];
        [self addSubview:thirdSmallDisplayView];
        [viewArr addObject:firstSmallDisplayView];
        [viewArr addObject:secondSmallDisplayView];
        [viewArr addObject:thirdSmallDisplayView];
        [self myUpdateConstraints];
        
    }
    return self;
}

-(void)myUpdateConstraints{
    [viewArr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:5 leadSpacing:0 tailSpacing:0];
    [viewArr mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.mas_equalTo(self.mas_top);
       make.height.equalTo(self);
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
