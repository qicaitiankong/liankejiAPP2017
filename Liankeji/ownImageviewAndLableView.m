//
//  ownImageviewAndLableView.m
//  Liankeji
//
//  Created by mac on 2017/1/3.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "ownImageviewAndLableView.h"
#import "appCommonAttributes.h"

@implementation ownImageviewAndLableView

- (instancetype)initWithFrame:(CGRect)frame imageTag:(NSInteger)imageTag
{
    self = [super initWithFrame:frame];
    if (self) {
        
        CGFloat smallImageViewHeight = self.frame.size.height * 0.5;
        CGFloat smallImageViewWidth = 1;
        switch (imageTag) {
            case 1:
                smallImageViewWidth = smallImageViewHeight * 1.58;
                break;
            case 2:
                smallImageViewWidth = smallImageViewHeight * 1.31;
                break;
            case 3:
                smallImageViewWidth = smallImageViewHeight * 0.88;
                break;

            default:
                break;
        }

        self.smallImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, smallImageViewWidth, smallImageViewHeight)];
        //self.smallImageView.backgroundColor = [UIColor greenColor];
        [self addSubview:self.smallImageView];
        self.smallNumLable = [[UILabel alloc]initWithFrame:CGRectMake(self.smallImageView.frame.origin.x + self.smallImageView.frame.size.width + 5, self.smallImageView.frame.origin.y, self.frame.size.width - self.smallImageView.frame.size.width - self.smallImageView.frame.origin.x - 5, self.smallImageView.frame.size.height)];
        //self.smallNumLable.backgroundColor = [UIColor yellowColor];
        self.smallNumLable.textColor = RGBA(107, 107, 107, 1);
        [self addSubview:self.smallNumLable];
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.smallImageView.center = CGPointMake(self.smallImageView.center.x, self.frame.size.height / 2);
    self.smallNumLable.center = CGPointMake(self.smallNumLable.center.x, self.smallImageView.center.y);
    
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
