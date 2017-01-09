//
//  centerButtonGroupViewController.m
//  Liankeji
//
//  Created by mac on 2017/1/9.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "centerButtonGroupViewController.h"
#import "ZHQScrollMenu.h"
#import "appCommonAttributes.h"
#import "cityPickerView.h"


@interface centerButtonGroupViewController ()<cityPickerDelegate>//地点选择器
@end

@implementation centerButtonGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self addReturnButton];
    [self AddButtonGroup];
    // Do any additional setup after loading the view.
}
//添加返回按钮
- (void)addReturnButton{
    UIButton *returnButton = [UIButton buttonWithType:UIButtonTypeCustom];
    returnButton.frame = CGRectMake(5, STATUSBAR_HEIGHT, 80, 40);
    //returnButton.backgroundColor = [UIColor greenColor];
    [returnButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [returnButton setTitle:@"返回" forState:UIControlStateNormal];
    [returnButton addTarget:self action:@selector(returnButtonHandler:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:returnButton];
}
- (void)returnButtonHandler:(UIButton*)_b{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//添加上部按钮组
- (void)AddButtonGroup{
    NSArray *titleArr = @[@"地区",@"时间",@"方向",@"其他"];
    ZHQScrollMenu *categoryButtonGroup = [[ZHQScrollMenu alloc]initWithFrame:CGRectMake(0, STATUSBAR_HEIGHT + 40, self.view.frame.size.width, 40)];
    [self.view addSubview:categoryButtonGroup];
    categoryButtonGroup.lineView.hidden = YES;
    categoryButtonGroup.norMalTitleColor = [UIColor grayColor];
    categoryButtonGroup.changeTitleColor = [UIColor grayColor];
    for(NSInteger i = 0 ; i < titleArr.count; i ++){
        UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
        //but.backgroundColor = [UIColor blueColor];
        [but setTitle:titleArr[i] forState:UIControlStateNormal];
        [categoryButtonGroup addButton:but];
        but.tag = i;
        [but addTarget:self action:@selector(buttHandler:) forControlEvents:UIControlEventTouchUpInside];
    }
}
//点击
- (void)buttHandler:(UIButton*)_b{
    switch (_b.tag) {
        case 0:
            NSLog(@"点击地区按钮");
            [self displayAddressPickerView];
            break;
        case 1:
            
            break;
        case 2:
            
            break;
        case 3:
            
            break;
        default:
            break;
    }
}
//弹出地点选择器
- (void)displayAddressPickerView{
    cityPickerView *cityPicker = [[cityPickerView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    cityPicker.ownCityDelegate = self;
    [self.view addSubview:cityPicker];
    
}
//点击完成的代理方法
-(void)getCityInformation:(NSString *)_province city:(NSString *)_city area:(NSString *)_area{
    NSLog(@"你选择的地区为%@,%@,%@",_province,_city,_area);

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
