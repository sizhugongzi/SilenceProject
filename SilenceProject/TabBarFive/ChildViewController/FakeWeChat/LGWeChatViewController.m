//
//  LGWeChatViewController.m
//  SilenceProject
//
//  Created by Silence on 2017/8/23.
//  Copyright © 2017 Silence.L All rights reserved.
//

#import "LGWeChatViewController.h"
#import "UINavigationBar+Awesome.h"
#import "KxMenu.h"

@interface LGWeChatViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UIButton *addButton;
}

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation LGWeChatViewController

- (void) viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    addButton.frame = CGRectMake(0, 0, 0, 0);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置右边按钮
    addButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
    addButton.tintColor = [UIColor blackColor];
    [addButton addTarget:self action:@selector(showMenu:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:addButton];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -NAVIGATION_H, [UIScreen mainScreen].bounds.size.width, 320)];
    imageView.backgroundColor = [UIColor redColor];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"bg" ofType:@"jpg"];
    UIImage *image = [UIImage imageWithContentsOfFile:filePath];
    imageView.image = image;
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.contentInset = UIEdgeInsetsMake(-NAVIGATION_H, 0, 0, 0);
    self.tableView.tableHeaderView = imageView;
    
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor]];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    UIColor * color = [UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1];
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > NAVIGATION_H) {
        CGFloat alpha = MIN(1, 1 - ((NAVIGATION_H + 64 - offsetY) / 64));
        [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:alpha]];
    } else {
        [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:0]];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.tableView.delegate = self;
    [self scrollViewDidScroll:self.tableView];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.tableView.delegate = nil;
    [self.navigationController.navigationBar lt_reset];
}

#pragma mark UITableViewDatasource

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"header";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = @"text";
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}

#pragma mark -- 导航条右边按钮的点击
- (void)showMenu:(UIButton *)sender
{
    NSArray *menuItems =
    @[
      
      [KxMenuItem menuItem:@"ACTION MENU"
                     image:nil
                    target:nil
                    action:NULL],
      
      [KxMenuItem menuItem:@"Share this"
                     image:[UIImage imageNamed:@"action_icon"]
                    target:self
                    action:@selector(pushMenuItem:)],
      
      [KxMenuItem menuItem:@"Check this menu"
                     image:[UIImage imageNamed:@"check_icon"]
                    target:self
                    action:@selector(pushMenuItem:)],
      
      [KxMenuItem menuItem:@"Reload page"
                     image:[UIImage imageNamed:@"reload"]
                    target:self
                    action:@selector(pushMenuItem:)],
      
      [KxMenuItem menuItem:@"Search"
                     image:[UIImage imageNamed:@"search_icon"]
                    target:self
                    action:@selector(pushMenuItem:)],
      
      [KxMenuItem menuItem:@"Go home"
                     image:[UIImage imageNamed:@"home_icon"]
                    target:self
                    action:@selector(pushMenuItem:)],
      ];
    
    KxMenuItem *first = menuItems[0];
    first.foreColor = [UIColor colorWithRed:47/255.0f green:112/255.0f blue:225/255.0f alpha:1.0];
    first.alignment = NSTextAlignmentCenter;
    
    [KxMenu showMenuInView:self.view
                  fromRect:sender.frame
                 menuItems:menuItems];
}

- (void) pushMenuItem:(id)sender
{
    NSLog(@"%@", sender);
}



@end
