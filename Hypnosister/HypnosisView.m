//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Yin on 14-1-16.
//  Copyright (c) 2014年 Jack Yin. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

- (void)drawRect:(CGRect)dirtyRect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect bounds = [self bounds];
    
    // 根据 bounds 计算中心点
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    // 计算圆的半径，使其大小能撑满整个视图
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    // 用 10 点的宽度绘制所有的线条
    CGContextSetLineWidth(ctx, 10);
    
    // 将线条颜色设为淡灰 (red/green/blue = 0.6, alpha = 1.0);
    CGContextSetRGBStrokeColor(ctx, 0.6, 0.6, 0.6, 1.0);
    
    // 按半径从大到小绘制多个同心圆
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        CGContextAddArc(ctx, center.x, center.y, currentRadius, 0.0, M_PI * 2.0, YES);
        
        // 执行绘图操作；移除路径
        CGContextStrokePath(ctx);
    }
}

@end
