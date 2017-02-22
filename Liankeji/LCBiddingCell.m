//
//  LCBiddingCell.m
//  Liankeji
//
//  Created by liuchen on 2017/2/22.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "LCBiddingCell.h"
#import "appCommonAttributes.h"
#import <Masonry.h>

@implementation LCBiddingCell
@synthesize biddingDic = _biddingDic;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

#pragma mark - biddingDic的set方法
#warning 有数据后if判断条件需要反转过来
-(void)setBiddingDic:(NSDictionary *)biddingDic{
    
    if (biddingDic == nil) {
        //创建视图
        [self createBiddingView];
    }else{
        NSLog(@"获取数据失败");
    }
}

#pragma mark - 创建视图
-(void)createBiddingView{
    //设置cell的属性
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    //添加子视图
    self.picImageView = [[UIImageView alloc]init];
    self.picImageView.image = [UIImage imageNamed:@"u=933971716,719375787&fm=23&gp=0.jpg"];
    self.picImageView.layer.masksToBounds = YES;
    self.picImageView.layer.cornerRadius=5;
    [self.contentView addSubview:self.picImageView];
    
    self.tLabel = [[UILabel alloc]init];
    self.tLabel.text = @"中蓝电子LOGO创意竞标";
    self.tLabel.textColor = BLACK_COLOR;
    self.tLabel.textAlignment = NSTextAlignmentLeft;
    self.tLabel.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:self.tLabel];
    
    self.priceLabel = [[UILabel alloc]init];
    self.priceLabel.textAlignment = NSTextAlignmentLeft;
    self.priceLabel.text = @"￥2000";
    self.priceLabel.textColor = [UIColor orangeColor];
    self.priceLabel.font = [UIFont systemFontOfSize:17];
    [self.contentView addSubview:self.priceLabel];
    
    self.numLabel = [[UILabel alloc]init];
    self.numLabel.textColor = [UIColor redColor];
    self.numLabel.text = @"已有153个小伙伴参与竞标";
    self.numLabel.textAlignment = NSTextAlignmentLeft;
    self.numLabel.font = [UIFont systemFontOfSize:10];
    [self.contentView addSubview:self.numLabel];
    
    self.timeLabel = [[UILabel alloc]init];
    self.timeLabel.text = @"限时:00:38:09";
    self.timeLabel.textColor = [UIColor whiteColor];
    self.timeLabel.textAlignment = NSTextAlignmentCenter;
    self.timeLabel.font = [UIFont systemFontOfSize:13];
    self.timeLabel.backgroundColor = RGBA(255, 206, 75, 1);
    self.timeLabel.layer.masksToBounds = YES;
    self.timeLabel.layer.cornerRadius = 3;
    //添加点击手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(buy)];
    self.timeLabel.userInteractionEnabled = YES;
    [self addGestureRecognizer:tap];
    [self.contentView addSubview:self.timeLabel];
    
    WS(ws);
    //添加布局控制
    [self.picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws.contentView.mas_left).with.offset(20);
        make.top.mas_equalTo(ws.contentView.mas_top).with.offset(20);
        make.height.mas_equalTo(60);
        make.width.mas_equalTo(60);
    }];
    [self.tLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws.picImageView.mas_right).with.offset(20);
        make.top.mas_equalTo(ws.contentView.mas_top).with.offset(15);
        make.height.mas_equalTo(25);
        make.width.mas_equalTo(150);
    }];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws.tLabel.mas_left);
        make.top.mas_equalTo(ws.tLabel.mas_bottom);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(75);
    }];
    [self.numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws.tLabel.mas_left);
        make.top.mas_equalTo(ws.priceLabel.mas_bottom);
        make.height.mas_equalTo(15);
        make.width.mas_equalTo(150);
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws.contentView.mas_right).with.offset(-15);
        make.bottom.mas_equalTo(ws.picImageView.mas_bottom);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(95);
    }];
}

#pragma mark - 竞价购买方法
- (void)buy{
    
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
