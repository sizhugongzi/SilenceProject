//
//  LGBaseTopicTableViewController.m
//  LGBuDeJie
//
//  Created by 甘延娇 on 2019/3/22.
//  Copyright © 2019 itheima. All rights reserved.
//

#import "LGBaseTopicTableViewController.h"
#import "LGTopicItem.h"
#import "LGTopicCell.h"
#import "LGTopicViewModel.h"
#import <MJRefresh/MJRefresh.h>
//#import "LGNewViewController.h"

static NSString * const ID = @"cell";

@interface LGBaseTopicTableViewController ()<UITableViewDataSource,UITableViewDelegate>

/** mainTableView */
@property (nonatomic, strong) UITableView *mainTableView;
/** 当前加载的页数 */
@property (assign, nonatomic) NSInteger currentPage;
@property (nonatomic,strong) NSMutableArray *topicsViewModel;


@end

@implementation LGBaseTopicTableViewController

- (NSMutableArray *)topicsViewModel
{
    if (!_topicsViewModel) {
        _topicsViewModel = [NSMutableArray array];
    }
    return _topicsViewModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // 创建mainTableView
    CGFloat mainTableViewY = STATUSBAR_H;
    CGFloat mainTableViewH = self.view.height - mainTableViewY - TABBAR_H;
    UITableView *mainTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    //注册cell
    [self.tableView registerClass:[LGTopicCell class] forCellReuseIdentifier:ID];
    
    mainTableView.backgroundColor = RGB_COLOR(242, 242, 242);
    mainTableView.dataSource = self;
    mainTableView.delegate = self;
    mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    mainTableView.allowsSelection = NO;
    mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:mainTableView];
    self.mainTableView = mainTableView;
    [mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(mainTableViewY);
        make.height.mas_equalTo(mainTableViewH);
    }];
    
    // 刷新
    mainTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    mainTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    
    // 请求列表数据
    [LHBProgressHUD showLoading];
    [self loadNewData];
}

// 刷新数据
- (void)loadNewData {
    // 请求列表数据
    self.currentPage = 1;
    [self requestActivityInfos];
}

- (void)loadMoreData {
    [self requestActivityInfos];
}

#pragma mark - 数据请求
- (void)requestActivityInfos {
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    NSString *a = @"list";
    //判断是精华还是新帖
//    if ([self.parentViewController isKindOfClass:[LGNewViewController class]]) {
//        a = @"newlist";
//    }
    parameters[@"a"] = a;
    parameters[@"c"] = @"data";
    parameters[@"type"] = self.type;
    
    [[LGHttpRequest sharedInstance] postWithURLString:@"" parameters:parameters success:^(id  _Nonnull responseObject) {
        LG_Log(@"==%@=responseObject=%@", NSStringFromClass([self class]), responseObject);
        
        // 数据转模型
        NSArray *topics = [LGTopicItem mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        //计算Cell的尺寸
        for (LGTopicItem *item in topics) {
            LGTopicViewModel *vm = [[LGTopicViewModel alloc] init];
            //给Item赋值和计算cell高度和子控件尺寸
            vm.topicItem = item;
            [self.topicsViewModel addObject:vm];
        }
        
        if (self.currentPage == 1) [self.topicsViewModel removeAllObjects];
    
        self.mainTableView.mj_footer.hidden = !self.topicsViewModel.count;
        
        [self.mainTableView reloadData];
        self.currentPage ++;
    } failure:^(NSError * _Nonnull error) {
        [LHBProgressHUD showError];
        [self.mainTableView.mj_header endRefreshing];
        [self.mainTableView.mj_footer endRefreshing];
    }];
}

#pragma mark- <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // 结束刷新
    [tableView.mj_header endRefreshing];
    if (self.topicsViewModel.count < self.currentPage * 10) {
        [tableView.mj_footer endRefreshingWithNoMoreData];
    } else {
        [tableView.mj_footer endRefreshing];
    }
    return self.topicsViewModel.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LGTopicCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    
    cell.viewModel = self.topicsViewModel[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.topicsViewModel[indexPath.row] cellH];
}

@end
