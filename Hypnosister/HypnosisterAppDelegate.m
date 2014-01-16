//
//  HypnosisterAppDelegate.m
//  Hypnosister
//
//  Created by Yin on 14-1-16.
//  Copyright (c) 2014年 Jack Yin. All rights reserved.
//

#import "HypnosisterAppDelegate.h"
#import "HypnosisView.h"

@implementation HypnosisterAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
    
    CGRect screenRect = [[self window] bounds];
    
    // 创建一个 UIScrollView 对象，将其尺寸设置为窗口大小
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:screenRect];
    
    // 设置缩放系数
    [scrollView setMinimumZoomScale:1.0];
    [scrollView setMaximumZoomScale:5.0];
    
    // 设置委托对象
    [scrollView setDelegate:self];
    
    [[self window] addSubview:scrollView];

    
    // 创建一个 HypnosisView 对象
    CGRect bigRect = screenRect;
    view = [[HypnosisView alloc] initWithFrame:screenRect];
    
    // 将新创建的 HypnosistView 对象加入 UIScrollView，而不是窗口(UIWindow *)
    [scrollView addSubview:view];
    

    
    // 告诉 UIScrollView 对象「取景」范围有多大
    [scrollView setContentSize: bigRect.size];
    
    BOOL success = [view becomeFirstResponder];
    
    if (success) {
        NSLog(@"HypnosisView became the first responder");
    }else {
        NSLog(@"Oops!Could not became the first responder");
    }
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return view;
}
@end
