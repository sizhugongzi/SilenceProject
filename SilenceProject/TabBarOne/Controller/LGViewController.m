//
//  LGViewController.m
//  SilenceProject
//
//  Created by Silence on 2017/8/23.
//  Copyright © 2017 Silence.L All rights reserved.
//

#import "LGViewController.h"

@interface LGViewController ()

@property (nonatomic,strong) CAGradientLayer *gradientLayer;

@end

@implementation LGViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //做一些简单的配置
    [self setting];
    
    [self setupBtn];
    
    [self setLabel];
}

- (void)setupBtn {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"nihao" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
    btn.frame = CGRectMake(100, 100, 100, 40);
    btn.backgroundColor = [UIColor orangeColor];
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:btn.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(20, 20)];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = btn.bounds;
    maskLayer.path = maskPath.CGPath;
    
    CAShapeLayer *borderMaskLayer = [CAShapeLayer layer];
    borderMaskLayer.path = maskPath.CGPath;
    borderMaskLayer.lineWidth = 1;
    borderMaskLayer.strokeColor = [UIColor redColor].CGColor;
    borderMaskLayer.fillColor = [UIColor clearColor].CGColor;
    
    btn.layer.mask = maskLayer;
    [btn.layer addSublayer:borderMaskLayer];
    [self.view addSubview:btn];
}

-(void)setLabel{
    // 创建UILabel
    UILabel *label = [[UILabel alloc] init];
    
    label.text = @"小码哥,专注于高级iOS开发工程师的培养";
    
    [label sizeToFit];
    
    label.center = CGPointMake(200, 100);
    
    // 疑问：label只是用来做文字裁剪，能否不添加到view上。
    // 必须要把Label添加到view上，如果不添加到view上，label的图层就不会调用drawRect方法绘制文字，也就没有文字裁剪了。
    // 如何验证，自定义Label,重写drawRect方法，看是否调用,发现不添加上去，就不会调用
    [self.view addSubview:label];
    
    // 创建渐变层
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    self.gradientLayer = gradientLayer;
    
    gradientLayer.frame = label.frame;
    
    // 设置渐变层的颜色，随机颜色渐变
    gradientLayer.colors = @[(id)[self randomColor].CGColor, (id)[self randomColor].CGColor,(id)[self randomColor].CGColor];
    
    // 疑问:渐变层能不能加在label上
    // 不能，mask原理：默认会显示mask层底部的内容，如果渐变层放在mask层上，就不会显示了
    
    // 添加渐变层到控制器的view图层上
    [self.view.layer addSublayer:gradientLayer];
    
    // mask层工作原理:按照透明度裁剪，只保留非透明部分，文字就是非透明的，因此除了文字，其他都被裁剪掉，这样就只会显示文字下面渐变层的内容，相当于留了文字的区域，让渐变层去填充文字的颜色。
    // 设置渐变层的裁剪层
    gradientLayer.mask = label.layer;
    
    // 注意:一旦把label层设置为mask层，label层就不能显示了,会直接从父层中移除，然后作为渐变层的mask层，且label层的父层会指向渐变层，这样做的目的：以渐变层为坐标系，方便计算裁剪区域，如果以其他层为坐标系，还需要做点的转换，需要把别的坐标系上的点，转换成自己坐标系上点，判断当前点在不在裁剪范围内，比较麻烦。
    
    
    // 父层改了，坐标系也就改了，需要重新设置label的位置，才能正确的设置裁剪区域。
    label.frame = gradientLayer.bounds;
    
    // 利用定时器，快速的切换渐变颜色，就有文字颜色变化效果
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(textColorChange)];
    
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}


// 随机颜色方法
- (UIColor *)randomColor{
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

// 定时器触发方法
- (void)textColorChange {
    _gradientLayer.colors = @[(id)[self randomColor].CGColor,
                              (id)[self randomColor].CGColor,
                              (id)[self randomColor].CGColor,
                              (id)[self randomColor].CGColor,
                              (id)[self randomColor].CGColor];
}






































//做一些简单的配置
- (void)setting{
    
    
    self.view.backgroundColor = [UIColor purpleColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(shuffle)];
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:UIImageMake(@"logo_foursquare")];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"navbar_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(shuffle)];
}

- (void)shuffle
{
    self.navigationController.navigationBar.barTintColor = SXRGB16Color(0x5e7d9a);
    self.navigationController.navigationBar.tintColor = SXRGB16Color(0xf8f8f8);
}











//UILabel测试sizeToFit用
- (void) setupView
{
    UILabel *label = [[UILabel alloc] init];
    label.numberOfLines = 0;
    label.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:0.3];
    label.frame = CGRectMake(0, 88, self.view.bounds.size.width, 0);
    label.text = @"当一个key-value对在缓存中时，缓存维护它的一个强引用。存储在NSCache中的通用数据类型通常是实现了NSDiscardableContent协议的对象。在缓存中存储这类对象是有好处的，因为当不再需要它时，可以丢弃这些内容，以节省内存。默认情况下，缓存中的NSDiscardableContent对象在其内容被丢弃时，会被移除出缓存，尽管我们可以改变这种缓存策略。如果一个NSDiscardableContent被放进缓存，则在对象被移除时，缓存会调用discardContentIfPossible方法。";
    [label sizeToFit];
    [self.view addSubview:label];
    
    
    UILabel *label2 = [[UILabel alloc] init];
    label2.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.3];
    label2.numberOfLines = 0;
    label2.frame = CGRectMake(0, CGRectGetMaxY(label.frame), 300, 0);
    label2.text = @"当一个key-value对在缓存中时，缓存维护它的一个强引用。存储在NSCache中的通用数据类型通常是实现了NSDiscardableContent协议的对象。在缓存中存储这类对";
    [label2 sizeToFit];
    [self.view addSubview:label2];
    
    
    UILabel *label3 = [[UILabel alloc] init];
    label3.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.3];
    label3.numberOfLines = 0;
    label3.frame = CGRectMake(0, CGRectGetMaxY(label2.frame), 300, 0);
    label3.text = @"当一个key-val\n\nue对在缓\n存中时，缓存维\n护它的一个\n强引用。存储在\nNSCache中的\n通用数据类型通常\n是实现了NSDisca\nrdableContent。";
    [self.view addSubview:label3];
    [label3 sizeToFit];
}

@end
