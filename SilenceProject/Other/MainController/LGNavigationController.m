//
//  LGNavigationController.m
//  SilenceProject
//
//  Created by Silence on 2017/8/23.
//  Copyright © 2017 Silence.L All rights reserved.
//

#import "LGNavigationController.h"

@interface LGNavigationController ()

@end

@implementation LGNavigationController

// main函数之前执行，不需要手动调用super，只执行一次
+ (void)initialize {
    // 修改导航栏标题颜色
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : RGB_COLOR(51, 51, 51),
                                                           NSFontAttributeName : [UIFont boldSystemFontOfSize:18]
                                                           }];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.childViewControllers.count > 0) { // 非根控制器
        
        // 隐藏BottomBar
        viewController.hidesBottomBarWhenPushed = YES;
        // 自定义返回按钮
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"navbar_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(backViewController)];
        
        // 滑动返回功能
        self.interactivePopGestureRecognizer.delegate = nil;
    }
    
    // 跳转(自定义以后在这里真正跳转)
    [super pushViewController:viewController animated:animated];
}

// 返回的执行方法
- (void)backViewController {
    [self popViewControllerAnimated:YES];
}

@end
