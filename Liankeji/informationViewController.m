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


//滚动按钮标签基数
#define SCROLLVIEW_BUTTON_TAG 100


@interface informationViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>{
    //左右滑动按钮组
    ZHQScrollMenu* scrollViewMenu;
    //当前选择的按钮
    UIButton *scrollViewSelectButton;
    //前一个点击按钮的索引
    NSInteger perfomerButtonIndex;
    //下一个表视图
    inforMationTableView *ownNextTableView;
    //当前表视图
    inforMationTableView *ownCurrentTableView;
    //添加盛放tableView的滑动的scrollView
    UIScrollView *ownTableScrollView;
    
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
    [self addLeftAndRightScrollView];
    
    // Do any additional setup after loading the view.
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
    scrollViewMenu = [[ZHQScrollMenu alloc]initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height + [UIApplication sharedApplication].statusBarFrame.size.height, self.view.frame.size.width, 60)];
    scrollViewMenu.norMalTitleColor = RGBA(87, 87, 86, 1);
    scrollViewMenu.changeTitleColor = RGBA(35, 119, 212, 1);
    scrollViewMenu.lineColor = RGBA(35, 119,212, 1);
    [self.view addSubview:scrollViewMenu];
    
    buttonTitles = [NSArray arrayWithObjects:@"新闻",@"热门",@"科技",@"技术",@"前沿",@"最新", nil];
    for(NSInteger index = 0; index < buttonTitles.count; index ++){
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:buttonTitles[index] forState:UIControlStateNormal];
        button.tag = SCROLLVIEW_BUTTON_TAG + index;
        button.titleLabel.font = [UIFont systemFontOfSize:14];
       [button addTarget:self action:@selector(buttonHandler:) forControlEvents:UIControlEventTouchUpInside];
        if(button.tag == SCROLLVIEW_BUTTON_TAG){
            scrollViewSelectButton = button;
        }
        [scrollViewMenu addButton:button];
    }
}
//添加左右滑动切换页面的scrollView
- (void)addLeftAndRightScrollView{
    ownTableScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, NAVIGATION_HEIGHT + STATUSBAR_HEIGHT + scrollViewMenu.bounds.size.height, SCREEN_WIDTH, SCREEN_HEIGHT - STATUSBAR_HEIGHT - NAVIGATION_HEIGHT - scrollViewMenu.bounds.size.height)];
    
    ownTableScrollView.delegate = self;
    
    ownTableScrollView.contentSize = CGSizeMake(SCREEN_WIDTH *buttonTitles.count, ownTableScrollView.bounds.size.height);
    
    for(int i = 0; i < buttonTitles.count; i ++){
        
        inforMationTableView *ownTableView = [[inforMationTableView alloc]initWithFrame:CGRectMake(i * SCREEN_WIDTH, 0, SCREEN_WIDTH, ownTableScrollView.bounds.size.height) style:UITableViewStylePlain];
        ownTableView.dataSource = self;
        ownTableView.delegate = self;
        ownTableView.tag = i;
        [ownTableView reloadData];
        [ownTableScrollView addSubview:ownTableView];
        
    }
    ownTableScrollView.pagingEnabled = YES;
    //ownTableScrollView.backgroundColor = [UIColor redColor];
    [self.view addSubview:ownTableScrollView];
}
//需要改进，因为当拖动结束时不能准确计算X偏移量
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    //利用常用算法计算page
    CGFloat pageWidth = ownTableScrollView.bounds.size.width;
    int page = floor((ownTableScrollView.contentOffset.x - pageWidth / 2)/pageWidth) + 1;
    
    //NSLog(@"page=%d",page);
    //NSLog(@"%lf,%lf",scrollView.contentOffset.x,SCREEN_WIDTH);
    
    // NSInteger X = scrollView.contentOffset.x / SCREEN_WIDTH;
    
    UIButton *button = [scrollViewMenu viewWithTag:SCROLLVIEW_BUTTON_TAG + page];
    [scrollViewMenu selected:button];
   //NSLog(@"title=%@",button.titleLabel.text);
    
    
    //NSLog(@"结束拖动=%ld",X);
}
//按钮组点击事件
- (void)buttonHandler:(UIButton*)_b{
    if(scrollViewSelectButton != _b){
        
        
        [scrollViewMenu selected:_b];
        
        [UIView animateWithDuration:0.2 animations:^{
             ownTableScrollView.contentOffset = CGPointMake((_b.tag - SCROLLVIEW_BUTTON_TAG) * ownTableScrollView.bounds.size.width, 0);
        }];
         NSLog(@"点击按钮%li",_b.tag);
        
        //重新加载新闻
    }
    scrollViewSelectButton = _b;
   
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
    cell.firstLable.text = @"2016年科技发展";
    cell.secondLable.text = @"科技";
    cell.firstSmallNumberString = @"7000";
    cell.secondSmallNumberString = @"8000";
    cell.thirdSmallNumberString = @"5000";
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
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
