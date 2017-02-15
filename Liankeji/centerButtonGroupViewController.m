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
#import "lzhReturnView.h"
#import "lzhPickerView.h"
#import "lzhShadeButton.h"

@interface centerButtonGroupViewController ()<cityPickerDelegate,categoryButtonClickDelegate,pickerCompannyDelegate>{
    //企业类型
    NSArray *categoryTitleArr ;
    //行业类型
    NSArray *jobArr;
    ZHQScrollMenu *categoryButtonGroup;
    //遮罩
    lzhShadeButton *shadowButt;
    //选择器
    lzhPickerView *pickerView;
    //当前点击的按钮标签
    NSInteger currentSelectButtTag;
}
@end

@implementation centerButtonGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    categoryTitleArr = @[@"个人独资",@"合伙企业",@"公司"];
    jobArr = @[@"软件",@"养殖",@"工业",@"制造业"];
    [self setReturnButton];
    [self AddButtonGroup];
    // Do any additional setup after loading the view.
}
//返回按钮
- (void)setReturnButton{
    [self.returnView.ownButt addTarget:self action:@selector(returnButtonHandler:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.returnView];
}
//返回按钮点击
- (void)returnButtonHandler:(UIButton*)_b{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//添加上部按钮组
- (void)AddButtonGroup{
    NSArray *titleArr = @[@"地区",@"企业类型",@"行业",@"筛选"];
   categoryButtonGroup = [[ZHQScrollMenu alloc]initWithFrame:CGRectMake(0, self.returnView.frame.origin.y + self.returnView.frame.size.height, self.view.frame.size.width, 40) delegate:self];
    categoryButtonGroup.repeatClick = YES;
    [self.view addSubview:categoryButtonGroup];
    categoryButtonGroup.lineView.hidden = YES;
    categoryButtonGroup.norMalTitleColor = [UIColor grayColor];
    categoryButtonGroup.changeTitleColor = [UIColor grayColor];
    [categoryButtonGroup addButton:titleArr titleFontSize:14];

}
//按钮点击
-(void)categoryButtonHandler:(NSInteger)tag{
    currentSelectButtTag = tag;
    switch (tag) {
        case 0:
            //NSLog(@"点击地区按钮");
            [self displayAddressPickerView];
            break;
        case 1:
            //NSLog(@"点击第二个按钮");
            [self displayOtherPickerView:categoryTitleArr];
            break;
        //行业
        case 2:
            [self displayOtherPickerView:jobArr];
            break;
        case 3:
            //进行筛选
            [self clickFilterHandler];
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
//地区点击完成的代理方法
-(void)getCityInformation:(NSString *)_province city:(NSString *)_city area:(NSString *)_area{
    NSLog(@"你选择的地区为%@,%@,%@",_province,_city,_area);
     [categoryButtonGroup setButtonTitle:_area index:currentSelectButtTag];

}
//处理第二个与第三个的点击弹出的内容
- (void)displayOtherPickerView:(NSArray*)titleArr{
     shadowButt = [[lzhShadeButton alloc]initWithFrame:CGRectMake(0, self.returnView.frame.origin.y + self.returnView.frame.size.height, self.view.frame.size.width, self.view.frame.size.height -self.returnView.frame.origin.y - self.returnView.frame.size.height )];
    [self.view addSubview:shadowButt];
    
    pickerView = [[lzhPickerView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width * 0.6, 150) titleArr:titleArr];
    pickerView.targetDelegate = self;
    pickerView.center = self.view.center;
    [self.view addSubview:pickerView];
}
//点击筛选
-(void)clickFilterHandler{
    NSLog(@"进行筛选");
}

//点击选择器按钮
-(void)getPickerInfomation:(NSString *)selectInfomation buttonTag:(NSInteger)tag{
    if(tag == 0){
       //取消按钮
        [self removePickerAndShadow];
    }else{
        NSLog(@"select string = %@",selectInfomation);
        //确认按钮
        [categoryButtonGroup setButtonTitle:selectInfomation index:currentSelectButtTag];
        [self removePickerAndShadow];
    }
}
//移除选择器，遮罩
- (void)removePickerAndShadow{
    [pickerView removeFromSuperview];
    [shadowButt removeFromSuperview];
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
