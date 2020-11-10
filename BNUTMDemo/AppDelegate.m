//
//  AppDelegate.m
//  BNUTMDemo
//
//  Created by  zz on 2020/11/10.
//  Copyright © 2020  zz. All rights reserved.
//

#import "AppDelegate.h"
#import <WDUTMSDK/WDUTMSDK-Swift.h>
#import "BNUTMDemo-Swift.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *bundleId = infoDictionary[@"CFBundleIdentifier"];
    bundleId = [bundleId stringByReplacingOccurrencesOfString:@"." withString:@"-"];
    
    /**
     *  初始化
     * @param channel 渠道
     * @param app 需要传入bundleId 以-分割 请参考demo
     */
    [WDTracker setupWithChannel:@"AppStore" app: bundleId];
    WDTracker.debug = true;
    
    // 自定义上传用户id
    [WDTracker fire:@"user" extra:@{@"dataid" : @"123"}];
    
    UITabBarController *tabBarVc = [UITabBarController new];
    tabBarVc.view.backgroundColor = UIColor.whiteColor;
    
    UINavigationController *navOneVc = [UINavigationController new];
    navOneVc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我也能上报1" image:nil tag: nil];
    [navOneVc addChildViewController:[MyOneViewController new]];
    
    UINavigationController *navTwoVc = [UINavigationController new];
    navTwoVc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我也能上报2" image:nil tag: nil];
    [navTwoVc addChildViewController:[MyTwoViewController new]];
    
    [tabBarVc addChildViewController:navOneVc];
    [tabBarVc addChildViewController:navTwoVc];
    
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    NSLog(@"UIScreen.mainScreen.bounds : %.f : %.f", UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height);
    [self.window setRootViewController:tabBarVc];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
