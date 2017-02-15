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
        self.ownImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height * 0.692)];
        //self.ownImageView.backgroundColor = [UIColor blueColor];
        [self addSubview:self.ownImageView];
        //
        self.ownFirstTitleLable = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * 0.012, self.ownImageView.frame.origin.y + self.ownImageView.frame.size.height + 0.056 * self.ownImageView.frame.size.height, self.frame.size.width - 2 * SCREEN_WIDTH * 0.012, 0.126 * self.frame.size.height)];
        self.ownFirstTitleLable.textColor = RGBA(32, 32, 32, 1);
        self.ownFirstTitleLable.font = [UIFont systemFontOfSize:19.5];
        self.ownFirstTitleLable.numberOfLines = 3;
        // self.ownFirstTitleLable.backgroundColor = UIColor redColor];
        [self addSubview:self.ownFirstTitleLable];
        //
        UILabel *authorLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.ownFirstTitleLable.frame.origin.x,self.frame.size.height - self.frame.size.height * 0.052 - 2, SCREEN_WIDTH * 0.106, self.frame.size.height * 0.052)];
        authorLabel.textColor = [UIColor lightGrayColor];
        authorLabel.font = [UIFont systemFontOfSize:13];
        authorLabel.text = @"作者:";
        [self addSubview:authorLabel];
        //
        self.ownAuthorLable = [[UILabel alloc]initWithFrame:CGRectMake(authorLabel.frame.origin.x + authorLabel.frame.size.width,authorLabel.frame.origin.y, SCREEN_WIDTH * 0.206, authorLabel.frame.size.height)];
        self.ownAuthorLable.textColor = [UIColor lightGrayColor];
        self.ownAuthorLable.font = [UIFont systemFontOfSize:13];
        //self.ownAuthorLable.backgroundColor = [UIColor greenColor];
        [self addSubview:self.ownAuthorLable];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.ownAuthorLable.frame.origin.y + self.ownAuthorLable.frame.size.height + 5);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
