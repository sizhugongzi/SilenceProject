//
//  UIView+Frame.h
//  LGBuDeJie
//
//  Created by 甘延娇 on 2019/3/13.
//  Copyright © 2019 itheima. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Frame)

#pragma mark - origin
/** 视图的x */
@property (nonatomic, assign) CGFloat x;
/** 视图的y */
@property (nonatomic, assign) CGFloat y;
/** 视图中心的x */
@property (nonatomic, assign) CGFloat centerX;
/** 视图中心的y */
@property (nonatomic, assign) CGFloat centerY;
/** 视图的origin */
@property (nonatomic, assign) CGPoint origin;

#pragma mark - size
/** 视图的width */
@property (nonatomic, assign) CGFloat width;
/** 视图的height */
@property (nonatomic, assign) CGFloat height;
/** 视图的size */
@property (nonatomic, assign) CGSize size;

/**
 * setCornerRadius   给view设置圆角
 * @param value      圆角大小
 * @param rectCorner 圆角位置
 **/
- (void)setCornerRadius:(CGFloat)value addRectCorners:(UIRectCorner)rectCorner;

@end

NS_ASSUME_NONNULL_END
