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
#import "ownTextSpace.h"
#import "commentView.h"
#import "userCommentParentView.h"
#import "cellFootView.h"
#import "exchangeView1.h"
#import "lzhReturnView.h"
#import "lzhGetCurrentTime.h"

@interface informationDetailViewController ()<UITableViewDelegate,UITableViewDataSource,announceButtonClickDelegate,UITextViewDelegate,owntouchDelegate>{
    //转场VIEW
    exchangeView1 *changeView1;
    //表视图(转场view2)
    UITableView *ownTableView;
    //组头
    UIView *ownHeaderView;
    //底部评论view
    commentView *ownCommentView;
    //评论编辑view
    userCommentParentView *writeView;
    //测试评论数组
    NSMutableArray *testCommentArr;
}

@end

@implementation informationDetailViewController
@synthesize returnView;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    testCommentArr = [[NSMutableArray alloc]initWithObjects:@"的是的范德萨发大幅度发的凤飞飞",@"据中央气象台网站消息，预计6日至8日白天，华北中南部等地霾天气仍将持续。8日夜间受冷空气影响，上述地区霾天气将自北向南减弱消散。昨天至今晨，湖北东部、安徽中南部、江苏南部、江西北部、浙江中北部、上海等地出现中雨，部分地区出现大", nil];
    [self addReturnButton];
    //添加底部评论
    [self addCommentView];
    //转场view2表视图
    [self initOwnTableView];
    //转场view1
    [self createExchangeview1];
        // Do any additional setup after loading the view.
}
//返回按钮
- (void)addReturnButton{
    [returnView.ownButt addTarget:self action:@selector(returnButtonHandler:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:returnView];
}

   //添加转场view1
- (void)createExchangeview1{
    changeView1 = [[exchangeView1 alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [changeView1.ownImageView setImage:[UIImage imageNamed:@"infotest01.jpeg"]];
    changeView1.ownDelegate = self;
    [self.view addSubview:changeView1];
}
//添加headerView组头
- (UIView*)addHeaderView{
    //为组头的第二个view中的两个LABLE预测高度
    NSString *mainTitleString = self.mainTitleForView3;
    UILabel *mainLable = [[UILabel alloc]init];
    mainLable.textAlignment = NSTextAlignmentLeft;
    mainLable.font = [UIFont systemFontOfSize:24];
    NSString *detailContentString = self.detaileForView3;
    UILabel *detailLable = [[UILabel alloc]init];
    detailLable.textAlignment = NSTextAlignmentLeft;
    detailLable.font = [UIFont systemFontOfSize:16];
    GetCellHeight *calculaieLableHeight = [GetCellHeight ShareCellHeight];
    CGFloat mainTitleLableHeigh =  [calculaieLableHeight cellHeight:mainLable content:mainTitleString Cellwidth:SCREEN_WIDTH * (1 - 0.023 * 2)];
    CGFloat detailTitleLableHeigh =  [calculaieLableHeight cellHeight:detailLable content:detailContentString Cellwidth:SCREEN_WIDTH * (1 - 0.023 * 2)];
    //NSLog(@"2018 :%lf,%lf",mainTitleLableHeigh,detailTitleLableHeigh);
    CGFloat headerView2Height =  mainTitleLableHeigh + detailTitleLableHeigh + SCREEN_HEIGHT * (0.023 + 0.049 + 0.044);
    CGFloat headerHeight = SCREEN_HEIGHT * (0.506 + 0.272)+ headerView2Height + SCREEN_HEIGHT * (0.239 + 0.07);
    ownHeaderViewForCell *view1 = [[ownHeaderViewForCell alloc]initWithFrame:CGRectMake(0,-headerHeight,self.view.frame.size.width,headerHeight) headerView2Height:headerView2Height mainTitleLabHeight:mainTitleLableHeigh detailLableHeight:detailTitleLableHeigh clickDelegate:self];
       //
    //给第一模块传值
    [view1.firstView0ImageView setImage:self.imageForView1];
    view1.firstView0TitleLabel.text = self.titleForView1;
    view1.firstView0AuthorLabel.text =self.authorForView1;
    //给第2模块传值
    [view1.userImageView setImage:self.photoImageForView2];
     view1.userNameLable .text = self.authorForView2;
    NSString *readStr2 = [[NSString alloc]initWithFormat:@"已有%@人阅读",self.readForView2];
     view1.readLable.text = readStr2;
     view1.introduceLable.text = self.introduceForView2;
    [view1.firstView0TitleLabel sizeToFit];
     //self.concernButtForView2 = view1.attentionButton;
    //给第3模块传值
    view1.mainTitleLable.text =self.mainTitleForView3;
    view1.detailContentLable.text = self.detaileForView3;
    [view1.attentionButton setImage:[UIImage imageNamed:@"infoSecondPageGiveAttention"] forState:UIControlStateNormal];
    [view1.attentionButton addTarget:self action:@selector(attentionButtonClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    //[ownTextSpace setTextSpace:self.detaileForView3 targetLable:view1.detailContentLable textSpace:3];
    [view1.detailContentLable sizeToFit];
    return view1;
}
//创建表视图
- (void)initOwnTableView{
     ownTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, returnView.frame.origin.y + returnView.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - returnView.frame.origin.y - returnView.frame.size.height - ownCommentView.frame.size.height) style:UITableViewStyleGrouped];
    [self.view addSubview:ownTableView];
    ownTableView.delegate = self;
    ownTableView.dataSource = self;
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return testCommentArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    UILabel *testLabel = [[UILabel alloc]init];
    testLabel.font = [UIFont systemFontOfSize:15];
    GetCellHeight *getHeight = [GetCellHeight ShareCellHeight];
     CGFloat labelHeight = [getHeight cellHeight:testLabel content:testCommentArr[indexPath.row] Cellwidth:SCREEN_WIDTH * (1- (0.013+0.16 + 0.029 + 0.006))];
    //NSLog(@"评论中的高度%lf",labelHeight);
    return (0.089 + 0.022) * SCREEN_HEIGHT + labelHeight + 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    informationSecondPgeTavCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:@"infoSecondPageCell"];
        
    if(nil == cell){
        cell = [[informationSecondPgeTavCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"infoSecondPageCell" tableView:tableView];
    }
    [cell.userImageView setImage:[UIImage imageNamed:@"infoSecondPageCommentUserImage"]];
    cell.userNameLable.text = @"往事随风";
    cell.timeLable.text = @"2017-1-5";
    cell.commentLable.text = testCommentArr[indexPath.row];
    cell.givePraiseLable.text = @"123";
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
     // NSLog(@"返回HEADER");
    ownHeaderView = [self addHeaderView];
    return ownHeaderView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    UIView *views = [self addHeaderView];
    //NSLog(@"设置高度header %lf",views.frame.size.height);
    return views.frame.size.height;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    cellFootView *footView = [[cellFootView alloc]initWithFrame:CGRectMake(0, tableView.frame.size.height, tableView.frame.size.width, SCREEN_HEIGHT * 0.08)];
    [footView.footButton addTarget:self action:@selector(footButtonHandler:) forControlEvents:UIControlEventTouchUpInside];
    return footView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return SCREEN_HEIGHT * 0.08;
}

//添加下部评论的view
- (void) addCommentView{
    UIWindow *window = APP_MAIN_WINDOW;
    ownCommentView = [[commentView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT * (1 - 0.077), SCREEN_WIDTH,SCREEN_HEIGHT * 0.077)];
    [ownCommentView.transParentButt addTarget:self action:@selector(commentHandler:) forControlEvents:UIControlEventTouchUpInside];
    [ownCommentView.givePraiseButton addTarget:self action:@selector(rewardHandler:) forControlEvents:UIControlEventTouchUpInside];
   [window addSubview:ownCommentView];
    //默认隐藏窗口上的评论view
    ownCommentView.hidden = YES;
    ownCommentView.userInteractionEnabled = NO;
    
}
//转场动画代理
-(void)exchangeViewHandler:(UIView *)firstView{
    [UIView transitionFromView:changeView1 toView:ownTableView duration:1.5 options:UIViewAnimationOptionTransitionFlipFromRight completion:^(BOOL finished){
        ownCommentView.hidden = NO;
        ownCommentView.userInteractionEnabled = YES;
    }];
}

//点击返回按钮
- (void)returnButtonHandler:(UIButton*)_b{
    [ownCommentView removeFromSuperview];
    if(self.targetDelegate){
        [self.targetDelegate updateCellContent:5 commentNum:testCommentArr.count giveMoneyNum:10 cellIndex:self.cellRowIndex];
    }
    [self dismissViewControllerAnimated:self completion:nil];
    
}
//点击关注按钮
- (void)attentionButtonClickHandler:(UIButton*)_b{
    NSLog(@"点击关注按钮");
}
//点击了分享组按钮
-(void)announceButtonClick:(NSInteger)index{
    NSLog(@"你再点击分享组按钮");
}
//点击评论区创建编辑界面
- (void)commentHandler:(UIButton*)_b{
    UIWindow *window = APP_MAIN_WINDOW;
    writeView = [[userCommentParentView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [writeView.commentView.sendButton addTarget:self action:@selector(sendButtonHandler:) forControlEvents:UIControlEventTouchUpInside];
    [window addSubview:writeView];
}

//点击了发送评论
- (void)sendButtonHandler:(UIButton*)_b{
    //将内容加到cell中
    ///
    NSString *commentStr =  [writeView.commentView.textView.text copy];
    if([commentStr isEqualToString:@""]){
        return;
    }
    NSString *currentTime = [lzhGetCurrentTime getCurrentTime];
    NSLog(@"测试时间:%@",currentTime);
    [testCommentArr addObject:commentStr];
    [ownTableView reloadData];
    [writeView.commentView.textView resignFirstResponder];
    [writeView removeFromSuperview];
}

//打赏按钮
- (void)rewardHandler:(UIButton*)_b{
    NSLog(@"打赏");
}
//更多评论按钮点击
- (void)footButtonHandler:(UIButton*)_b{
    
    NSLog(@"加载更多评论");
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
