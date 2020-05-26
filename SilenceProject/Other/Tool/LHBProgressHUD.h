//
//  LHBProgressHUD.h
//  mf
//
//  Created by 廖汉斌 on 2019/1/6.
//  Copyright © 2019年 廖汉斌. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, LHBProgressHUDStatus) {
    
    /** 成功 */
    LHBProgressHUDStatusSuccess,
    
    /** 失败 */
    LHBProgressHUDStatusError,
    
    /** 警告*/
    LHBProgressHUDStatusWaitting,
    
    /** 提示 */
    LHBProgressHUDStatusInfo,
    
    /** 等待 */
    LHBProgressHUDStatusLoading
    
};

@interface LHBProgressHUD : MBProgressHUD

/**
 *  是否正在显示
 */
@property (nonatomic, assign, getter=isShowNow) BOOL showNow;

/** 返回一个 HUD 的单例 */
+ (instancetype)sharedHUD;

/** 在 window 上添加一个 HUD */
+ (void)showStatus:(LHBProgressHUDStatus)status text:(NSString *)text;

#pragma mark - 建议使用的方法

/** 在 window 上添加一个只显示文字的 HUD */
+ (void)showMessage:(NSString *)text;

/** 在 window 上添加一个提示`信息`的 HUD */
+ (void)showWaiting:(NSString *)text;

/** 在 window 上添加一个提示`失败`的 HUD */
+ (void)showError:(NSString *)text;
/** 在 window 上添加一个提示`失败`的 HUD */
+ (void)showError;

/** 在 window 上添加一个提示`成功`的 HUD */
+ (void)showSuccess:(NSString *)text;

/** 在 window 上添加一个提示`等待`的 HUD, 需要手动关闭 */
+ (void)showLoading:(NSString *)text;
/** 在 window 上添加一个提示`等待`的 HUD, 需要手动关闭 */
+ (void)showLoading;

/** 手动隐藏 HUD */
+ (void)hideHUD;

@end

NS_ASSUME_NONNULL_END
