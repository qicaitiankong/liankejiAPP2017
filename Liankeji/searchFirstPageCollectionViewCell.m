//
//  findFirstPageCollectionViewCell.m
//  Liankeji
//
//  Created by mac on 2017/1/19.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "searchFirstPageCollectionViewCell.h"

@implementation searchFirstPageCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.testImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        //self.testImageView.backgroundColor = [UIColor greenColor];
        [self.contentView addSubview:self.testImageView];
    }
    return self;
}

@end
