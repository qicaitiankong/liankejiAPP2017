//
//  informationDetailViewController.m
//  Liankeji
//
//  Created by mac on 2016/12/30.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "informationDetailViewController.h"
#import "firstOwnCellView.h"
#import "ownHeaderViewForCell.h"
#import "informationSecondPgeTavCell.h"
#import "GetCellHeight.h"


@interface informationDetailViewController ()<UITableViewDelegate,UITableViewDataSource>{
    firstOwnCellView *firstView ;
    UITableView *ownTableView;
    
    UIView *ownHeaderView;
}

@end

@implementation informationDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    [self addFirstView];
    [self initOwnTableView];
    
        // Do any additional setup after loading the view.
}
//添加最上面的view
-(void)addFirstView{
    firstView = [[firstOwnCellView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300) titleString:@"链科技正在打造全国新的技术交流对接链科技正在打造全国新的技术交流对接"];
    //v1.ownFirstTitleLable.text = @"链科技正在打造全国新的技术交流对接平台其实对的啊天空色彩2017大雪将至";
    firstView.ownAuthorLable.text = @"作者：陈教授";
    [self.view addSubview:firstView];
}

//添加headerView
- (UIView*)addHeaderView{
    NSString *mainTitleString = @"韩称将推进“萨德”部署 中方：不利和平须停止";
    UILabel *mainLable = [[UILabel alloc]init];
    mainLable.textAlignment = NSTextAlignmentLeft;
    mainLable.font = [UIFont systemFontOfSize:24];
    NSString *detailContentString = @"央视新闻客户端1月4日消息，在“萨德”反导系统入韩问题上，韩国防部今天（4号）在工作汇报中称，“萨德”是韩方针对朝鲜威胁而采取的应对措施，绝无政治考量。韩方将依照日程正常推进“萨德”系统部署工作。韩国防部还称，将继续向中国政府介绍韩方立场。此前，中方曾多次表示，“萨德”反导系统覆盖范围远远超出半岛防卫需求，深入亚洲大陆腹地，严重损害包括中国在内的本地区有关国家战略安全利益，不利于维护朝鲜半岛的和平与稳定。希望有关国家正视中方合理关切，停止有关部署进程。";
    
    UILabel *detailLable = [[UILabel alloc]init];
    detailLable.textAlignment = NSTextAlignmentLeft;
    detailLable.font = [UIFont systemFontOfSize:16];
    
    
    GetCellHeight *calculaieLableHeight = [GetCellHeight ShareCellHeight];
    CGFloat mainTitleLableHeigh =  [calculaieLableHeight cellHeight:mainLable content:mainTitleString Cellwidth:self.view.frame.size.width - 2 * 10];
    
    CGFloat detailTitleLableHeigh =  [calculaieLableHeight cellHeight:detailLable content:detailContentString Cellwidth:self.view.frame.size.width - 2 * 10];

    NSLog(@"2018 :%lf,%lf",mainTitleLableHeigh,detailTitleLableHeigh);
    
    ownHeaderViewForCell *view1 = [[ownHeaderViewForCell alloc]initWithFrame:CGRectMake(0, firstView.frame.origin.y + firstView.frame.size.height, self.view.frame.size.width, 200) headerView2Height:200 + mainTitleLableHeigh + detailTitleLableHeigh + 60  mainTitleLabHeight:mainTitleLableHeigh detailLableHeight:detailTitleLableHeigh];
    
    //ownHeaderViewForCell *view1 = [[ownHeaderViewForCell alloc]initWithFrame:CGRectMake(0, firstView.frame.origin.y + firstView.frame.size.height, self.view.frame.size.width, 200)];
    [view1.userImageView setImage:[UIImage imageNamed:@"infoSecondPageUserImage"]];
    view1.userNameLable.text = @"罗主席";
    [view1.readImageView setImage:[UIImage imageNamed:@"infoSecondPageReadNumber"]];
    view1.readLable.text = @"已有12345人阅读";
    view1.introduceLable.text = @"罗主席，蝴蝶结和我家的机会我决定和我家大家看完请记得看文件等待即可为加快";
    [view1.attentionButton setImage:[UIImage imageNamed:@"infoSecondPageGiveAttention"] forState:UIControlStateNormal];
    [view1.attentionButton addTarget:self action:@selector(attentionButtonClickHandler:) forControlEvents:UIControlEventTouchUpInside];

    view1.mainTitleLable.text = mainTitleString;
    view1.detailContentLable.text = detailContentString;
    
    return view1;
}



- (void)initOwnTableView{
     ownTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, firstView.frame.size.height, self.view.frame.size.width, 1000) style:UITableViewStyleGrouped];
    [self.view addSubview:ownTableView];
    ownTableView.delegate = self;
    ownTableView.dataSource = self;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    //第一种cell
//    informationSecondPgeTavCell *cell1 = nil;
//    
//    if(indexPath.row == 0){
//        cell = [tableView dequeueReusableCellWithIdentifier:@"infoSecondPageCell"];
//        if(nil == cell){
//            //第一种cell
//            cell1 = [[informationSecondPgeTavCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"infoSecondPageCell" tableView:tableView];
//            [cell1.userImageView setImage:[UIImage imageNamed:@"infoSecondPageUserImage"]];
//            cell1.userNameLable.text = @"罗主席";
//            [cell1.readImageView setImage:[UIImage imageNamed:@"infoSecondPageReadNumber"]];
//            cell1.readLable.text = @"已有12345人阅读";
//            cell1.introduceLable.text = @"罗主席，蝴蝶结和我家的机会我决定和我家大家看完请记得看文件等待即可为加快";
//            [cell1.attentionButton setImage:[UIImage imageNamed:@"infoSecondPageGiveAttention"] forState:UIControlStateNormal];
//            [cell1.attentionButton addTarget:self action:@selector(attentionButtonClickHandler:) forControlEvents:UIControlEventTouchUpInside];
//            cell = cell1;
//            //cell.backgroundColor = [UIColor greenColor];
//        }
//    
//    
//    }
    cell = [tableView dequeueReusableCellWithIdentifier:@"test1"];
    if(nil == cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"test1"];
    }
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
      NSLog(@"返回HEADER");
    ownHeaderView = [self addHeaderView];
    return ownHeaderView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    NSLog(@"设置高度header");
    UIView *views = [self addHeaderView];
    return views.frame.size.height;
}


//点击关注按钮
- (void)attentionButtonClickHandler:(UIButton*)_b{
    NSLog(@"点击关注按钮");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
