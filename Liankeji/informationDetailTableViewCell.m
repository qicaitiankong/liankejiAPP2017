//
//  informationDetailTableViewCell.m
//  Liankeji
//
//  Created by mac on 2016/12/30.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "informationDetailTableViewCell.h"

@implementation informationDetailTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier tableView:(UITableView *)ownTableView cellheight:(CGFloat)ownCellHeight{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.ownImageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, ownCellHeight - 5 *2 , ownCellHeight - 5 * 2)];
        self.ownImageView.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:self.ownImageView];
        
        CGFloat lableLeftAndRightSpace = 5;
        
        CGFloat lableWidth = ownTableView.bounds.size.width -self.ownImageView.frame.origin.x - self.ownImageView.frame.size.width - lableLeftAndRightSpace  * 2;
        
        
        
        self.ownTitleLable = [[UILabel alloc]initWithFrame:CGRectMake(self.ownTitleLable.frame.origin.x+ self.ownTitleLable.frame.size.width + lableLeftAndRightSpace, self.ownImageView.frame.origin.y, lableWidth, ownCellHeight * 0.35)];
        self.ownTitleLable.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:self.ownTitleLable];
        
        
        
        
    }
    return self;
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
