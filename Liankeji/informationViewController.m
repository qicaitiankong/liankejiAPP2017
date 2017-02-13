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
@interface informationViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,categoryButtonClickDelegate>{
    //左右滑动按钮组
    ZHQScrollMenu* scrollViewMenu;
    //标题数组
    NSArray *buttonTitles;
}

@end

@implementation informationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setNavigationButton];
    [self createScrollButtonGroup];
    [self addTableView];
}
//设置导航栏的右按钮
- (void)setNavigationButton{
    UIImage *searchImage = [UIImage imageNamed:@"nav2"];
    UIColor *titleColor = NAVIGATION_TITLE_COLOR;
     [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:titleColor}];
    self.navigationItem.title = @"链科技ChinaTech";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:searchImage style:UIBarButtonItemStyleDone target:self action:@selector(rightSearchHandler:)];
}
-(void)rightSearchHandler:(UIBarButtonItem*)_b{
    
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
    inforMationTableView *ownTableView = [[inforMationTableView alloc]initWithFrame:CGRectMake(0,scrollViewMenu.frame.origin.y + scrollViewMenu.frame.size.height, SCREEN_WIDTH, self.view.frame.size.height - scrollViewMenu.frame.size.height) style:UITableViewStylePlain];
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
    cell.firstSmallNumberString = @"7000";
    cell.secondSmallNumberString = @"8000";
    cell.thirdSmallNumberString = @"5000";
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return SCREEN_HEIGHT * 0.149;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    informationDetailViewController *detailViewController = [[informationDetailViewController alloc]init];
    [self presentViewController:detailViewController animated:YES completion:nil];
    //[self.navigationController pushViewController:detailViewController animated:YES];
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
