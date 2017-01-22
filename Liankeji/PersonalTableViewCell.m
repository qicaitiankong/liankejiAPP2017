//
//  PersonalTableViewCell.m
//  Liankeji
//
//  Created by 李自豪 on 16/11/29.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "PersonalTableViewCell.h"


@implementation PersonalTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier _tableview:(UITableView*)_tableView{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        CGFloat rowHeight = SCREEN_HEIGHT * 0.073;
        self.firstImageView = [[UIImageView alloc]init];
        //NSLog(@"cellheight = %lf",self.frame.size.height);
        //self.firstImageView.backgroundColor = [UIColor redColor];
        
        [self.contentView addSubview:self.firstImageView];
        [self.firstImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(SCREEN_WIDTH * 0.042);
            make.height.mas_equalTo(rowHeight * 0.33);
            make.width.equalTo(self.firstImageView.mas_height);
            make.centerY.equalTo(self.contentView);
        }];
        
        
        self.secondTitleLable = [[UILabel alloc]init];
        //self.secondTitleLable.backgroundColor = [UIColor blueColor];
        //self.secondTitleLable.center = CGPointMake(self.secondTitleLable.center.x, ROW_HEIGHT / 2);
        [self.contentView addSubview:self.secondTitleLable];
        [self.secondTitleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(SCREEN_WIDTH * 0.233 + rowHeight * 0.33);
            //make.right.equalTo(self.ce).offset(-100);
            make.height.equalTo(self).multipliedBy(0.6);
            make.centerY.equalTo(self.contentView);
        }];
        
        
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
