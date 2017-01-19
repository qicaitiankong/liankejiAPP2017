//
//  CommunicateFirstViewController.m
//  Liankeji
//
//  Created by 李自豪 on 16/12/15.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "CommunicateFirstViewController.h"
#import <Hyphenate_CN/EMSDKFull.h>
#import <EaseUI.h>
#import "appCommonAttributes.h"
#import "findFirstPageCollectionViewCell.h"

@interface CommunicateFirstViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>{
    UITableView *leftTableview;
    UICollectionView *rightCollectionView;
    
    UIImage *imageTest;
}

@end

@implementation CommunicateFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(246, 246, 246, 1);
    imageTest = [UIImage imageNamed:@"a1"];
    [self setNavigationButton];
    [self initTableview];
    [self initCollectionView];
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
//左边表示图
- (void)initTableview{
    leftTableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width * 0.3, self.view.frame.size.height) style:UITableViewStylePlain];
    leftTableview.delegate = self;
    leftTableview.dataSource = self;
    [self.view addSubview:leftTableview];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"findFirstPageLeftCell"];
    if(nil == cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"findFirstPageLeftCell"];
    }
    cell.textLabel.text = @"项目技术";
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
    rightCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(leftTableview.frame.origin.x + leftTableview.frame.size.width,STATUSBAR_HEIGHT + NAVIGATION_HEIGHT,self.view.frame.size.width - leftTableview.frame.origin.x - leftTableview.frame.size.width, self.view.frame.size.height) collectionViewLayout:layout];
    rightCollectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:rightCollectionView];
     [rightCollectionView registerClass:[findFirstPageCollectionViewCell class] forCellWithReuseIdentifier:@"collectionViewCell"];
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
    findFirstPageCollectionViewCell *collectionCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionViewCell" forIndexPath:indexPath];
    collectionCell.testImageView.image = imageTest;
    return collectionCell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"你点击了发现页面的collectionCell section=%li,row=%li",indexPath.section,indexPath.row);
}

- (void)communicatePage{
    //环信注册登录测试
    [[EMClient sharedClient]registerWithUsername:@"lzhlsh2017" password:@"123" completion:^(NSString *aUsername, EMError *aError) {
        if(!aError){
            NSLog(@"注册成功");
        }else{
            NSLog(@"注册失败");
        }
    }];
    [[EMClient sharedClient]loginWithUsername:@"lzhlsh2017" password:@"123" completion:^(NSString *aUsername, EMError *aError) {
        if(!aError){
            NSLog(@"登录成功");
            EaseMessageViewController *messageVC = [[EaseMessageViewController  alloc]initWithConversationChatter:@"lsh" conversationType:EMConversationTypeChat];
            [self.navigationController pushViewController:messageVC animated:NO];
        }else{
            NSLog(@"登录失败");
        }
    }];

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
