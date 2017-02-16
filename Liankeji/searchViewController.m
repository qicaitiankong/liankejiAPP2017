//
//  searchViewController.m
//  Liankeji
//
//  Created by mac on 2017/1/19.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "searchViewController.h"
#import "returnViewForSearchViewController.h"
#import "appCommonAttributes.h"
#import "searchFirstPageCollectionViewCell.h"
//
#define LEFT_TABLE_TAG 10
#define SEARCH_TABLE_TAG 11
//
@interface searchViewController ()<searchHistoryDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource>{
    returnViewForSearchViewController *returnView;
    
    UITableView *leftTableview;
    
    UITableView *searchHistoryTableView;
    
    UICollectionView *rightCollectionView;
    
    UIImage *imageTest;
    
    NSArray *leftTitleArr;
    
    NSMutableArray *searchHistoryArr;
    
}

@end

@implementation searchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    imageTest = [UIImage imageNamed:@"a1"];
    leftTitleArr = @[@"技术",@"项目",@"需求",@"资金",@"设备",@"更多"];
    searchHistoryArr = [[NSMutableArray alloc]initWithCapacity:5];
    [self addReturnView];
    [self initTableview];
    [self initCollectionView];
    [self initHistoryTable];
    // Do any additional setup after loading the view.
}
//添加上部返回view
- (void)addReturnView{
    returnView= [[returnViewForSearchViewController alloc]initWithFrame:CGRectMake(0, STATUSBAR_HEIGHT, self.view.frame.size.width, NAVIGATION_HEIGHT)];
    returnView.targetDelegate = self;
    [self.view addSubview:returnView];
    [returnView.returnButt addTarget:self action:@selector(returnHandler:) forControlEvents:UIControlEventTouchUpInside];
}
//点击返回按钮
- (void)returnHandler:(UIButton*)_b{
    [self dismissViewControllerAnimated:YES completion:nil];
}
//展现历史记录
-(void)setSearchHistoryView{
    if(searchHistoryArr.count > 0 ){
        searchHistoryTableView.alpha = 1;
        [searchHistoryTableView reloadData];
    }
}
//点击了键盘搜索按钮
-(void)clickSearch:(UITextField *)textField{
    if([textField.text isEqualToString:@""]){
        return;
    }
    NSString *searchStr = textField.text;
    [searchHistoryArr addObject:searchStr];
    
}

//历史记录表
- (void)initHistoryTable{
    searchHistoryTableView = [[UITableView alloc]initWithFrame:CGRectMake(returnView.searchField.frame.origin.x, returnView.frame.origin.y + returnView.frame.size.height, returnView.searchField.frame.size.width, 300) style:UITableViewStylePlain];
    searchHistoryTableView.delegate =self;
    searchHistoryTableView.dataSource = self;
    searchHistoryTableView.tag = SEARCH_TABLE_TAG;
    searchHistoryTableView.alpha = 0;
    [self.view addSubview:searchHistoryTableView];
}

//
//左边表示图
- (void)initTableview{
    leftTableview = [[UITableView alloc]initWithFrame:CGRectMake(0,returnView.frame.origin.y + returnView.frame.size.height, self.view.frame.size.width * 0.3, self.view.frame.size.height - returnView.frame.origin.y - returnView.frame.size.height) style:UITableViewStylePlain];
    leftTableview.tag = LEFT_TABLE_TAG;
    leftTableview.delegate = self;
    leftTableview.dataSource = self;
    [self.view addSubview:leftTableview];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger count = 0;
    if(tableView.tag == LEFT_TABLE_TAG){
        count = leftTitleArr.count;
    }else{
        count = searchHistoryArr.count;
    }
    return count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    if(tableView.tag == LEFT_TABLE_TAG){
       cell = [tableView dequeueReusableCellWithIdentifier:@"findFirstPageLeftCell"];
        if(nil == cell){
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"findFirstPageLeftCell"];
        }
        cell.textLabel.text = leftTitleArr[indexPath.row];
    }else{
        cell = [tableView dequeueReusableCellWithIdentifier:@"searchHistoryCell"];
        if(nil == cell){
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"searchHistoryCell"];
        }
        NSLog(@"历史记录: %@",searchHistoryArr[indexPath.row]);
        cell.textLabel.text = searchHistoryArr[indexPath.row];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            imageTest = [UIImage imageNamed:@"a1"];
            [rightCollectionView reloadData];
            break;
        case 1:
            imageTest = [UIImage imageNamed:@"a2.jpg"];
            [rightCollectionView reloadData];
            break;
        case 2:
            imageTest = [UIImage imageNamed:@"a1"];
            [rightCollectionView reloadData];
            break;
        case 3:
            imageTest = [UIImage imageNamed:@"a2.jpg"];
            [rightCollectionView reloadData];
            break;
        case 4:
            imageTest = [UIImage imageNamed:@"a1"];
            [rightCollectionView reloadData];
            break;
        case 5:
            imageTest = [UIImage imageNamed:@"a2.jpg"];
            [rightCollectionView reloadData];
        default:
            break;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = nil;
    if(tableView.tag == SEARCH_TABLE_TAG){
        UILabel *searchHeaderView = [[UILabel alloc]initWithFrame:CGRectMake(0, -50, tableView.frame.size.width, 50)];
        searchHeaderView.text = @"搜索记录";
        searchHeaderView.textAlignment = NSTextAlignmentCenter;
        headerView = searchHeaderView;
    }
    return headerView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    CGFloat height = 0;
    //622700000011979
    if(tableView.tag == SEARCH_TABLE_TAG){
        height = 50;
    }
    return height;
}



//右边流式布局
- (void)initCollectionView{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(60, 60);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    rightCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(leftTableview.frame.origin.x + leftTableview.frame.size.width,returnView.frame.origin.y + returnView.frame.size.height,self.view.frame.size.width - leftTableview.frame.origin.x - leftTableview.frame.size.width, leftTableview.frame.size.height) collectionViewLayout:layout];
    rightCollectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:rightCollectionView];
    [rightCollectionView registerClass:[searchFirstPageCollectionViewCell class] forCellWithReuseIdentifier:@"collectionViewCell"];
    rightCollectionView.delegate = self;
    rightCollectionView.dataSource = self;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 5;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 8;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    searchFirstPageCollectionViewCell *collectionCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionViewCell" forIndexPath:indexPath];
    collectionCell.testImageView.image = imageTest;
    return collectionCell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"你点击了搜索页面的collectionCell section=%li,row=%li",indexPath.section,indexPath.row);
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
