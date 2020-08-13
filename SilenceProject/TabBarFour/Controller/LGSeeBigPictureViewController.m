//
//  LGSeeBigPictureViewController.m
//  LGBuDeJie
//
//  Created by Silence on 2017/3/13.
//  Copyright © 2017 Silence All rights reserved.
//

#import "LGSeeBigPictureViewController.h"
#import "LGTopicItem.h"
#import <UIImageView+WebCache.h>
#import <Photos/Photos.h>
#import "LGPhotoManager.h"


#define LGAlbumTitle @"百思不得姐"

@interface LGSeeBigPictureViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) UIImageView *imageView;

@end

@implementation LGSeeBigPictureViewController

//返回按钮
- (IBAction)dismiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

//保存按钮
- (IBAction)save:(id)sender {
    //保存到自己的相册
    
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    
    if (status == PHAuthorizationStatusNotDetermined) {//不确定
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            //授权完成就会调用
            if (status == PHAuthorizationStatusAuthorized) {
                [LGPhotoManager savePhoto:self.imageView.image albumTitle:LGAlbumTitle completionHandler:^(BOOL success, NSError * _Nonnull error) {
                    if (error) {
                        [LHBProgressHUD showMessage:@"保存失败"];
                    }else{
                        [LHBProgressHUD showMessage:@"保存成功"];
                    }
                }];
            }
        }];
    }else if (status == PHAuthorizationStatusAuthorized){
        [LGPhotoManager savePhoto:self.imageView.image albumTitle:LGAlbumTitle completionHandler:^(BOOL success, NSError * _Nonnull error) {
            if (error) {
                [LHBProgressHUD showMessage:@"保存失败"];
            }else{
                [LHBProgressHUD showMessage:@"保存成功"];
            }
        }];
    }else{
        //拒绝～～～提示用户去打开授权
        [LHBProgressHUD showMessage:@"进入设置界面->找到当前应用->打开允许访问相册开关"];
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    _imageView = imageView;
    [imageView sd_setImageWithURL:[NSURL URLWithString:self.item.image0]];
    [_scrollView addSubview:imageView];
    CGFloat h = SCREEN_W / _item.width * _item.height;
    imageView.frame = CGRectMake(0, 0, SCREEN_W, h);
    if (_item.is_bigPicture) {
        //大图
        _scrollView.contentSize = CGSizeMake(0, h);
        //进行缩放
        _scrollView.delegate = self;
        if (_item.height > h) {
            //设置最大缩放比例
            _scrollView.maximumZoomScale = _item.height / h;
        }
    }else{
        //小图
        imageView.center = CGPointMake(SCREEN_W * 0.5, SCREEN_H * 0.5);
    }
}

#pragma mark - UIScrollViewDelegate
//功能：返回需要缩放控件
//什么时候调用：进行缩放的时候才调用
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageView;
}

@end
