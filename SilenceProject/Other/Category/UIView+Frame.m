//
//  UIView+Frame.m
//  LGBuDeJie
//
//  Created by Silence on 2017/3/13.
//  Copyright © 2019 itheima. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

#pragma mark - origin
- (CGFloat)x
{
    return self.frame.origin.x;
}
- (void)setX:(CGFloat)x
{
    self.origin = CGPointMake(x, self.y);
}

- (CGFloat)y
{
    return self.frame.origin.y;
}
- (void)setY:(CGFloat)y
{
    self.origin = CGPointMake(self.x, y);
}

- (CGFloat)centerX
{
    return self.center.x;
}
- (void)setCenterX:(CGFloat)centerX
{
    self.center = CGPointMake(centerX, self.centerY);
}

- (CGFloat)centerY
{
    return self.center.y;
}
- (void)setCenterY:(CGFloat)centerY
{
    self.center = CGPointMake(self.centerX, centerY);
}

- (CGPoint)origin
{
    return self.frame.origin;
}
- (void)setOrigin:(CGPoint)origin
{
    self.frame = CGRectMake(origin.x, origin.y, self.width, self.height);
}

#pragma mark - size
- (CGFloat)width
{
    return self.frame.size.width;
}
- (void)setWidth:(CGFloat)width
{
    self.size = CGSizeMake(width, self.height);
}

- (CGFloat)height
{
    return self.frame.size.height;
}
- (void)setHeight:(CGFloat)height
{
    self.size = CGSizeMake(self.width, height);
}

- (CGSize)size
{
    return self.frame.size;
}
- (void)setSize:(CGSize)size
{
    self.frame = CGRectMake(self.x, self.y, size.width, size.height);
}

/**
 * setCornerRadius   给view设置圆角
 * @param value      圆角大小
 * @param rectCorner 圆角位置
 **/
- (void)setCornerRadius:(CGFloat)value addRectCorners:(UIRectCorner)rectCorner {
    
    [self layoutIfNeeded];   // 这句代码很重要，不能忘了
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rectCorner cornerRadii:CGSizeMake(value, value)];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = self.bounds;
    shapeLayer.path = path.CGPath;
    self.layer.mask = shapeLayer;
}

@end
