//
//  LCRecruitCell.m
//  Liankeji
//
//  Created by liuchen on 2017/2/22.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "LCRecruitCell.h"
#import "appCommonAttributes.h"
#import <Masonry.h>

@implementation LCRecruitCell
@synthesize LCRecruitDic = _LCRecruitDic;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

#pragma mark - LCRecruitDic的set方法
#warning 有数据后if判断条件需要反转过来
- (void)setLCRecruitDic:(NSDictionary *)LCRecruitDic{

    if (LCRecruitDic == nil) {
        //创建视图
        [self createLCRecruitView];
    }
}


#pragma mark - 创建视图
- (void)createLCRecruitView{

    //设置cell样式
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    //添加子视图
    self.picImageView = [[UIImageView alloc]init];
    self.picImageView.image = [UIImage imageNamed:@"u=115513520,62143900&fm=23&gp=0.jpg"];
    [self.contentView addSubview:self.picImageView];
    
    self.nameLabel = [[UILabel alloc]init];
    self.nameLabel.backgroundColor = RGBA(35, 35, 35, 0.7);
    self.nameLabel.text = @"青岛海川汇物联科技有限公司";
    self.nameLabel.textAlignment = NSTextAlignmentLeft;
    self.nameLabel.textColor = [UIColor whiteColor];
    self.nameLabel.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:self.nameLabel];
    
    self.tLabel = [[UILabel alloc]init];
    self.tLabel.textColor = [UIColor blackColor];
    self.tLabel.textAlignment = NSTextAlignmentLeft;
    self.tLabel.text = @"JAVA后台程序人员";
    self.tLabel.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:self.tLabel];
    
    self.wagesLabel = [[UILabel alloc]init];
    self.wagesLabel.textAlignment = NSTextAlignmentRight;
    self.wagesLabel.textColor = RGBA(0, 238, 135, 1);
    self.wagesLabel.text = @"5k-10k";
    self.wagesLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:self.wagesLabel];
    
    self.contentLabel = [[UILabel alloc]init];
    self.contentLabel.text = @"岗位职责:女的,活的,熟悉Java/J2EE编程,熟悉主流的JAVA应用框架,如SSH,熟练使用Eclipse等开发工具,有意者请致电13456546";
    self.contentLabel.numberOfLines =2;
    self.contentLabel.textAlignment = NSTextAlignmentLeft;
    self.contentLabel.textColor = RGBA(35, 35, 35, 0.5);
    self.contentLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.contentLabel];
    
    //视图布局
    WS(ws);
    [self.picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws.contentView.mas_left).with.offset(5);
        make.right.mas_equalTo(ws.contentView.mas_right).with.offset(-5);
        make.top.mas_equalTo(ws.contentView.mas_top).with.offset(10);
        make.height.mas_equalTo(120);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws.contentView.mas_left);
        make.right.mas_equalTo(ws.contentView.mas_right);
        make.bottom.mas_equalTo(ws.picImageView.mas_bottom);
        make.height.mas_equalTo(20);
    }];
    
    [self.tLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws.contentView.mas_left).with.offset(10);
        make.top.mas_equalTo(ws.picImageView.mas_bottom);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(150);
    }];
    
    [self.wagesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.tLabel.mas_top);
        make.right.mas_equalTo(ws.contentView.mas_right).with.offset(-10);
        make.height.mas_equalTo(ws.tLabel.mas_height);
        make.width.mas_equalTo(100);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.tLabel.mas_bottom);
        make.left.mas_equalTo(ws.tLabel.mas_left);
        make.right.mas_equalTo(ws.contentView.mas_right).offset(-10);
        make.height.mas_equalTo(40);
    }];
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
