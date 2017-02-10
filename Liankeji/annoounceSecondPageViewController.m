//
//  annoounceSecondPageViewController.m
//  Liankeji
//
//  Created by mac on 2017/1/17.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "annoounceSecondPageViewController.h"
#import "anounceSecondPageView.h"
#import "lzhAlertControllerViewController.h"


@interface annoounceSecondPageViewController ()<announceSecondPageDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@end

@implementation annoounceSecondPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    self.anounceView = [[anounceSecondPageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) delegate:self];
    self.anounceView.ownTitleLabel.text = @"发布技术";
    [self.view addSubview:self.anounceView];
    
    // Do any additional setup after loading the view.
}


-(void)returnHandler{
        [UIView animateWithDuration:0.5 animations:^{
            self.anounceView.transform = CGAffineTransformMakeTranslation(self.view.frame.size.width, 0);
             self.windowView.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            [self dismissViewControllerAnimated:NO completion:^{
            }];
        }];
}

-(void)choosePhoto{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"上传图片" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    UIAlertAction *selectPhotoAction = [UIAlertAction actionWithTitle:@"从相册选取" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"上传图片");
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
            NSLog(@"支持相机");
            UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
            imagePickerController.delegate = self;
            imagePickerController.allowsEditing = YES;
            imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self presentViewController:imagePickerController animated:YES completion:^{
            }];
        }
    }];
    UIAlertAction *PhotoAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:selectPhotoAction];
    [alertController addAction:PhotoAction];
    [self presentViewController:alertController animated:YES completion:^{
    }];
    
}
//image picker 代理
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    [self uploadImage:image];
}
- (void)uploadImage:(UIImage*)image{
    [self.anounceView.photoButt setImage:image forState:UIControlStateNormal];
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
