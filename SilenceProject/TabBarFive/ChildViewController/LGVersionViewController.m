//
//  LGVersionViewController.m
//  SilenceProject
//
//  Created by 甘延娇 on 2019/9/6.
//  Copyright © 2019 黎小龙. All rights reserved.
//

#import "LGVersionViewController.h"


@implementation LGVersionViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    NSLog(@"%f",[UIDevice currentDevice].systemVersion.doubleValue);
    //NSLog(@"%@",UIDevice.machineModel);
}

@end
