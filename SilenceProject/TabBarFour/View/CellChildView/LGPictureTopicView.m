//
//  LGPictureTopicView.m
//  LGBuDeJie
//
//  Created by 甘延娇 on 2019/3/15.
//  Copyright © 2019 itheima. All rights reserved.
//

#import "LGPictureTopicView.h"
#import <UIImageView+WebCache.h>
#import "LGTopicItem.h"
#import "LGSeeBigPictureViewController.h"

@interface LGPictureTopicView ()

@property (weak, nonatomic) IBOutlet UIImageView *gifView;
@property (weak, nonatomic) IBOutlet UIImageView *pictureView;
@property (weak, nonatomic) IBOutlet UIButton *seeBigButton;

@end

@implementation LGPictureTopicView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //弹出查看大图View
    LGSeeBigPictureViewController *seeBigPictureViewController = [[LGSeeBigPictureViewController alloc] init];
    seeBigPictureViewController.item = self.topicItem;
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:seeBigPictureViewController animated:YES completion:nil];
}

- (void)setTopicItem:(LGTopicItem *)topicItem
{
    [super setTopicItem:topicItem];
    
    [_pictureView sd_setImageWithURL:[NSURL URLWithString:topicItem.image0]];
    _gifView.hidden = !topicItem.is_gif;
    
    //做大图处理
    _seeBigButton.hidden = !topicItem.is_bigPicture;
    
    if (topicItem.is_bigPicture) {
        //设置图片内容模式
        _pictureView.contentMode = UIViewContentModeTop;
        _pictureView.clipsToBounds = YES;
    }else{
        //设置图片内容模式
        _pictureView.contentMode = UIViewContentModeScaleToFill;
        _pictureView.clipsToBounds = NO;
    }
}

@end
