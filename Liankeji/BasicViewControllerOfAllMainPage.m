//
//  BasicViewControllerOfAllMainPage.m
//  Liankeji
//
//  Created by mac on 2017/2/16.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "BasicViewControllerOfAllMainPage.h"
#import "searchViewController.h"
#import "lzhDealNavigationColor.h"
#import "lzhdownMenuView.h"

@interface BasicViewControllerOfAllMainPage ()<pullDownMenuDelegate>
@property (strong,nonatomic)lzhDealNavigationColor* dealNavigationColor;
//侧拉菜单
@property (strong,nonatomic) lzhdownMenuView *sideMenuView;
@end

@implementation BasicViewControllerOfAllMainPage

- (void)viewDidLoad {
    [super viewDidLoad];
     self.navigationItem.title = @"链科技ChinaTech";
    UIColor *titleColor = NAVIGATION_TITLE_COLOR;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:titleColor}];
    [self setNavigationButton];
    
    // Do any additional setup after loading the view.
}

//导航栏右侧搜索按钮
- (void)rightSearchHandler:(UIBarButtonItem*)_u{
    searchViewController *searchVC = [[searchViewController alloc]init];
    [self presentViewController:searchVC animated:YES completion:^{
   }];
}
//处理滑动导航栏的渐变
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.dealNavigationColor dealNavigationColor:scrollView navigation:self.navigationController];
}
//设置导航栏的按钮及初始化渐变对象
- (void)setNavigationButton{
    self.dealNavigationColor = [lzhDealNavigationColor setNavigationControlerrTransparent:self.navigationController];
    //导航栏左按钮点击事件
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav1"] style:UIBarButtonItemStyleDone target:self action:@selector(leftNavBarHandler:)];
    //导航栏右按钮点击事件
    UIImage *searchImage = [UIImage imageNamed:@"nav2"];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:searchImage style:UIBarButtonItemStyleDone target:self action:@selector(rightSearchHandler:)];
}
//点击左侧navgabar弹出菜单
- (void)leftNavBarHandler:(UIBarButtonItem*)_u{
    if(self.sideMenuView== nil || self.sideMenuView.isOut == NO){
        [self createSideMenu];
        [self.sideMenuView popAnimation:!self.sideMenuView.isOut];
    }
    
   
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
