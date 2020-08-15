//
//  LGVersionViewController.m
//  SilenceProject
//
//  Created by Silence on 2017/8/23.
//  Copyright © 2017 Silence.L All rights reserved.
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
