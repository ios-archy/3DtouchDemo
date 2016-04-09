//
//  AppDelegate.m
//  3DtouchDemo
//
//  Created by yuqi on 16/4/8.
//  Copyright © 2016年 yuqi. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "FirstViewController.h"
#import "TwoViewController.h"
@interface AppDelegate ()
@property (nonatomic,strong )UINavigationController *nav;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window =[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    ViewController *main =[[ViewController alloc]init];
    self.nav =[[UINavigationController alloc]initWithRootViewController:main];
    self.window.rootViewController = self.nav;
    [self.window makeKeyAndVisible];
    // Override point for customization after application launch.
    return YES;
}
//见网上有在- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions方法中 添加按钮手势的 ，但是这种添加方法在彻底退出APP后，再重新通过手势进入指定页面时不起效果，仅仅起到了启动APP的功能，没有跳到指定页面，不知是否有方法解决
//
//个人建议添加到info.plist 
//
//
//
//

-(void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
{
    switch ([shortcutItem.type integerValue]) {
        case 1:
        {
            NSLog(@"第1个进来");
            FirstViewController *first =[[FirstViewController alloc]init];
            first.title = @"第一个进来的";
            [self.nav pushViewController:first animated:YES];
        }
            break;
        case 2:
        {
            NSLog(@"第2个进来");
            TwoViewController *first =[[TwoViewController alloc]init];
            first.title = @"第二个进来的";
            [self.nav pushViewController:first animated:YES];
        }break;
        case 3:
        {
            NSLog(@"第3个进来");
        }
            break;
        case 4:
        {
            NSLog(@"第4个进来");
        }
            break;
            
        default:
            break;
    }}
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
