//
//  LGMBProgressHUDViewController.m
//  SilenceProject
//
//  Created by 甘延娇 on 2019/8/23.
//  Copyright © 2019 黎小龙. All rights reserved.
//

#import "LGMBProgressHUDViewController.h"
#import "LGWeChatViewController.h"
#import "YYTextExample.h"
#import "PYSearchExampleController.h"
#import "LGFakeScanViewController.h"
#import "LGPhotoBrowserViewController.h"
#import "IDAuthViewController.h"
#import "LGVersionViewController.h"
#import "LGFakeSerachBarViewController.h"
#import "LGJGGViewController.h"
#import "MaskViewController.h"

@interface MBExample : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) SEL selector;

@end

@implementation MBExample

+ (instancetype)exampleWithTitle:(NSString *)title selector:(SEL)selector {
    MBExample *example = [[self class] new];
    example.title = title;
    example.selector = selector;
    return example;
}

@end

@interface LGMBProgressHUDViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSArray<NSArray<MBExample *> *> *examples;
@property (strong, nonatomic) UITableView *tableView;

@end

@implementation LGMBProgressHUDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0,0, SCREEN_W,NAVIGATION_H)];
    CAGradientLayer*gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id) SXRGB16Color(0x86e3ce).CGColor, (__bridge id) SXRGB16Color(0xffdd94).CGColor, (__bridge id) SXRGB16Color(0xccabd8).CGColor];
    gradientLayer.locations = @[@0.3, @0.5, @1.0];
    gradientLayer.startPoint =CGPointMake(0,0);
    gradientLayer.endPoint =CGPointMake(1.0,0);
    gradientLayer.frame = backView.frame;
    [backView.layer addSublayer:gradientLayer];
    [self.navigationController.navigationBar setBackgroundImage:[self convertViewToImage:backView] forBarMetrics:UIBarMetricsDefault];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Alert1" style:UIBarButtonItemStylePlain target:self action:@selector(openAlert1)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Alert2" style:UIBarButtonItemStylePlain target:self action:@selector(openAlert2)];
    
    UISegmentedControl *seg = [[UISegmentedControl alloc] initWithItems:@[@"打开弹框1",@"打开弹框2"]];
    seg.selectedSegmentIndex = 0;
    [seg addTarget:self action:@selector(segMethod:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = seg;
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H - TABBAR_H) style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"MBExampleCell"];
    
    [self initData];
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

- (void) initData
{
    self.examples =
    @[@[[MBExample exampleWithTitle:@"仿微信朋友圈功能" selector:@selector(weChatAction)],
        [MBExample exampleWithTitle:@"YYText" selector:@selector(YYTextAction)],
        [MBExample exampleWithTitle:@"PYSearch" selector:@selector(PYSearchAction)]],
      @[[MBExample exampleWithTitle:@"fakeScan" selector:@selector(fakeScanAction)],
        [MBExample exampleWithTitle:@"photoBrowser" selector:@selector(photoBrowserAction)],
        [MBExample exampleWithTitle:@"身份证识别" selector:@selector(IDCardRecognitionAction)]],
      @[[MBExample exampleWithTitle:@"打开苹果商店" selector:@selector(openAppStore)],
        [MBExample exampleWithTitle:@"打开弹框" selector:@selector(openAlert)],
        [MBExample exampleWithTitle:@"系统版本和手机型号" selector:@selector(versionAction)],
        [MBExample exampleWithTitle:@"搜索框" selector:@selector(searchAction)]],
      
      @[[MBExample exampleWithTitle:@"打开弹框1" selector:@selector(openAlert1)],
        [MBExample exampleWithTitle:@"打开弹框2" selector:@selector(openAlert2)],
        [MBExample exampleWithTitle:@"打开弹框3" selector:@selector(openAlert3)],
        [MBExample exampleWithTitle:@"打开弹框4" selector:@selector(openAlert4)],
        [MBExample exampleWithTitle:@"Colored" selector:@selector(weChatAction)]],
      
      @[[MBExample exampleWithTitle:@"1" selector:@selector(test1)],
        [MBExample exampleWithTitle:@"2" selector:@selector(test2)],
        [MBExample exampleWithTitle:@"3" selector:@selector(versionAction)],
        [MBExample exampleWithTitle:@"4" selector:@selector(searchAction)]],
      ];
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.examples.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.examples[section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MBExample *example = self.examples[indexPath.section][indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MBExampleCell" forIndexPath:indexPath];
    cell.textLabel.text = example.title;
    cell.textLabel.textColor = self.view.tintColor;
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.selectedBackgroundView = [UIView new];
    cell.selectedBackgroundView.backgroundColor = [cell.textLabel.textColor colorWithAlphaComponent:0.1f];
    return cell;
}


#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MBExample *example = self.examples[indexPath.section][indexPath.row];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [self performSelector:example.selector];
#pragma clang diagnostic pop
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    });
}

#pragma mark - UITableViewCell点击调用的方法
- (void) weChatAction
{
    LGWeChatViewController *weChatViewController = [[LGWeChatViewController alloc] init];
    [self.navigationController pushViewController:weChatViewController animated:YES];
}

