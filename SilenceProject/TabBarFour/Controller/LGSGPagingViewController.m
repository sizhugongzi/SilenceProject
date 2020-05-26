//
//  LGSGPagingViewController.m
//  SilenceProject
//
//  Created by 甘延娇 on 2019/8/23.
//  Copyright © 2019 黎小龙. All rights reserved.
//

#import "LGSGPagingViewController.h"
#import "SGPagingView.h"

@interface LGSGPagingViewController ()<SGPageTitleViewDelegate, SGPageContentCollectionViewDelegate>

@property (nonatomic, strong) SGPageTitleView *pageTitleView;
@property (nonatomic, strong) SGPageContentCollectionView *pageContentCollectionView;

@end

@implementation LGSGPagingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航条内容
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    [self setupPageView];
}

- (void)setupPageView {
    CGFloat statusHeight = CGRectGetHeight([UIApplication sharedApplication].statusBarFrame);
    CGFloat pageTitleViewY = 0;
    if (statusHeight == 20.0) {
        pageTitleViewY = 64;
    } else {
        pageTitleViewY = 88;
    }
    //商品分类id:0.全部 1.女装 2.男装 3.内衣 4.母婴 5.化妆品 6.居家 7.鞋包配饰 8.美食 9.文体车品10.数码家电
    NSArray *titleArr = @[@"全部", @"女装", @"男装", @"内衣", @"母婴", @"化妆品", @"居家", @"鞋包配饰", @"美食",@"文体车品",@"数码家电"];
    SGPageTitleViewConfigure *configure = [SGPageTitleViewConfigure pageTitleViewConfigure];
    configure.titleSelectedColor = [UIColor whiteColor];
    configure.indicatorStyle = SGIndicatorStyleCover;
    configure.indicatorColor = RGB_COLOR(252, 216, 48);
    configure.indicatorHeight = 30;
    configure.indicatorCornerRadius = 15;
    configure.indicatorAdditionalWidth = 100; // 说明：指示器额外增加的宽度，不设置，指示器宽度为标题文字宽度；若设置无限大，则指示器宽度为按钮宽度
    //    configure.indicatorHeight = 122; // 说明：不设置，遮盖样式下，默认高度为文字高度 + 5；若设置无限大，则高度为 PageTitleView 高度
    //    configure.titleGradientEffect = YES;
    
    /// pageTitleView
    self.pageTitleView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(0, pageTitleViewY, self.view.frame.size.width, 44) delegate:self titleNames:titleArr configure:configure];
    [self.view addSubview:_pageTitleView];
    
    
    _pageContentCollectionView.delegatePageContentCollectionView = self;
    [self.view addSubview:_pageContentCollectionView];
}

- (void)pageTitleView:(SGPageTitleView *)pageTitleView selectedIndex:(NSInteger)selectedIndex {
    [self.pageContentCollectionView setPageContentCollectionViewCurrentIndex:selectedIndex];
}

- (void)pageContentCollectionView:(SGPageContentCollectionView *)pageContentCollectionView progress:(CGFloat)progress originalIndex:(NSInteger)originalIndex targetIndex:(NSInteger)targetIndex {
    [self.pageTitleView setPageTitleViewWithProgress:progress originalIndex:originalIndex targetIndex:targetIndex];
}


@end
