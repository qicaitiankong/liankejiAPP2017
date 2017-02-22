//
//  LCReleaseCell.m
//  Liankeji
//
//  Created by liuchen on 2017/2/22.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "LCReleaseCell.h"
#import "appCommonAttributes.h"


@implementation LCReleaseCell
@synthesize releaseDic = _releaseDic;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

#pragma mark - release的set方法
#warning 有数据后if判断条件需要反转过来
-(void)setReleaseDic:(NSDictionary *)releaseDic{
    //判断dic中是否有数据
    if (releaseDic == nil) {
        _releaseDic = releaseDic;
        //创建视图
        [self createReleaseView];
    }else{
        NSLog(@"后台获取数据失败");
    }
}

#pragma mark - 创建视图
- (void)createReleaseView{
    //添加数据:此处暂时使用假数据,待接口完成后从dic中获取真实数据
    NSArray *describeArray = @[@"最新技术",@"最新项目",@"最新需求",@"最新资金",@"最新设备"];
    //加载视图
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.picScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, SCREEN_WIDTH/3.0*1.5)];
    self.picScrollView.contentSize = CGSizeMake(SCREEN_WIDTH/3.0*5+4, SCREEN_WIDTH/3.0*1.5);
    self.picScrollView.backgroundColor = RGBA(1, 199, 233, 1);
    self.picScrollView.bounces = NO;
    self.picScrollView.showsHorizontalScrollIndicator = false;
    [self.contentView addSubview:self.picScrollView];
    for (int i=0; i<describeArray.count; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/3.0*i+i, 0, SCREEN_WIDTH/3.0, SCREEN_WIDTH/3.0*1.5)];
        imageView.image = [UIImage imageNamed:@"infotest01.jpeg"];
        //添加图片:后期填充数据
        //imageView.image = [UIImage imageNamed:];
        imageView.layer.masksToBounds = YES;
        imageView.layer.cornerRadius = 3;
        imageView.layer.borderWidth = 2;
        imageView.layer.borderColor = [UIColor whiteColor].CGColor;
        //添加imageView上的label
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(imageView.frame.size.width/2.0-30, imageView.frame.size.height/2.0-10, 60, 20)];
        label.textColor = [UIColor whiteColor];
        label.text = describeArray[i];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:14];
        [imageView addSubview:label];
        UIButton *xqLabel = [[UIButton alloc]initWithFrame:CGRectMake(imageView.frame.size.width/2.0-20, imageView.frame.size.height-label.frame.size.height*2, 40, label.frame.size.height)];
        [xqLabel setTitle:@"详情>" forState:UIControlStateNormal];
        [xqLabel setFont:[UIFont systemFontOfSize:13]];
        [xqLabel setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [xqLabel setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
//        xqLabel.titleLabel.text = @"详情>";
//        xqLabel.textAlignment = NSTextAlignmentCenter;
//        xqLabel.textColor = RGBA(0, 177, 233, 1);
//        xqLabel.font = [UIFont systemFontOfSize:12];
        [imageView addSubview:xqLabel];
        //布局imageView上的label
        [self.picScrollView addSubview:imageView];
    }
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
