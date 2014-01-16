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
    
    CGRect screenRect = [[self window] bounds];
    
    // 创建一个 UIScrollView 对象，将其尺寸设置为窗口大小
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:screenRect];
    [[self window] addSubview:scrollView];
    
    // 创建一个 HypnosisView 对象，将其 frame 的大小设置为屏幕大小的两倍
    CGRect bigRect = screenRect;
    bigRect.size.width *= 2.0;
    bigRect.size.height *= 2.0;
    HypnosisView *view = [[HypnosisView alloc] initWithFrame:bigRect];
    
    // 将新创建的 HypnosistView 对象加入 UIScrollView，而不是窗口(UIWindow *)
    [scrollView addSubview:view];
    
    // 告诉 UIScrollView 对象「取景」范围有多大
    [scrollView setContentSize:bigRect.size];
    
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

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
