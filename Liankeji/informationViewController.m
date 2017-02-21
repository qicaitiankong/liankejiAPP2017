//
//  informationViewController.m
//  Liankeji
//
//  Created by 李自豪 on 16/12/23.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "informationViewController.h"
#import "appCommonAttributes.h"
#import "ZHQScrollMenu.h"
#import "inforMationTableView.h"
#import "informationTableViewCell.h"
#import "informationDetailViewController.h"
#import "ownTextSpace.h"
#import "lzhRefresh.h"
#import "ShareNetWorkState.h"
@interface informationViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,categoryButtonClickDelegate,setReadAndAttentionDelegate>{
    //左右滑动按钮组
    ZHQScrollMenu* scrollViewMenu;
    //标题数组
    NSArray *buttonTitles;
    //表视图
    inforMationTableView *ownTableView;
}
@end

@implementation informationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self createScrollButtonGroup];
    [self addTableView];
}

//创建滑动分类按钮组
- (void)createScrollButtonGroup{
    //NSLog(@"导航栏高度：%lf", self.navigationController.navigationBar.frame.size.height);
    scrollViewMenu = [[ZHQScrollMenu alloc]initWithFrame:CGRectMake(0, NAVIGATION_HEIGHT + STATUSBAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT * 0.068) delegate:self];
    scrollViewMenu.norMalTitleColor = RGBA(87, 87, 86, 1);
    scrollViewMenu.changeTitleColor = RGBA(35, 119, 212, 1);
    scrollViewMenu.lineColor = RGBA(35, 119,212, 1);
    [self.view addSubview:scrollViewMenu];
    buttonTitles = [NSArray arrayWithObjects:@"新闻",@"热门",@"科技",@"技术",@"前沿",@"最新", nil];
    [scrollViewMenu addButton:buttonTitles titleFontSize:14];
}
-(void)addTableView{
    ownTableView = [[inforMationTableView alloc]initWithFrame:CGRectMake(0,scrollViewMenu.frame.origin.y + scrollViewMenu.frame.size.height, SCREEN_WIDTH, self.view.frame.size.height - scrollViewMenu.frame.size.height) style:UITableViewStylePlain];
        ownTableView.dataSource = self;
        ownTableView.delegate = self;
        [self.view addSubview:ownTableView];
        [self addRefreshView:ownTableView];
}
- (void)addRefreshView:(UITableView*)_tableView{
    lzhRefresh *refreshHeader = [lzhRefresh headerWithRefreshingTarget:self refreshingAction:@selector(refreshData:)];
    UIView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, refreshHeader.frame.size.width, refreshHeader.frame.size.height)];
    imageView.backgroundColor = [UIColor grayColor];
    [refreshHeader addSubview:imageView];
    _tableView.mj_header = refreshHeader;
    
}
//刷新测试数据
- (void)refreshData:(MJRefreshGifHeader*)_header{
    ShareNetWorkState *dataRequest = [ShareNetWorkState ShareNetState];
    [dataRequest getDataWithUrl:@"http://115.159.1.248:56666/xinwen/getinrange.php" parameters:@{@"id": @1,@"index":@1,@"count":@5} sucess:^(id reponseObject) {
        NSLog(@"请求成功");
        [_header endRefreshing];
    } failuer:^(NSError *err) {
        NSLog(@"请求失败");
        [_header endRefreshing];
    }];
    
}
//按钮组点击事件
-(void)categoryButtonHandler:(NSInteger)tag{
    NSLog(@"当前点击按钮%li",tag);
        //分类请求数据
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    informationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"informationCell01"];
    if(nil == cell){
        //NSLog(@"cell height = %lf",cell.frame.size.height);
        cell = [[informationTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"informationCell01" tableView:tableView];
    }
    [cell.ownImageView setImage:[UIImage imageNamed:@"1"]];
    cell.firstLable.text = @"2016年科技发展技术情况签订协议结果将于2017年";
    [ownTextSpace setTextSpace:cell.firstLable.text targetLable:cell.firstLable textSpace:3];
    cell.secondLable.text = @"科技";
    cell.groupView.firstSmallDisplayView.smallNumLable.text = @"10000";
    cell.groupView.secondSmallDisplayView.smallNumLable.text = @"12";
    cell.groupView.thirdSmallDisplayView.smallNumLable.text = @"10";
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return SCREEN_HEIGHT * 0.149;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    informationDetailViewController *detailViewController = [[informationDetailViewController alloc]init];
    detailViewController.targetDelegate = self;
    detailViewController.cellRowIndex = indexPath.row;
    //
    detailViewController.imageForView1 = [UIImage imageNamed:@"infotest01.jpeg"];
    detailViewController.titleForView1 = @"面对“脖子以下”改革，习主席强调的 “三有”你有木有?";
    detailViewController.authorForView1 = @"罗主席";
    //
    detailViewController.photoImageForView2 = [UIImage imageNamed:@""];
    
    detailViewController.authorForView2 = @"罗主席";
    detailViewController.readForView2 = @"12345";
    detailViewController.introduceForView2 = @"罗主席，蝴蝶结和我家的机会我决定和我家大家看完请记得看文件等待即可为加快";
    //
    detailViewController.mainTitleForView3 = @"面对“脖子以下”改革，习主席强调的 “三有”你有木有?";
    detailViewController.detaileForView3 = @"2017年是“史上最牛军改”决胜之年。当前，军队规模结构和力量编成改革正在向纵深推进，涉及面更广、触及利益更深、任务更为艰巨，一些官兵将面临单位撤并降改和个人进退去留的考验。军改关键当口，应该保持什么样的精神状态？有什么样的使命担当？需要每名官兵用实际行动做出回答。2016年7月26日，习主席在中央政治局围绕深化国防和军队改革进行第三十四次集体学习时强调：“在国防和军队改革向纵深推进的关键当口，我们要有定力、有担当、有韧劲，继续蹄疾步稳向前走。”改革关头勇者胜。做到有定力、有担当、有韧劲 ，对于“乘势而上、迎难而上”推进军队改革，对于每名官兵作出正确抉择，意义重大而深远。";
    
    [self presentViewController:detailViewController animated:YES completion:nil];
    //[self.navigationController pushViewController:detailViewController animated:YES];
}
//二级页面调用的代理方法
-(void)updateCellContent:(NSInteger)readNum commentNum:(NSInteger)commentnum giveMoneyNum:(NSInteger)giveMonyNum cellIndex:(NSInteger)row{
    informationTableViewCell *cell = [ownTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:0]];
    NSLog(@"资讯二级代理：%li %li %li %li",readNum ,commentnum,giveMonyNum,row);
    if(cell){
        cell.groupView.firstSmallDisplayView.smallNumLable.text = [NSString stringWithFormat:@"%li",readNum];
        cell.groupView.secondSmallDisplayView.smallNumLable.text = [NSString stringWithFormat:@"%li",commentnum];
        cell.groupView.thirdSmallDisplayView.smallNumLable.text = [NSString stringWithFormat:@"%li",giveMonyNum];
    }
    
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
