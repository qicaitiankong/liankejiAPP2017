//
//  PersonalTableViewCell.m
//  Liankeji
//
//  Created by 李自豪 on 16/11/29.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "PersonalTableViewCell.h"

#define ROW_HEIGHT 40

@implementation PersonalTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier _tableview:(UITableView*)_tableView{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.firstImageView = [[UIImageView alloc]initWithFrame:CGRectMake(35, 10, 20, 20)];
        NSLog(@"cellheight = %lf",self.frame.size.height);
        //self.firstImageView.backgroundColor = [UIColor redColor];
        self.firstImageView.center = CGPointMake(self.firstImageView.center.x, ROW_HEIGHT / 2);
        [self.contentView addSubview:self.firstImageView];
        self.secondTitleLable = [[UILabel alloc]initWithFrame:CGRectMake(self.firstImageView.frame.origin.x + self.firstImageView.frame.size.width + 100, 5, 100, ROW_HEIGHT * 0.6)];
        //self.secondTitleLable.backgroundColor = [UIColor blueColor];
        self.secondTitleLable.center = CGPointMake(self.secondTitleLable.center.x, ROW_HEIGHT / 2);
        [self.contentView addSubview:self.secondTitleLable];
        
        self.flagGoLabel = [[UILabel alloc]initWithFrame:CGRectMake(_tableView.frame.size.width - 30, self.secondTitleLable.frame.origin.y, 30, 20)];
        //self.flagGoLabel.backgroundColor = [UIColor grayColor];
        self.flagGoLabel.text = @">";
        [self.contentView addSubview:self.flagGoLabel];
        
    }
    return self;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
