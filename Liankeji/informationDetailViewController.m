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
#import "userWriteCommentView.h"
#import "cellFootView.h"


@interface informationDetailViewController ()<UITableViewDelegate,UITableViewDataSource,announceButtonClickDelegate,UITextViewDelegate>{
    firstOwnCellView *firstView ;
    UITableView *ownTableView;
    UIView *ownHeaderView;
    commentView *ownCommentView;
    userWriteCommentView *writeView;
    
    NSMutableArray *testCommentArr;
}

@end

@implementation informationDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    testCommentArr = [[NSMutableArray alloc]initWithObjects:@"的是的范德萨发大幅度发的凤飞飞",@"据中央气象台网站消息，预计6日至8日白天，华北中南部等地霾天气仍将持续。8日夜间受冷空气影响，上述地区霾天气将自北向南减弱消散。昨天至今晨，湖北东部、安徽中南部、江苏南部、江西北部、浙江中北部、上海等地出现中雨，部分地区出现大", nil];
    [self addFirstView];
    [self addReturnButton];
    [self initOwnTableView];
    [self addCommentView];
        // Do any additional setup after loading the view.
}
//添加最上面的view
-(void)addFirstView{
    firstView = [[firstOwnCellView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300) titleString:@"链科技正在打造全国新的技术交流对接链科技正在打造全国新的技术交流对接"];
    //v1.ownFirstTitleLable.text = @"链科技正在打造全国新的技术交流对接平台其实对的啊天空色彩2017大雪将至";
    firstView.ownAuthorLable.text = @"作者：陈教授";
    [self.view addSubview:firstView];
}
//添加返回按钮
- (void)addReturnButton{
    UIButton *returnButton = [UIButton buttonWithType:UIButtonTypeCustom];
    returnButton.frame = CGRectMake(5, STATUSBAR_HEIGHT, 80, 40);
    returnButton.titleLabel.textColor = [UIColor whiteColor];
    [returnButton setTitle:@"返回" forState:UIControlStateNormal];
    [returnButton addTarget:self action:@selector(returnButtonHandler:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:returnButton];
}


//添加headerView组头
- (UIView*)addHeaderView{
    //为组头的第二个view中的两个LABLE预测高度
    NSString *mainTitleString = @"韩称将推进“萨德”部署 中方：不利和平须停止";
    UILabel *mainLable = [[UILabel alloc]init];
    mainLable.textAlignment = NSTextAlignmentLeft;
    mainLable.font = [UIFont systemFontOfSize:24];
    NSString *detailContentString = @"央视新闻客户端1月4日消息，在“萨德”反导系统入韩问题上，韩国防部今天（4号）在工作汇报中称，“萨德”是韩方针对朝鲜威胁而采取的应对措施，绝无政治考量。韩方将依照日程正常推进“萨德”系统部署工作。韩国防部还称，将继续向中国政府介绍韩方立场。此前，中方曾多次表示，“萨德”反导系统覆盖范围远远超出半岛防卫需求，深入亚洲大陆腹地，严重损害包括中国在内的本地区有关国家战略安全利益，不利于维护朝鲜半岛的和平与稳定。希望有关国家正视中方合理关切，停止有关部署进程。";
    
    UILabel *detailLable = [[UILabel alloc]init];
    detailLable.textAlignment = NSTextAlignmentLeft;
    detailLable.font = [UIFont systemFontOfSize:16];
    
    
    GetCellHeight *calculaieLableHeight = [GetCellHeight ShareCellHeight];
    CGFloat mainTitleLableHeigh =  [calculaieLableHeight cellHeight:mainLable content:mainTitleString Cellwidth:self.view.frame.size.width - 2 * 5];
    
    CGFloat detailTitleLableHeigh =  [calculaieLableHeight cellHeight:detailLable content:detailContentString Cellwidth:self.view.frame.size.width - 2 * 5];

    NSLog(@"2018 :%lf,%lf",mainTitleLableHeigh,detailTitleLableHeigh);
    
    CGFloat headerView2Height =  mainTitleLableHeigh + detailTitleLableHeigh + 40;
    
    ownHeaderViewForCell *view1 = [[ownHeaderViewForCell alloc]initWithFrame:CGRectMake(0,-(200 + headerView2Height + 150), self.view.frame.size.width, 200 + headerView2Height + 150) headerView2Height:headerView2Height mainTitleLabHeight:mainTitleLableHeigh detailLableHeight:detailTitleLableHeigh clickDelegate:self];
    
    //给headerView1传值
    [view1.userImageView setImage:[UIImage imageNamed:@"infoSecondPageUserImage"]];
    view1.userNameLable.text = @"罗主席";
    [view1.readImageView setImage:[UIImage imageNamed:@"infoSecondPageReadNumber"]];
    view1.readLable.text = @"已有12345人阅读";
    view1.introduceLable.text = @"罗主席，蝴蝶结和我家的机会我决定和我家大家看完请记得看文件等待即可为加快";
    [view1.introduceLable sizeToFit];
    
    [view1.attentionButton setImage:[UIImage imageNamed:@"infoSecondPageGiveAttention"] forState:UIControlStateNormal];
    [view1.attentionButton addTarget:self action:@selector(attentionButtonClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    //给headerView2传值
    view1.mainTitleLable.text = mainTitleString;
    view1.detailContentLable.text = detailContentString;
    [ownTextSpace setTextSpace:detailContentString targetLable:view1.detailContentLable textSpace:8];
    return view1;
}
//创建表视图
- (void)initOwnTableView{
     ownTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, firstView.frame.size.height, self.view.frame.size.width, SCREEN_HEIGHT - firstView.frame.origin.y - firstView.frame.size.height - 60) style:UITableViewStyleGrouped];
    [self.view addSubview:ownTableView];
    ownTableView.delegate = self;
    ownTableView.dataSource = self;
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    UILabel *testLabel = [[UILabel alloc]init];
    testLabel.font = [UIFont systemFontOfSize:15];
    GetCellHeight *getHeight = [GetCellHeight ShareCellHeight];
    CGFloat labelHeight = [getHeight cellHeight:testLabel content:testCommentArr[indexPath.row] Cellwidth:ownTableView.frame.size.width - 75];
    NSLog(@"评论中的高度%lf",labelHeight);
    return 76 + labelHeight;
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
    [cell.commentLable sizeToFit];
    cell.givePraiseLable.text = @"123";
    [cell.givePraiseButton addTarget:self action:@selector(praiseHandler:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
      NSLog(@"返回HEADER");
    ownHeaderView = [self addHeaderView];
    return ownHeaderView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    UIView *views = [self addHeaderView];
    NSLog(@"设置高度header %lf",views.frame.size.height);
    return views.frame.size.height;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footView = [[cellFootView alloc]initWithFrame:CGRectMake(0, tableView.frame.size.height, tableView.frame.size.width, 60)];
    return footView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 60;
}

//添加下部评论的view
- (void) addCommentView{
    UIWindow *window = APP_MAIN_WINDOW;
    ownCommentView = [[commentView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 60, SCREEN_WIDTH, 60)];
    [ownCommentView.transParentButt addTarget:self action:@selector(commentHandler:) forControlEvents:UIControlEventTouchUpInside];
    [ownCommentView.givePraiseButton addTarget:self action:@selector(rewardHandler:) forControlEvents:UIControlEventTouchUpInside];
    [window addSubview:ownCommentView];
    
}

//点击返回按钮
- (void)returnButtonHandler:(UIButton*)_b{
    //先处理窗口上的界面
    [ownCommentView removeFromSuperview];
    [writeView removeFromSuperview];
    [writeView.textView resignFirstResponder];
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
//点赞
- (void)praiseHandler:(UIButton*)_b{
    [_b setImage:[UIImage imageNamed:@"infoSecondPageGivedClick"] forState:UIControlStateNormal];
    

    NSLog(@"点赞");
}
//点击评论区创建编辑界面
- (void)commentHandler:(UIButton*)_b{
    UIWindow *window = APP_MAIN_WINDOW;
    writeView = [[userWriteCommentView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 200 - 400, SCREEN_WIDTH, 200)];
     [writeView.cancelButton addTarget:self action:@selector(cancelButtonHandler:) forControlEvents:UIControlEventTouchUpInside];
    [writeView.sendButton addTarget:self action:@selector(sendButtonHandler:) forControlEvents:UIControlEventTouchUpInside];
    [window addSubview:writeView];
    
    ownTableView.userInteractionEnabled = NO;
}

//取消评论编辑
- (void)cancelButtonHandler:(UIButton*)_b{
    [writeView.textView resignFirstResponder];
    //避免用户误操作
    _b.userInteractionEnabled = NO;
    writeView.sendButton.userInteractionEnabled = NO;
    ownTableView.userInteractionEnabled = YES;
    [writeView removeFromSuperview];
    
}
//发送评论
- (void)sendButtonHandler:(UIButton*)_b{
    [writeView.textView resignFirstResponder];
    //避免用户误操作
    _b.userInteractionEnabled = NO;
    writeView.sendButton.userInteractionEnabled = NO;
    ownTableView.userInteractionEnabled = YES;
    [writeView removeFromSuperview];
}

//打赏按钮
- (void)rewardHandler:(UIButton*)_b{
    NSLog(@"打赏");
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