- (void) YYTextAction
{
    YYTextExample *vc = [YYTextExample new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void) PYSearchAction
{
    PYSearchExampleController *searchExampleController = [PYSearchExampleController new];
    [self.navigationController pushViewController:searchExampleController animated:YES];
}

- (void) fakeScanAction
{
    LGFakeScanViewController *fakeScanViewController = [LGFakeScanViewController new];
    [self.navigationController pushViewController:fakeScanViewController animated:YES];
}

- (void) photoBrowserAction
{
    LGPhotoBrowserViewController *photoBrowserViewController = [LGPhotoBrowserViewController new];
    [self.navigationController pushViewController:photoBrowserViewController animated:YES];
}

- (void) IDCardRecognitionAction
{
    IDAuthViewController *vc = [IDAuthViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)openAppStore
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"itms-apps://itunes.apple.com/search"]];
}

- (void)openAlert
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"任务被抢光" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:alertAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)versionAction
{
    LGVersionViewController *vc = [LGVersionViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)searchAction
{
    LGFakeSerachBarViewController *vc = [LGFakeSerachBarViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}


//第一种平常看到可以打电话的那种模式
- (void)openAlert1
{
    //preferredStyle： 设置弹窗类型
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"天朝帝都" message:@"我是客服" preferredStyle:UIAlertControllerStyleActionSheet];
    //字体颜色
    //alertView.view.tintColor = [UIColor redColor];
    //style：设置提示弹窗样式
    UIAlertAction *select = [UIAlertAction actionWithTitle:@"给我打个电话聊聊" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    NSLog(@"你打电话了");
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
    NSLog(@"你选择了取消");
    }];
    UIAlertAction *other = [UIAlertAction actionWithTitle:@"这是什么情况" style:(UIAlertActionStyleDestructive) handler:^(UIAlertAction * _Nonnull action) {
    NSLog(@"这是什么情况");
    }];
    [alertView addAction:select];
    [alertView addAction:cancel];
    [alertView addAction:other];
    [self presentViewController:alertView animated:YES completion:nil];
}

//第二种有输入框的那种模式
//需要注意的是，这里只能使用老版的弹窗提示模式，不能使用脚底弹窗
- (void)openAlert2
{
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"提示" message:@"就提示一下吧" preferredStyle:(UIAlertControllerStyleAlert)];
    [alertView addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
    textField.keyboardType = UIKeyboardTypeNumberPad;
    textField.placeholder = @"请输入用户名";
    }];

    [alertView addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
    textField.keyboardType = UIKeyboardTypeNumberPad;
    textField.placeholder = @"请输入密码";
    }];

    UIAlertAction *alertText = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {

    //获取第一个输入框
    UITextField *textFieldUser = [[alertView textFields] firstObject];
    //获取第二个输入框
    UITextField *textFieldPassWord = [[alertView textFields] objectAtIndex:1];
    if (textFieldUser.text.length == 0) {
    //这里加入自己的逻辑
    NSLog(@"用户名");
    }else if (textFieldPassWord.text.length == 0){
    NSLog(@"密码不为空");
    }
    }];

    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
    NSLog(@"点击取消");
    }];

    [alertView addAction:cancleAction];
    [alertView addAction:alertText];

    [self presentViewController:alertView animated:YES completion:nil];
}

//第三种弹窗提示模式
- (void)openAlert3
{
    UIAlertController *alertView  = [UIAlertController alertControllerWithTitle:@"提示" message:@"普通的提示信息" preferredStyle:UIAlertControllerStyleActionSheet];

    UIAlertAction *showAlert = [UIAlertAction actionWithTitle:@"提示按钮一" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    NSLog(@"你点击了提示按钮");
    }];

    UIAlertAction *cancelAlert = [UIAlertAction actionWithTitle:@"提示按钮二" style:(UIAlertActionStyleDestructive) handler:^(UIAlertAction * _Nonnull action) {
    NSLog(@"你点击了提示按钮二");
    }];

    [alertView addAction:showAlert];
    [alertView addAction:cancelAlert];

    [self presentViewController:alertView animated:YES completion:nil];
}

- (void)openAlert4
{
    //提示框添加文本输入框
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Title"
                                                                   message:@"This is an alert."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              //响应事件
                                                              //得到文本信息
                                                              for(UITextField *text in alert.textFields){
                                                                  NSLog(@"text = %@", text.text);
                                                              }
                                                          }];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * action) {
                                                             //响应事件
                                                             NSLog(@"action = %@", alert.textFields);
                                                         }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"登录";
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"密码";
        textField.secureTextEntry = YES;
    }];
    
    [alert addAction:okAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
}

//开关分页效果
- (void)segMethod:(UISegmentedControl *)seg {
    switch (seg.selectedSegmentIndex) {
        case 0:
            [self openAlert1];
            break;
        case 1:
            [self openAlert2];
            break;
        default:
            break;
    }
}

-(void)test1{
    LGJGGViewController *vc = [LGJGGViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)test2{
    MaskViewController *vc = [MaskViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
