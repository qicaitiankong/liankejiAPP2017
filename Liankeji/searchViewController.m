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
#import "ShareDataBase.h"
//
@interface searchViewController ()<searchHistoryReturnViewDelegate,searchHistoryTableViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource>{
    returnViewForSearchViewController *returnView;
    
    UITableView *leftTableview;
    
    searchHistoryTableView *searchHistoryTabView;
    
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
    if(searchHistoryArr.count > 0){
        searchHistoryTabView = [[searchHistoryTableView alloc]initWithFrame:CGRectMake(returnView.searchField.frame.origin.x, returnView.frame.origin.y + returnView.frame.size.height, returnView.searchField.frame.size.width, (searchHistoryArr.count + 2) * SCREEN_HEIGHT * 0.04) style:UITableViewStyleGrouped];
        searchHistoryTabView.targetDelegate = self;
        searchHistoryTabView.contentArr = searchHistoryArr;
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
    [searchHistoryArr addObject:searchStr];
    //向本地数据库中写入
    ShareDataBase *dataBase = [ShareDataBase shareDataBase];
    BOOL isEqual = NO;
    if([dataBase openDataBase]){
        FMResultSet *result =  [dataBase searchTable:@"select * from SearchHistoryTable" searchValues:nil error:nil];
        NSInteger index = 0;
        while (result.next) {
            index ++;
          NSString *content = [result objectForColumnName:@"content"];
            if([searchStr isEqualToString:content]){
                isEqual = YES;
                break;
            }
        }
        if(index < 5 && isEqual == NO){//插入
            NSNumber *indexid = [NSNumber numberWithInteger:index];
           BOOL insertSuc = [dataBase insertDataIntoTable:@"insert into SearchHistoryTable(indexid,content) values('%li','%s')" insertDataArray:@[indexid,searchStr] error:nil];
            if(insertSuc){
                NSLog(@"插入成功");
            }else{
                NSLog(@"插入失败");
            }
        }else{
           // [dataBase updateDataBase:@"update SearchHistoryTable set content = %s where indexid = %li" updateContentArray:@[] error:nil];
        }
    }
    

    [searchHistoryTabView removeFromSuperview];
}

//历史记录表的代理方法
//点击了历史记录某一条
-(void)setHistoryContentGiveTextField:(NSString *)contentStr{
    returnView.searchField.text = contentStr;
    NSLog(@"点击的记录:%@",contentStr);
    [searchHistoryTabView removeFromSuperview];
}
//清除所有记录
-(void)deleteAllHistoryContent{
    NSLog(@"清除所有记录");
    //将本地数据库中的内容删除
    [searchHistoryArr removeAllObjects];
    
    NSLog(@"历史记录数组：%@",searchHistoryTabView.contentArr);
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
       cell = [tableView dequeueReusableCellWithIdentifier:@"findFirstPageLeftCell"];
        if(nil == cell){
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"findFirstPageLeftCell"];
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
