//
//  informationTableViewCell.m
//  Liankeji
//
//  Created by 李自豪 on 16/12/26.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "informationTableViewCell.h"
#import"appCommonAttributes.h"
#import <Masonry.h>
#import "appCommonAttributes.h"

#define CELL_HEIGHT SCREEN_HEIGHT * 0.149

@interface informationTableViewCell(){
    
}
@end


@implementation informationTableViewCell
@synthesize ownImageView;
@synthesize firstLable;
@synthesize secondLable;
@synthesize groupView;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier tableView:(UITableView*)_tableView{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        
        //左边图片
        ownImageView = [[UIImageView alloc]init];
        //ownImageView.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:ownImageView];
        //首标题LABLE
        firstLable = [[lzhRedeceTopSpaceLabel alloc]init];
        //firstLable.backgroundColor = [UIColor grayColor];
        firstLable.textColor = RGBA(87, 86, 86, 1);
        firstLable.numberOfLines = 2;
        firstLable.font = [UIFont systemFontOfSize:15];
        [firstLable setVerticalAlignment:VerticalAlignmentTop];
        [self.contentView addSubview:firstLable];
        
        //紧靠图片右边的种类lable
        secondLable = [[UILabel alloc]init];
        //secondLable.backgroundColor = [UIColor blueColor];
        secondLable.textColor = RGBA(167, 167, 167, 1);
        secondLable.font = [UIFont systemFontOfSize:11];
        [self.contentView addSubview:secondLable];
        //浏览量评论量打赏的总VIEW
        groupView = [[infomaFirstPageViewForCell alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
//        firstSmallDisplayView = groupView.firstSmallDisplayView;
//        secondSmallDisplayView = groupView.secondSmallDisplayView;
//        thirdSmallDisplayView = groupView.thirdSmallDisplayView;
        [self.contentView addSubview:groupView];
        [self myUpdateConstraints];

    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    //赋值
//    firstSmallDisplayView.smallNumLable.text = self.firstSmallNumberString;
//    secondSmallDisplayView.smallNumLable.text = self.secondSmallNumberString;
//    thirdSmallDisplayView.smallNumLable.text = self.thirdSmallNumberString;
}


-(void)myUpdateConstraints{
    //适配图片
    [ownImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(SCREEN_WIDTH * 0.019);
        make.top.mas_equalTo (self.contentView).offset(SCREEN_HEIGHT * 0.0187);
        make.bottom.mas_equalTo (self.contentView).offset(-SCREEN_HEIGHT * 0.0187);
        make.width.mas_equalTo(ownImageView.mas_height).multipliedBy(1.35);
    }];
    //首标题
    [firstLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ownImageView.mas_right).offset(SCREEN_WIDTH * 0.019);
        make.right.mas_equalTo(self.contentView).offset(-SCREEN_WIDTH * 0.019);
        make.top.mas_equalTo(ownImageView.mas_top);
        
        make.height.mas_equalTo(ownImageView.mas_height).multipliedBy(0.75);
    }];
    //种类标题
    [secondLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(firstLable.mas_left);
        make.width.mas_equalTo(self.contentView.mas_width).multipliedBy(0.066);
        //make.height.mas_equalTo(secondLable.mas_width).multipliedBy(0.5);
        make.top.mas_equalTo(firstLable.mas_bottom);
        make.bottom.mas_equalTo(ownImageView.mas_bottom).offset(0);
    }];
    
    [groupView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(secondLable.mas_right).offset(SCREEN_WIDTH * 0.12);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-SCREEN_WIDTH * 0.018);
        make.height.mas_equalTo(secondLable.mas_height);
        make.bottom.mas_equalTo(secondLable.mas_bottom);
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
