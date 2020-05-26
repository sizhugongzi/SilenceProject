//
//  LGTwoViewController.m
//  SilenceProject
//
//  Created by 甘延娇 on 2019/10/21.
//  Copyright © 2019 黎小龙. All rights reserved.
//

#import "LGTwoViewController.h"
#import "UIButton+Gradient.h"

@interface LGTwoViewController ()

@end

@implementation LGTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    // 设置自定义导航栏标题颜色
//    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
//    // 设置自定义导航栏背景图片
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"millcolorGrad"] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0,0, SCREEN_W,NAVIGATION_H)];
    CAGradientLayer*gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id) SXRGB16Color(0xfeac5e).CGColor, (__bridge id) SXRGB16Color(0xc779d0).CGColor, (__bridge id) SXRGB16Color(0x4bc0c8).CGColor];
    gradientLayer.locations = @[@0.3, @0.5, @1.0];
    gradientLayer.startPoint =CGPointMake(0,0);
    gradientLayer.endPoint =CGPointMake(1.0,0);
    gradientLayer.frame = backView.frame;
    [backView.layer addSublayer:gradientLayer];
    [self.navigationController.navigationBar setBackgroundImage:[self convertViewToImage:backView] forBarMetrics:UIBarMetricsDefault];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(shuffle)];
       
       self.navigationItem.titleView = [[UIImageView alloc] initWithImage:UIImageMake(@"logo_foursquare")];
       
       self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"navbar_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(shuffle)];
    
    
    
    UIButton *thirdBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    thirdBtn.frame = CGRectMake(10, 50, 200, 44);
    
    CAGradientLayer *gradientLayer1 =  [CAGradientLayer layer];
    gradientLayer1.frame = CGRectMake(0, 0, 200, 44);
    gradientLayer1.startPoint = CGPointMake(0, 0);
    gradientLayer1.endPoint = CGPointMake(1, 0);
    gradientLayer1.locations = @[@(0.1),@(1.0)];
    [gradientLayer1 setColors:@[(id)[RGB_COLOR(46, 229, 253) CGColor],(id)[RGB_COLOR(41, 195, 252) CGColor]]];
    [thirdBtn.layer addSublayer:gradientLayer1];
    
    
    [thirdBtn setTitle:@"代码创建的按钮，使用layer" forState:UIControlStateNormal];
    [thirdBtn setImage:[UIImage imageNamed:@"right"] forState:UIControlStateNormal];
    [thirdBtn addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:thirdBtn];
    
    
    UIButton *four = [UIButton buttonWithType:UIButtonTypeCustom];
    four.frame = CGRectMake(20, 120, 250, 44);
    [four setTitle:@"代码创建的按钮，使用Category" forState:UIControlStateNormal];
    [four setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [four setImage:[UIImage imageNamed:@"right"] forState:UIControlStateNormal];
    [four gradientButtonWithSize:CGSizeMake(200, 44) colorArray:@[(id)[UIColor yellowColor],(id)[UIColor brownColor]] percentageArray:@[@(0.18),@(1)] gradientType:GradientFromLeftBottomToRightTop];
    [four addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:four];
}

-(UIImage*)convertViewToImage:(UIView *)v{
    CGSize s = v.bounds.size;
    // 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需 要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了
    UIGraphicsBeginImageContextWithOptions(s,YES, [UIScreen mainScreen].scale);
    [v.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage*image =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)shuffle
{
    self.navigationController.navigationBar.barTintColor = SXRGB16Color(0x5e7d9a);
    self.navigationController.navigationBar.tintColor = SXRGB16Color(0xf8f8f8);
}


- (void)clickAction
{
    [self showMessage:@"你好！"];
}

- (void)showMessage:(NSString *)msg {
    CGFloat padding = 10;
    
    UILabel *label = [UILabel new];
    label.frame = CGRectMake(0, 88, SCREEN_W, 88);
    label.text = msg;
    label.font = [UIFont systemFontOfSize:16];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor colorWithRed:0.033 green:0.685 blue:0.978 alpha:0.730];
    label.width = self.view.width;
    //label.textContainerInset = UIEdgeInsetsMake(padding, padding, padding, padding);
    //label.height = [msg heightForFont:label.font width:label.width] + 2 * padding;
    
    //label.bottom = (kiOS7Later ? 64 : 0);
    [self.view addSubview:label];
    [UIView animateWithDuration:0.3 animations:^{
        //label.top = 88;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 delay:2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            //label.bottom = 88;
        } completion:^(BOOL finished) {
            [label removeFromSuperview];
        }];
    }];
}


@end
