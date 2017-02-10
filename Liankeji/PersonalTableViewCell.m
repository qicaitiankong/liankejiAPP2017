//
//  PersonalTableViewCell.m
//  Liankeji
//
//  Created by 李自豪 on 16/11/29.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "PersonalTableViewCell.h"
#import <Masonry.h>
@implementation PersonalTableViewCell
CGFloat rowHeight;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier _tableview:(UITableView*)_tableView{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        rowHeight = SCREEN_HEIGHT * 0.073;
        self.firstImageView = [[UIImageView alloc]init];
        //NSLog(@"cellheight = %lf",self.frame.size.height);
        //self.firstImageView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:self.firstImageView];
        //
        self.secondTitleLable = [[UILabel alloc]init];
        self.secondTitleLable.textAlignment = NSTextAlignmentCenter;
        //self.secondTitleLable.backgroundColor = [UIColor blueColor];
        [self.contentView addSubview:self.secondTitleLable];
        //
        self.flagGoLabel = [[UILabel alloc]initWithFrame:CGRectMake(_tableView.frame.size.width - 30, self.secondTitleLable.frame.origin.y, 30, 20)];
        self.flagGoLabel.textColor = [UIColor grayColor];
        self.flagGoLabel.text = @">";
        [self.contentView addSubview:self.flagGoLabel];
        [self lzhMakeConstrains];
    }
    return self;
}
- (void)lzhMakeConstrains{
    [self.firstImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(SCREEN_WIDTH * 0.1);
        CGFloat rowHeight2 = rowHeight * 0.333;
        make.height.mas_equalTo(rowHeight2);
        make.width.mas_equalTo(self.firstImageView.mas_height).multipliedBy(1);
        make.centerY.mas_equalTo(self.contentView);
    }];
    [self.secondTitleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.contentView).multipliedBy(0.266);
        make.height.equalTo(self).multipliedBy(0.6);
        make.centerY.equalTo(self.contentView);
        make.centerX.mas_equalTo(self.contentView);
    }];
    
    [self.flagGoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView).offset(-SCREEN_WIDTH * 0.026);
        make.height.mas_equalTo(rowHeight * 0.333);
        make.width.mas_equalTo(self.flagGoLabel.mas_height).multipliedBy(0.75);
        make.centerY.mas_equalTo(self.contentView);
    }];
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
