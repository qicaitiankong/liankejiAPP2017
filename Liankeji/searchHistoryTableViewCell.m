//
//  searchHistoryTableViewCell.m
//  Liankeji
//
//  Created by mac on 2017/2/17.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "searchHistoryTableViewCell.h"
#import "appCommonAttributes.h"


@implementation searchHistoryTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier tableView:(UITableView*)tableView{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        CGFloat labelHeight = SCREEN_HEIGHT* 0.04;
        self.historyLabel = [[UILabel alloc]initWithFrame:CGRectMake(2, 5, tableView.frame.size.width * 0.9, labelHeight)];
        //self.historyLabel.backgroundColor = [UIColor grayColor];
        self.historyLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:self.historyLabel];
        
        //测试单条历史记录失败，故没有显示
        self.cancelButt = [UIButton buttonWithType:UIButtonTypeCustom];
        CGFloat height = SCREEN_HEIGHT * 0.04 * 0.6;
        self.cancelButt.frame = CGRectMake(tableView.frame.size.width - height - 2, 5, height, height);
        self.cancelButt.center = CGPointMake(self.cancelButt.center.x, SCREEN_HEIGHT * 0.04 * 0.5);
        self.cancelButt.layer.cornerRadius = self.cancelButt.frame.size.height / 2;
        self.cancelButt.hidden = YES;
        self.cancelButt.userInteractionEnabled = NO;
        self.cancelButt.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:self.cancelButt];
        
        
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
