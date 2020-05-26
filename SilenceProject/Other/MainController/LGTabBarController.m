//
//  LGTabBarController.m
//  SilenceProject
//
//  Created by 甘延娇 on 2019/8/23.
//  Copyright © 2019 黎小龙. All rights reserved.
//

#import "LGTabBarController.h"
#import "LGNavigationController.h"
#import "LGViewController.h"
#import "LGMBProgressHUDViewController.h"
#import "LGSGPagingViewController.h"
#import "LGMeViewController.h"
#import "LGTwoViewController.h"

@interface LGTabBarController ()<UITabBarControllerDelegate>

@end

@implementation LGTabBarController

// main函数之前执行，不需要手动调用super
+ (void)initialize {
    // 修改tabbarItem被选中时的字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : RGB_COLOR(51, 51, 51)} forState:UIControlStateSelected];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : RGB_COLOR(51, 51, 51)} forState:UIControlStateNormal];
}

#pragma mark - viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    
    // 防止tabbar发生偏移
    [[UITabBar appearance] setTranslucent:NO];
    
    // 创建所有控制器
    [self buildAllChildViewController];
}

// 创建所有控制器
- (void)buildAllChildViewController {
    
    // TabBarOne
    [self buildChildViewController:[LGViewController new] normalImage:@"tabLive" selectedImage:@"tabLiveHL" title:@"推荐"];
    
    // TabBarTwo
    [self buildChildViewController:[LGTwoViewController new] normalImage:@"tabYule" selectedImage:@"tabYuleHL" title:@"娱乐"];
    
    // TabBarThree
    [self buildChildViewController:[LGMeViewController new] normalImage:@"tabFocus" selectedImage:@"tabFocusHL" title:@"关注"];
    
    // TabBarFour
    [self buildChildViewController:[LGSGPagingViewController new] normalImage:@"tabYuba" selectedImage:@"tabYubaHL" title:@"鱼吧"];
    
    // TabBarFive
    [self buildChildViewController:[LGMBProgressHUDViewController new] normalImage:@"tabDiscovery" selectedImage:@"tabDiscoveryHL" title:@"发现"];
}

// 创建子控制器
- (void)buildChildViewController:(UIViewController *)viewController normalImage:(NSString *)normalImage selectedImage:(NSString *)selectedImage title:(NSString *)title{
    
    LGNavigationController *navigationController = [[LGNavigationController alloc] initWithRootViewController:viewController];
    viewController.tabBarItem.image = [[UIImage imageNamed:normalImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.title = title;
    [self addChildViewController:navigationController];
}

#pragma mark - tabBarItem的点击方法
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    
  
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    
   
    return YES;
}



@end
