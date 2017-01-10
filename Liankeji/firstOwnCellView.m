//
//  firstOwnCellView.m
//  Liankeji
//
//  Created by mac on 2017/1/3.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "firstOwnCellView.h"
#import "GetCellHeight.h"

@implementation firstOwnCellView

- (instancetype)initWithFrame:(CGRect)frame titleString:(NSString *)titleStr
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.ownImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height * 0.66)];
        self.ownImageView.backgroundColor = [UIColor blueColor];
        [self addSubview:self.ownImageView];
       
        
        
        self.ownFirstTitleLable = [[UILabel alloc]initWithFrame:CGRectMake(5, self.ownImageView.frame.origin.y + self.ownImageView.frame.size.height + 10, self.frame.size.width - 2 * 5, 40)];
        
        self.ownFirstTitleLable.textColor = RGBA(32, 32, 32, 1);
        self.ownFirstTitleLable.font = [UIFont systemFontOfSize:19.5];
        self.ownFirstTitleLable.numberOfLines = 0;
        
        //并不是单例，只是没有修改过来
//        GetCellHeight *lableHeight = [GetCellHeight ShareCellHeight];
//        CGFloat firLableHeight = [lableHeight cellHeight:self.ownFirstTitleLable content:titleStr Cellwidth:self.ownFirstTitleLable.frame.size.width];
        //重新根据内容调整高度
        self.ownFirstTitleLable.frame = CGRectMake(self.ownFirstTitleLable.frame.origin.x, self.ownFirstTitleLable.frame.origin.y, self.ownFirstTitleLable.frame.size.width, 20);
        //self.ownFirstTitleLable.text = titleStr;
       // self.ownFirstTitleLable.backgroundColor = UIColor redColor];
        [self addSubview:self.ownFirstTitleLable];
        
        self.ownAuthorLable = [[UILabel alloc]initWithFrame:CGRectMake(self.ownFirstTitleLable.frame.origin.x,self.frame.size.height - 25, self.ownFirstTitleLable.frame.size.width, 20)];
        self.ownAuthorLable.textColor = [UIColor lightGrayColor];
        self.ownAuthorLable.font = [UIFont systemFontOfSize:13];
        //self.ownAuthorLable.backgroundColor = [UIColor greenColor];
        [self addSubview:self.ownAuthorLable];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.ownAuthorLable.frame.origin.y + self.ownAuthorLable.frame.size.height + 17.5);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
