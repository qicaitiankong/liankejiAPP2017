//
//  FirstPageViewController.m
//  Liankeji
//
//  Created by 李自豪 on 16/11/29.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "FirstPageViewController.h"
#import "ShareNetWorkState.h"
#import "ShareUrlString.h"
#import "ShareHomePath.h"
#import "ShareDataBase.h"
#import "NewsTestModel.h"
#import "GetCellHeight.h"
#import "sateliteMenuCenterButton.h"
#import "CenterSmallView.h"
#import "firstPageHeaderCell.h"
#import "lzhdownMenuView.h"
#import "newAnnouncementView.h"
#import "scinenceHeaderView.h"
#import "appCommonAttributes.h"
#import "centerButtonGroupViewController.h"
#import "searchViewController.h"
#import "lzhDealNavigationColor.h"
#import "lzhTableHeaderViewForFirstPage.h"
//滚动视图高度
#define SCROLLVIEW_HEIGHT SCREEN_HEIGHT * 0.374
//中间按钮组整体的高度
#define BUTTON_GROUP_HEIGHT SCREEN_HEIGHT * 0.287
//公告
#define ANNOUNCE_HEIGHT SCREEN_HEIGHT * 0.067
//科技头条
#define SCIENCE_HEADER_HEIGHT SCREEN_HEIGHT * 0.1

@interface FirstPageViewController ()<FFScrollViewDelegate,clickSubButtonDelegate,pullDownMenuDelegate,groupButtonDelegate,UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic)lzhDealNavigationColor* dealNavigationColor;

@property (strong,nonatomic)NSMutableArray *newsArr;
//表视图
@property (strong,nonatomic)UITableView *tableView;
//表头
@property (strong,nonatomic)UIView *tableHeaderView;
//表头高度
@property (assign,nonatomic) CGFloat tableHeaderHeight;
//侧拉菜单
@property (strong,nonatomic) lzhdownMenuView *sideMenuView;

@end

@implementation FirstPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableHeaderHeight = SCROLLVIEW_HEIGHT + ANNOUNCE_HEIGHT + BUTTON_GROUP_HEIGHT + SCIENCE_HEADER_HEIGHT;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.newsArr = [[NSMutableArray alloc]initWithCapacity:2];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNavigationButton];
    [self addSateliteMenu];
    [self initTableView];
    [self createSideMenu];
}
//处理滑动导航栏的渐变
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.dealNavigationColor dealNavigationColor:scrollView navigation:self.navigationController];
}
//设置导航栏的左右按钮
- (void)setNavigationButton{
    self.navigationItem.title = @"链科技ChinaTech";
    self.dealNavigationColor = [lzhDealNavigationColor setNavigationControlerrTransparent:self.navigationController];
    //导航栏左按钮点击事件
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav1"] style:UIBarButtonItemStyleDone target:self action:@selector(leftNavBarHandler:)];
    UIImage *searchImage = [UIImage imageNamed:@"nav2"];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:searchImage style:UIBarButtonItemStyleDone target:self action:@selector(rightSearchHandler:)];
}
//点击左侧navgabar弹出菜单
- (void)leftNavBarHandler:(UIBarButtonItem*)_u{
    [self.sideMenuView popAnimation:!self.sideMenuView.isOut];
}
//创建侧拉菜单
- (void)createSideMenu{
    //侧拉菜单
    self.sideMenuView = [[lzhdownMenuView alloc]initWithFrame:CGRectMake(-SCREEN_WIDTH, NAVIGATION_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - NAVIGATION_HEIGHT - TABBAR_HEIGHT) titleArray:@[@"菜单1",@"菜单2",@"菜单3",@"菜单4"] delegate:self];
    [self.view addSubview:self.sideMenuView];
}
//侧拉菜单点击代理方法
-(void)downMenuSelect:(NSInteger)_index{
    NSLog(@"你点击了下拉菜单中的%li",_index);
}
//导航栏右侧搜索按钮
- (void)rightSearchHandler:(UIBarButtonItem*)_u{
    searchViewController *searchVC = [[searchViewController alloc]init];
    [self presentViewController:searchVC animated:YES completion:^{
    }];
}
//轮播点击
-(void)scrollViewDidClickedAtPage:(NSInteger)pageNumber{
    NSLog(@"你点击了轮播中的%li",pageNumber);
}
//中间按钮点击事件
-(void)groupButtonClickHandler:(NSInteger)buttonIndex{
    NSLog(@"buttonGroup:%li",buttonIndex);
    centerButtonGroupViewController *detailVC = [[centerButtonGroupViewController alloc]init];
    [self presentViewController:detailVC animated:YES completion:nil];
    //[self.navigationController pushViewController:detailVC animated:YES];
}
//添加卫星菜单
- (void)addSateliteMenu{
    NSArray *windowArr = [UIApplication sharedApplication].windows;
    UIWindow *window = windowArr[0];
    UIView *sateliteView =  [[sateliteMenuCenterButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 60, SCREEN_HEIGHT  - 64 - 49, 60, 60) _delegate:self];
    [window addSubview:sateliteView];
}
//卫星菜单点击事件
-(void)dealClickHandler:(NSInteger)buttonIndex{
    NSLog(@"点击了卫星菜单中的：%li",buttonIndex);
}
//添加表头
- (UIView*)crateTableHeaderView{
    UIView *headerView = [[lzhTableHeaderViewForFirstPage alloc]initWithFrame:CGRectMake(0, -self.tableHeaderHeight, SCREEN_WIDTH, self.tableHeaderHeight) targetDelegate:self];
    return headerView;
}
//初始化tableView
- (void)initTableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,  0  , SCREEN_WIDTH, 1000) style:UITableViewStyleGrouped];
    [self.view addSubview:_tableView];
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
}

//没有数据，先写死了
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    firstPageHeaderCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
    if(nil == cell){
        cell = [[firstPageHeaderCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1" targetView:_tableView];
    }
    cell.firstTitleLable.text = @"你好，我是链科技期待你的加入";
    cell.secondTitleLable.text = @"目的是中国做大的技术对接";
    [cell.ownImageView setImage:[UIImage imageNamed:@"1"]];
    return cell;
}
//设置表头
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    self.tableHeaderView =  [self crateTableHeaderView];
    return self.tableHeaderView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    //NSLog(@"表头高度%lf",self.tableHeaderView.bounds.size.height);
    return self.tableHeaderHeight;
}
//cell高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return SCREEN_HEIGHT * 0.346;
}
//数据库操作
- (void)operateDataBase{
    ShareDataBase *dataBaseClass = [ShareDataBase shareDataBase];
    [dataBaseClass getDataBase:@"db.sqlite"];
    BOOL dataBaseSuc = [dataBaseClass openDataBase ];
    BOOL tableCreateSuc = NO;
    BOOL dataInsertTableSuc = NO;
    if(dataBaseSuc){
        //建立News1表
        //NSString *createTabelSql = @"create table if not exists News(flag integer not null primary key autoincrement, title text not null,click integer not null,image blob not null)";
        //建立News2表
        NSString *createTabelSql = @"create table if not exists News2(flag integer not null primary key autoincrement, title2 text not null,click2 integer not null,image2 blob not null)";
        tableCreateSuc = [dataBaseClass createTable:createTabelSql];
    }
    if(tableCreateSuc){
       // NSLog(@"成功");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
