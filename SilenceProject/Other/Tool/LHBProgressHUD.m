//
//  LHBProgressHUD.m
//  mf
//
//  Created by 廖汉斌 on 2019/1/6.
//  Copyright © 2019年 廖汉斌. All rights reserved.
//

#import "LHBProgressHUD.h"

// 背景视图的宽度/高度
#define BGVIEW_WIDTH 100.0f
// 文字大小
#define TEXT_SIZE    16.0f

@implementation LHBProgressHUD

+ (instancetype)sharedHUD {
    static id hud;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        hud = [[self alloc] initWithView:[UIApplication sharedApplication].keyWindow];
    });
    return hud;
}

+ (void)showStatus:(LHBProgressHUDStatus)status text:(NSString *)text {
    
    LHBProgressHUD *HUD = [LHBProgressHUD sharedHUD];
//    HUD.bezelView.color = [UIColor blackColor];
//    HUD.contentColor=[UIColor whiteColor];
//    [HUD showAnimated:YES];
//    [HUD setShowNow:YES];
//    HUD.label.text = text;
//    HUD.label.numberOfLines = 0;
//    HUD.label.textColor = [UIColor whiteColor];
//    [HUD setRemoveFromSuperViewOnHide:YES];
//    HUD.label.font = BOLD_FONTSIZE(TEXT_SIZE);
    [HUD setMinSize:CGSizeMake(BGVIEW_WIDTH, BGVIEW_WIDTH)];
    [[UIApplication sharedApplication].keyWindow addSubview:HUD];
    
    switch (status) {
            
        case LHBProgressHUDStatusSuccess: {
            
            UIImage *sucImage = [UIImage imageNamed:@"MBHUD_Success"];
            
            HUD.mode = MBProgressHUDModeCustomView;
            UIImageView *sucView = [[UIImageView alloc] initWithImage:sucImage];
            HUD.customView = sucView;
            [HUD hide:YES afterDelay:2.0f];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self hideHUD];
            });
        }
            break;
            
        case LHBProgressHUDStatusError: {
            
            UIImage *errImage = [UIImage imageNamed:@"MBHUD_Error"];
            
            HUD.mode = MBProgressHUDModeCustomView;
            UIImageView *errView = [[UIImageView alloc] initWithImage:errImage];
            HUD.customView = errView;
            [HUD hide:YES afterDelay:2.0f];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self hideHUD];
            });
        }
            break;
            
        case LHBProgressHUDStatusLoading: {
            HUD.mode = MBProgressHUDModeIndeterminate;
        }
            break;
            
        case LHBProgressHUDStatusWaitting: {
            
            UIImage *infoImage = [UIImage imageNamed:@"MBHUD_Warn"];
            
            HUD.mode = MBProgressHUDModeCustomView;
            UIImageView *infoView = [[UIImageView alloc] initWithImage:infoImage];
            HUD.customView = infoView;
            [HUD hide:YES afterDelay:2.0f];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self hideHUD];
            });
            
        }
            break;
            
        case LHBProgressHUDStatusInfo: {
            
            UIImage *infoImage = [UIImage imageNamed:@"MBHUD_Info"];
            
            HUD.mode = MBProgressHUDModeCustomView;
            UIImageView *infoView = [[UIImageView alloc] initWithImage:infoImage];
            HUD.customView = infoView;
            [HUD hide:YES afterDelay:2.0f];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [HUD setShowNow:NO];
            });
        }
            break;
            
        default:
            break;
    }
}

+ (void)showMessage:(NSString *)text {
    
    LHBProgressHUD *HUD = [LHBProgressHUD sharedHUD];
    //HUD.bezelView.color = [UIColor blackColor];
    [HUD show:YES];
    [HUD setShowNow:YES];
    //HUD.label.text = text;
    //HUD.contentColor=[UIColor whiteColor];
    [HUD setMinSize:CGSizeZero];
    [HUD setMode:MBProgressHUDModeText];
    [HUD setRemoveFromSuperViewOnHide:YES];
    //HUD.label.font = BOLD_FONTSIZE(TEXT_SIZE);
    [[UIApplication sharedApplication].keyWindow addSubview:HUD];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[LHBProgressHUD sharedHUD] setShowNow:NO];
        [[LHBProgressHUD sharedHUD] hide:YES];
    });
}

+ (void)showWaiting:(NSString *)text {
    
    [self showStatus:LHBProgressHUDStatusWaitting text:text];
}

+ (void)showError:(NSString *)text {
    
    [self showStatus:LHBProgressHUDStatusError text:text];
}

+ (void)showError {
    [self showError:@"网络故障"];
}

+ (void)showSuccess:(NSString *)text {
    
    [self showStatus:LHBProgressHUDStatusSuccess text:text];
}

+ (void)showLoading:(NSString *)text {
    [self showStatus:LHBProgressHUDStatusLoading text:text];
}

+ (void)showLoading {
    NSString *deviceType = [UIDevice currentDevice].model;
    if ([deviceType isEqualToString:@"iPad"]) { // iPad设备
        
    } else { // iPhone设备
        [self showLoading:@"Loading..."];
    }
}

+ (void)hideHUD {
    
    [[LHBProgressHUD sharedHUD] setShowNow:NO];
    [[LHBProgressHUD sharedHUD] hide:YES];
}


@end
