//
//  LGMeViewController.m
//  SilenceProject
//
//  Created by Silence on 2017/3/13.
//  Copyright © 2017 Silence All rights reserved.
//

#import "LGMeViewController.h"
#import "FYMe0Cell.h"

@interface LGMeViewController ()<UITableViewDataSource,UITableViewDelegate,FYMe0Delegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation LGMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor orangeColor];
    
    [self initTableView];
}

-(void)initTableView
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H - TABBAR_H) style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    //self.tableView.tableHeaderView = self.scrollView;
    [self.view addSubview:self.tableView];
}

#pragma mark - tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 7;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0 || section == 6)
    {
        return 1;
    }
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return 80;
    }else  if (indexPath.section == 1)
    {
        if (indexPath.row == 0)
        {
            return 50;
        }else
        {
            return 80;
        }
    }else  if (indexPath.section == 2)
    {
        if (indexPath.row == 0)
        {
            return 50;
        }else
        {
            return 80;
        }
    }else  if (indexPath.section == 3)
    {
        if (indexPath.row == 0)
        {
            return 50;
        }else
        {
            return 80;
        }
    }else  if (indexPath.section == 4)
    {
        if (indexPath.row == 0)
        {
            return 50;
        }else
        {
            return 80;
        }
    }
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section == 0)
    {
        return 170;
    } else
    {
        return 3;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndentifier = @"cell303";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    
    if (indexPath.section == 0)
    {
        NSString *plistPath0 = [[NSBundle mainBundle]pathForResource:@"me1Data" ofType:@"plist"];
        NSArray *array = [[NSMutableArray alloc]initWithContentsOfFile:plistPath0];
        
        static NSString *cellIndentifier = @"cell0";
        FYMe0Cell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
        if (cell == nil)
        {
            cell = [[FYMe0Cell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier array:array];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.delegate = self;
        return cell;
    }else
        if (indexPath.section == 1)
        {
            if (indexPath.row == 0)
            {
                cell.textLabel.text = @"订单";
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                return cell;
            }else
            {
                NSString *plistPath0 = [[NSBundle mainBundle]pathForResource:@"meData" ofType:@"plist"];
                NSArray *array = [[NSMutableArray alloc]initWithContentsOfFile:plistPath0];
                
                static NSString *cellIndentifier = @"cell11";
                FYMe0Cell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
                if (cell == nil)
                {
                    cell = [[FYMe0Cell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier array:array];
                }
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell.delegate = self;
                return cell;
            }
        }else if(indexPath.section == 2)
        {
            if (indexPath.row == 0)
            {
                cell.textLabel.text = @"资产";
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                return cell;
            }else
            {
                NSString *plistPath0 = [[NSBundle mainBundle]pathForResource:@"me2Data" ofType:@"plist"];
                NSArray *array = [[NSMutableArray alloc]initWithContentsOfFile:plistPath0];
                
                static NSString *cellIndentifier = @"cell21";
                FYMe0Cell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
                if (cell == nil)
                {
                    cell = [[FYMe0Cell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier array:array];
                }
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell.delegate = self;
                return cell;
            }
        }else if(indexPath.section == 3)
        {
            if (indexPath.row == 0)
            {
                cell.textLabel.text = @"百度钱包";
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                return cell;
            }else
            {
                NSString *plistPath0 = [[NSBundle mainBundle]pathForResource:@"me2Data" ofType:@"plist"];
                NSArray *array = [[NSMutableArray alloc]initWithContentsOfFile:plistPath0];
                
                static NSString *cellIndentifier = @"cell31";
                FYMe0Cell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
                if (cell == nil)
                {
                    cell = [[FYMe0Cell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier array:array];
                }
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell.delegate = self;
                return cell;
            }
        }else if(indexPath.section == 4)
        {
            if (indexPath.row == 0)
            {
                cell.textLabel.text = @"推荐";
                return cell;
            }else
            {
                NSString *plistPath0 = [[NSBundle mainBundle]pathForResource:@"meData" ofType:@"plist"];
                NSArray *array = [[NSMutableArray alloc]initWithContentsOfFile:plistPath0];
                
                static NSString *cellIndentifier = @"cell41";
                FYMe0Cell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
                if (cell == nil)
                {
                    cell = [[FYMe0Cell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier array:array];
                }
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell.delegate = self;
                return cell;
            }
        }else if(indexPath.section == 5)
        {
            if (indexPath.row == 0)
            {
                cell.textLabel.text = @"帮助与反馈";
                return cell;
            }else  if (indexPath.row == 1)
            {
                cell.textLabel.text = @"设置";
                return cell;
            }else
            {
                cell.textLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
                return cell;
            }
            
        }else if(indexPath.section == 6)
        {
            cell.textLabel.text = @"我要开店";
            return cell;
        }else
        {
            cell.textLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
            return cell;
        }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"%ld,%ld", (long)indexPath.section,(long)indexPath.row);//row 行 section 段
    
//    FYDengluViewController *denglu = [[FYDengluViewController alloc]initWithNibName:@"FYDengluViewController" bundle:nil];
//    
//    //denglu.hidesBottomBarWhenPushed = YES;//隐藏 tabBar 在navigationController结构中
//    [self presentViewController:denglu animated:YES completion:nil];//1.点击，相应跳转
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.selected = NO;  //这种是点击的时候有效果，返回后效果消失
    
}

@end
