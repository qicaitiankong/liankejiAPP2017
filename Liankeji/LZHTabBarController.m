//
//  LZHTabBarController.m
//  UITabBarTest
//
//  Created by 李自豪 on 16/12/22.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "LZHTabBarController.h"
#import "NavViewControllerForFirstPage.h"

@interface LZHTabBarController ()<UITabBarControllerDelegate,UINavigationControllerDelegate,LZHTabBarDelegate>
/** 保存所有控制器对应按钮的内容（UITabBarItem）*/

@property (strong,nonatomic)NSMutableArray *items;

@property (assign,nonatomic)NSInteger lastSelectIndex;

@property (strong,nonatomic)id popDelegate;

@property (strong,nonatomic) announceViewController *vc3;

@end
static LZHTabBarController * shareTabBar = nil;
@implementation LZHTabBarController


+(LZHTabBarController*)shareLZHTabbarController{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        shareTabBar = [[LZHTabBarController alloc]init];
    });
    return shareTabBar;
}

+(void)initialize{
    //设置普通文字
    NSMutableDictionary *textDict = [NSMutableDictionary dictionary];
    textDict[NSForegroundColorAttributeName] = [UIColor colorWithRed:113 / 255 green:103 / 255 blue:104 / 255 alpha:1];
    textDict[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    //设置选中的颜色
    NSMutableDictionary *selectTextDict = [NSMutableDictionary dictionary];
    selectTextDict[NSForegroundColorAttributeName] = [UIColor blackColor];
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:textDict forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectTextDict forState:UIControlStateSelected];
    
}
- (NSMutableArray*)items{
    if(_items == nil){
        _items = [NSMutableArray array];
    }
    return _items;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    [self addSubChildVC];
    [self setOwnTabBar];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //self.tabBar.hidden = YES;
    //把系统的tabBar按钮干掉
    [self.tabBar removeFromSuperview];
    for(UIView *childView in self.tabBar.subviews){
        if(![childView isMemberOfClass:[LZHTabBar class]]){
//          childView.hidden = YES;
//          childView.userInteractionEnabled = NO;
            [childView removeFromSuperview];
        }
    }
}
//添加自定义tabBar
- (void)setOwnTabBar{
   self.myTabBar = [[LZHTabBar alloc]initWithFrame:self.tabBar.frame];
    self.myTabBar.items = self.items;
   self.myTabBar.delegate = self;
    //tabBar.frame = self.tabBar.frame;
    [self.view addSubview:self.myTabBar];
}
//添加所有的子控制器
- (void)addSubChildVC{
    
    //添加所有的子控制器
    FirstPageViewController *vc1 = [[FirstPageViewController alloc]init];
    [self addOneChildVC:vc1 title:@"首页" imageName:@"icon_shouye_weidianji@3x"selectedImageName:@"icon_shouye_dianji@3x"];
    
    informationViewController *vc2 = [[informationViewController alloc]init];
    [self addOneChildVC:vc2 title:@"资讯" imageName:@"icon_zixun_weidianji" selectedImageName:@"icon_zixun_dianji"];
    
    self.vc3 = [[announceViewController alloc]init];
    [self addOneChildVC:self.vc3 title:@"发布" imageName:@"icon_fabu@3x" selectedImageName:@"icon_fabu@3x"];
    
    CommunicateFirstViewController *vc4 = [[CommunicateFirstViewController alloc]init];
    [self addOneChildVC:vc4 title:@"发现" imageName:@"icon_shequ_weidianji@3x" selectedImageName:@"icon_shequ_dianji@3x"];
    
    personalFirstPageViewController *vc5 = [[personalFirstPageViewController alloc]init];
    [self addOneChildVC:vc5 title:@"我的" imageName:@"icon_wode_weidianji@3x" selectedImageName:@"icon_wode_dianji@3x"];
}

-(void)addOneChildVC:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName {
    childVc.tabBarItem.title = title;
    UIImage *image = [UIImage imageNamed:imageName];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.image = image;
    UIImage *selectImage = [UIImage imageNamed:selectedImageName];
    selectImage = [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = selectImage;
    //添加所有控制器对应的按钮的内容
    [self.items addObject:childVc.tabBarItem];
    //中间大按钮不加入导航栏
    if([childVc isMemberOfClass:[announceViewController class]]){
        [self addChildViewController:childVc];
        
    }else{
        NavViewControllerForFirstPage *nav = [[NavViewControllerForFirstPage alloc]initWithRootViewController:childVc];
        nav.delegate = self;
        [self addChildViewController:nav];
    }
}
//tabBar按钮点击
- (void)tabBar:(LZHTabBar*)tabBar didClickBtn:(NSInteger)index{
    // NSLog(@"点击的tabBar下部索引%li",index);
    if(index == 2){
        self.vc3.isExchangeFromeOut = YES;
    }
    [super setSelectedIndex:index];
}

//让tabBar选中对应的按钮
-(void)setSelectedIndex:(NSUInteger)selectedIndex{
    // 通过mytabbar的通知处理页面切换
    self.myTabBar.selectIndex = selectedIndex;
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
