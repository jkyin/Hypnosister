//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Yin on 14-1-16.
//  Copyright (c) 2014年 Jack Yin. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView

- (void)drawRect:(CGRect)dirtyRect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect bounds = [self bounds];
    
    // 根据 bounds 计算中心点
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    // 计算圆的半径，使其大小能撑满整个视图
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 4.0;
    
    // 用 10 点的宽度绘制所有的线条
    CGContextSetLineWidth(ctx, 10);
    
    // 将线条颜色设为淡灰 (red/green/blue = 0.6, alpha = 1.0);
    CGContextSetRGBStrokeColor(ctx, 0.6, 0.6, 0.6, 1.0);
    
    // 将图形加入视图上下文——这行代码不会画出这个图形
    CGContextAddArc(ctx, center.x, center.y, maxRadius, 0.0, M_PI * 2.0, YES);
    
    // 执行绘图指令，根据当前的绘图状态画出上下文中的图形
    CGContextStrokePath(ctx);
}

@end
