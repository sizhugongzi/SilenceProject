//
//  LGFakeSerachBarViewController.m
//  SilenceProject
//
//  Created by Silence on 2017/3/13.
//  Copyright © 2017 Silence All rights reserved.
//

#import "LGFakeSerachBarViewController.h"
#import "PYSearchExampleController.h"

@interface LGFakeSerachBarViewController ()<UISearchBarDelegate>

@end

@implementation LGFakeSerachBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(50, 5, [UIScreen mainScreen].bounds.size.width-100, 30)];
    //设置搜索框
    UISearchBar *searchBar = [[UISearchBar alloc]init];
    searchBar.frame = titleView.bounds;
    [titleView addSubview:searchBar];
    searchBar.delegate = self;
    //设置占位文字
    [searchBar setPlaceholder:@"搜索吧,骚年"];
    searchBar.layer.cornerRadius = 15;
    searchBar.layer.masksToBounds = YES;
    [searchBar.layer setBorderColor:[UIColor whiteColor].CGColor];
    [searchBar.layer setBorderWidth:5];
    [searchBar setSearchResultsButtonSelected:YES];
    self.navigationItem.titleView = titleView;
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 30);
    button.imageView.backgroundColor = [UIColor redColor];
    button.titleLabel.backgroundColor = [UIColor orangeColor];
    //button.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:button];
}

//要开始进行编辑
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    
//    PYSearchExampleController *searchExampleController = [PYSearchExampleController new];
//    [self.navigationController pushViewController:searchExampleController animated:YES];
}

@end
