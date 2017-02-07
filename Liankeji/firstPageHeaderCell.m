//
//  firstPageHeaderCell.m
//  Liankeji
//
//  Created by 李自豪 on 16/12/16.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//
//首页中科技头条的CELL

#import "firstPageHeaderCell.h"
#import "appCommonAttributes.h"
#import <Masonry.h>

@implementation firstPageHeaderCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier targetView:(UIView*)_tableView{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        //self.backgroundColor = [UIColor grayColor];
        
        _firstTitleLable = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, _tableView.frame.size.width - 5 * 2, 20)];
        _firstTitleLable.font = [UIFont systemFontOfSize:18];
        _firstTitleLable.textColor = RGBA(42, 42, 42, 1);
       // _firstTitleLable.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:_firstTitleLable];
        
        _secondTitleLable = [[UILabel alloc]initWithFrame:CGRectMake(5, 5 + _firstTitleLable.frame.size.height + 2, _firstTitleLable.frame.size.width, 40)];
        _secondTitleLable.textColor = [UIColor lightGrayColor];
        _secondTitleLable.textColor = RGBA(195, 195, 195, 1);
        
        _secondTitleLable.numberOfLines = 2;
        _secondTitleLable.font = [UIFont systemFontOfSize:14];
        //_secondTitleLable.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:_secondTitleLable];
        
        _ownImageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, _secondTitleLable.frame.origin.y + _secondTitleLable.frame.size.height + 2, _secondTitleLable.frame.size.width, 120)];
        //_ownImageView.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:_ownImageView];
        
        [self myMakeConstrains];
        
    }
    return self;
}

-(void)myMakeConstrains{
    [_firstTitleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset( 0.026 * SCREEN_WIDTH);
        make.right.mas_equalTo(self.contentView).offset(-0.026 * SCREEN_WIDTH);
        make.top.mas_equalTo(self.contentView.mas_top).offset(0.018 * SCREEN_HEIGHT);
        make.height.mas_equalTo(0.033 * SCREEN_HEIGHT);
    }];
    
    [_secondTitleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_firstTitleLable.mas_left);
        make.right.mas_equalTo(_firstTitleLable.mas_right);
        make.top.mas_equalTo(_firstTitleLable.mas_bottom).offset(0.019 * SCREEN_HEIGHT);
        make.height.mas_equalTo(0.048 * SCREEN_HEIGHT);
    }];
    [_ownImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_secondTitleLable.mas_left);
        make.right.mas_equalTo(_secondTitleLable.mas_right);
        make.top.mas_equalTo(_secondTitleLable.mas_bottom).offset(0.019 * SCREEN_HEIGHT);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(- 0.024 * SCREEN_HEIGHT);
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
