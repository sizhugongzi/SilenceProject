//
//  LGFakeScanViewController.m
//  SilenceProject
//
//  Created by 甘延娇 on 2019/8/27.
//  Copyright © 2019 黎小龙. All rights reserved.
//

#import "LGFakeScanViewController.h"
#import "HMScannerController.h"

@interface LGFakeScanViewController ()

@end

@implementation LGFakeScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"navbar_scan"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(scanButtonAction)];
}

- (void)scanButtonAction
{
    NSString *cardName = @"天涯刀哥 - 傅红雪";
    UIImage *avatar = [UIImage imageNamed:@"avatar"];
    
    HMScannerController *scanner = [HMScannerController scannerWithCardName:cardName avatar:avatar completion:^(NSString *stringValue) {
        
        //self.scanResultLabel.text = stringValue;
    }];
    
    [scanner setTitleColor:[UIColor whiteColor] tintColor:[UIColor greenColor]];
    
    [self showDetailViewController:scanner sender:nil];
}

@end
