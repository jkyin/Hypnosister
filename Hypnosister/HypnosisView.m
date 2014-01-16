//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Yin on 14-1-16.
//  Copyright (c) 2014年 Jack Yin. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView
@synthesize circleColor;


- (void)setCircleColor:(UIColor *)clr
{
    circleColor = clr;
    [self setNeedsDisplay];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        
        [self setCircleColor:[UIColor lightGrayColor]];
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
    
    [[self circleColor] setStroke];
    
    // 按半径从大到小绘制多个同心圆
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        CGContextAddArc(ctx, center.x, center.y, currentRadius, 0.0, M_PI * 2.0, YES);
        
        // 执行绘图操作；移除路径
        CGContextStrokePath(ctx);
    }
    
    // 创建 NSString 对象
    NSString *text = @"You are getting sleepy.";
    
    // 获取用于绘制字符串的字体
    UIFont *font = [UIFont boldSystemFontOfSize:28];
    
    CGRect textRect;
    
    // 根据之前获取的字体，计算绘制字符串所需的图形大小
    textRect.size = [text sizeWithAttributes:@{NSFontAttributeName: font}];
    
    // 准备将字符串绘制到视图正中
    textRect.origin.x = center.x - textRect.size.width / 2.0;
    textRect.origin.y = center.y - textRect.size.height / 2.0;
    
    // 将上下文的颜色填充为黑色
    [[UIColor blackColor] setFill];
    
    // 根据字符串的绘制位置，创建阴影的偏移量，数值为向右偏 4 点，向下偏 3 点
    CGSize offset = CGSizeMake(4, 3);
    
    // 阴影的颜色是深灰
    CGColorRef color = [[UIColor darkGrayColor] CGColor];
    
    // 将以上得到的结构设置为当前上下文的阴影参数，后续的绘图操作都会附带阴影效果
    CGContextSetShadowWithColor(ctx, offset, 2.0, color);
    
    // 绘制字符串
    [text drawInRect:textRect withAttributes:@{NSFontAttributeName: font}];
    

    
    
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

// 摇动设备时会发送给第一响应对象
- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    // 检测事件类型是否为摇动
    if (motion == UIEventSubtypeMotionShake) {
        NSLog(@"Device started shaking!");
        [self setCircleColor:[UIColor redColor]];
    }
}

@end
