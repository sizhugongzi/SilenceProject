//
//  LGJGGViewController.m
//  SilenceProject
//
//  Created by Silence.L on 2019/11/25.
//  Copyright © 2019 黎小龙. All rights reserved.
//

#import "LGJGGViewController.h"

@interface LGJGGViewController ()

/** scrollView */
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation LGJGGViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height)];
    [self.view addSubview:self.scrollView];
    
    [self jiuGongGe];
}

-(void)jiuGongGe{
    CGFloat W = (self.view.width - 20) / 3;
    CGFloat H = 60;
    NSInteger column = 3;
    CGFloat columnMargin = (self.view.frame.size.width - column * W) / (column - 1);
    CGFloat rowMargin = 10;
    
    CGFloat lastY = 0;
    for (NSInteger i = 0; i < 999; i++) {
        CGFloat X = (i % column) * (W + columnMargin);
        CGFloat Y = (i / column) * (H +rowMargin);
        
        UIView *v = [[UIView alloc] init];
        v.frame = CGRectMake(X, Y, W, H);
        v.backgroundColor = Random_COLOR;
        [self.scrollView addSubview:v];
        
        lastY = Y + H;
    }
    self.scrollView.contentSize = CGSizeMake(0, lastY);
}

@end
