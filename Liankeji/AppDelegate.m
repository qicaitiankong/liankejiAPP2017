//
//  AppDelegate.m
//  Liankeji
//
//  Created by 李自豪 on 16/11/29.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//由于导入环信EaseUI时里面就应经有MBProgressHUD (0.9.2)  MJRefresh (3.1.12) MWPhotoBrowser (2.1.2) SDWebImage (3.8.2)所以在pod中不要再显性导入

#import "AppDelegate.h"
#import "LZHTabBarController.h"
#import "ShareDataBase.h"
#import "ShareHomePath.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"%lf,%lf",[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height);
    self.window = [[UIWindow alloc]init];
    //自定义标签栏
    LZHTabBarController *tab = [LZHTabBarController shareLZHTabbarController];
    self.window.rootViewController = tab;
    
    [self.window makeKeyAndVisible];
    
    
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {

    
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
