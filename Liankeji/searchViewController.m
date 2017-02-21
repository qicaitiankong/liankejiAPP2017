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
#import "searchHistoryTableView.h"
#import "lzhOperationFile.h"
#import "ShareHomePath.h"
#import "rightCollectionViewHeaderView.h"
//
static NSString *tableViewCellIdentifier = @"lzhTableSearchCell";
static NSString *collectionHeaderViewIdentifier = @"CollectionHederview";
static NSString *collectionViewCellIdentifier = @"lzhCollectionViewCell";

//
@interface searchViewController ()<searchHistoryReturnViewDelegate,searchHistoryTableViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource>{
    returnViewForSearchViewController *returnView;
    //左边表式图
    UITableView *leftTableview;
    //搜索表式图
    searchHistoryTableView *searchHistoryTabView;
    //右边流式布局
    UICollectionView *rightCollectionView;
    //测试图片
    UIImage *imageTest;
    //左边表示图数据数组
    NSArray *leftTitleArr;
    //搜索历史数组
    NSMutableArray *searchHistoryArr;
    //自定义写入文件对象
    lzhOperationFile *operationFile;
    //历史记录文件路径
    NSString  *historyFilePath;
}

@end

@implementation searchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    operationFile = [lzhOperationFile operationFile];
    ShareHomePath *homePath = [ShareHomePath GetShareHome];
    historyFilePath = [[homePath getDocumentsPath]stringByAppendingPathComponent:@"searchHistoryFile"];
    NSLog(@"历史记录文件:%@",historyFilePath);
    imageTest = [UIImage imageNamed:@"a1"];
    leftTitleArr = @[@"技术",@"项目",@"需求",@"资金",@"设备",@"更多"];
    [self addReturnView];
    [self initTableview];
    [self initCollectionView];
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

//展现历史记录(代理)
-(void)displaySearchHistoryView{
        searchHistoryArr = [operationFile readFromFile:historyFilePath];
        //NSLog(@"外部读取数组：%@",searchHistoryArr);
        searchHistoryTabView = [[searchHistoryTableView alloc]initWithFrame:CGRectMake(returnView.searchField.frame.origin.x, returnView.frame.origin.y + returnView.frame.size.height, returnView.searchField.frame.size.width, (searchHistoryArr.count + 2) * SCREEN_HEIGHT * 0.04) style:UITableViewStyleGrouped];
        searchHistoryTabView.targetDelegate = self;
        searchHistoryArr =[operationFile readFromFile:historyFilePath];
        searchHistoryTabView.contentArr = searchHistoryArr;
        if(searchHistoryArr.count != 0){
            [self.view addSubview:searchHistoryTabView];
            [searchHistoryTabView reloadData];
        }
}

//点击了键盘搜索按钮（代理）
-(void)clickSearch:(UITextField *)textField{
    if([textField.text isEqualToString:@""]){
        return;
    }
    NSString *searchStr = textField.text;
    BOOL suc = [operationFile lzhWriteToFile:historyFilePath content:searchStr];
    if(suc){
        NSLog(@"写入陈功");
    }else{
        NSLog(@"内容相同或写入失败");
    }
    [searchHistoryTabView removeFromSuperview];
}

//历史记录表的代理方法点击了历史记录某一条
-(void)setHistoryContentGiveTextField:(NSString *)contentStr{
    returnView.searchField.text = contentStr;
    //NSLog(@"点击的记录:%@",contentStr);
    [searchHistoryTabView removeFromSuperview];
}
//清除所有记录
-(void)deleteAllHistoryContent{
    //NSLog(@"清除所有记录");
    //将本地文件中的内容删除
    BOOL suc = [operationFile clearAllContent:historyFilePath];
    [searchHistoryArr removeAllObjects];
    [searchHistoryTabView removeFromSuperview];
}

//
//左边表示图
- (void)initTableview{
    leftTableview = [[UITableView alloc]initWithFrame:CGRectMake(0,returnView.frame.origin.y + returnView.frame.size.height, self.view.frame.size.width * 0.3, self.view.frame.size.height - returnView.frame.origin.y - returnView.frame.size.height) style:UITableViewStylePlain];
    leftTableview.delegate = self;
    leftTableview.dataSource = self;
    [self.view addSubview:leftTableview];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger count = 0;
    count = leftTitleArr.count;
    return count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
       cell = [tableView dequeueReusableCellWithIdentifier:tableViewCellIdentifier];
        if(nil == cell){
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableViewCellIdentifier];
        }
        cell.textLabel.text = leftTitleArr[indexPath.row];
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

//右边流式布局
- (void)initCollectionView{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(60, 60);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    layout.headerReferenceSize = CGSizeMake(self.view.frame.size.width - leftTableview.frame.origin.x - leftTableview.frame.size.width, 30);
    
    rightCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(leftTableview.frame.origin.x + leftTableview.frame.size.width,returnView.frame.origin.y + returnView.frame.size.height,self.view.frame.size.width - leftTableview.frame.origin.x - leftTableview.frame.size.width, leftTableview.frame.size.height) collectionViewLayout:layout];
    rightCollectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:rightCollectionView];
    [rightCollectionView registerClass:[searchFirstPageCollectionViewCell class] forCellWithReuseIdentifier:collectionViewCellIdentifier];
    [rightCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:collectionHeaderViewIdentifier];
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
    searchFirstPageCollectionViewCell *collectionCell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionViewCellIdentifier forIndexPath:indexPath];
    collectionCell.testImageView.image = imageTest;
    return collectionCell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"你点击了搜索页面的collectionCell section=%li,row=%li",indexPath.section,indexPath.row);
}
//组头
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if([kind isEqualToString:UICollectionElementKindSectionHeader]){
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:collectionHeaderViewIdentifier forIndexPath:indexPath];
        rightCollectionViewHeaderView *header2 = [[rightCollectionViewHeaderView alloc]initWithFrame:CGRectMake(0, 0, headerView.frame.size.width, headerView.frame.size.height)];
        header2.lzhTitleLabel.text = @"技术";
        [headerView addSubview:header2];
        return headerView;
    }
    return nil;

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
