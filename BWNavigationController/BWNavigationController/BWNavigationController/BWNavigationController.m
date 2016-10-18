//
//  BWNavigationController.m
//  BWNavigationController
//
//  Created by BobWong on 15/9/14.
//  Copyright (c) 2015年 Bob Wong Studio. All rights reserved.
//

#import "BWNavigationController.h"


@interface BWNavigationController ()

@end

@implementation BWNavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
                        barBackgroundColor:(UIColor *)color
{
    if (self = [super initWithRootViewController:rootViewController]) {
        if ([[[UIDevice currentDevice] systemVersion] intValue] >= 7) {
            self.navigationBar.barTintColor = color;
        } else {
            [self.navigationBar setBackgroundImage:[[self class] imageWithColor:color] forBarMetrics:UIBarMetricsDefault];
        }
    }
    
    return self;
}

- (instancetype)initCustomTitleWithRootViewController:(UIViewController *)rootViewController
                                   barBackgroundColor:(UIColor *)color
{
    // 自定义默认的Title属性
    NSDictionary * textAttribute = @{
                                     UITextAttributeTextColor : [UIColor greenColor],
                                     UITextAttributeFont : [UIFont systemFontOfSize:20],
                                     UITextAttributeTextShadowColor : [UIColor colorWithRed:0 green:0 blue:0 alpha:0.0],
                                     UITextAttributeTextShadowOffset : [NSValue valueWithUIOffset:UIOffsetMake(0, 1)]
                                     };
    
    if (self = [self initCustomTitleWithRootViewController:rootViewController barBackgroundColor:color titleTextAttributes:textAttribute]) {
        
    }
    
    return self;
}

- (instancetype)initCustomTitleWithRootViewController:(UIViewController *)rootViewController
                                   barBackgroundColor:(UIColor *)color
                                  titleTextAttributes:(NSDictionary *)dict
{
    if (self = [super initWithRootViewController:rootViewController]) {
        if ([[[UIDevice currentDevice] systemVersion] intValue] >= 7) {
            self.navigationBar.barTintColor = color;
        } else {
            [self.navigationBar setBackgroundImage:[[self class] imageWithColor:color] forBarMetrics:UIBarMetricsDefault];
        }
        
        self.navigationBar.titleTextAttributes = dict;
    }
    
    return self;
}

- (instancetype)initCustomBottomLineRootViewController:(UIViewController *)rootViewController
{
    if (self = [super initWithRootViewController:rootViewController]) {
        // 隐藏线条
        [self.navigationBar setBackgroundImage:[[self class] imageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];  // 设置这个为[UIImage new]对象的话，在切换视图的时候导航条的渐变色会很突兀，因为没有背景图
        self.navigationBar.shadowImage = [[UIImage alloc] init];
        
        // 自定义线条
//        [self.navigationBar addSubview:line];
    }
    
    return self;
}

- (instancetype)initCustomBackButtonWithRootViewController:(UIViewController *)rootViewController
                                                 tintColor:(UIColor *)tintColor
{
    if (self = [super initWithRootViewController:rootViewController]) {
        self.navigationBar.tintColor = tintColor;
        
        UIImage * image = [[self class] imageWithColor:[UIColor greenColor] width:15 height:NAVIGATION_BAR_HEIGHT];
        
#if 0
        // iOS 7 自定义返回按钮图像（不建议使用，自定义的视图会高到状态栏）
        if (isAfterIOS7) {
            nvgtVC.navigationBar.backIndicatorImage = image;
            nvgtVC.navigationBar.backIndicatorTransitionMaskImage = image;
        }
#else
        // 改变全局（建议实用，自定义的视图刚刚好，但是如果要为某些界面定制时就再改，返回来的时候改回来就行）
        [[UIBarButtonItem appearance] setBackButtonBackgroundImage:image forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];  // 返回按钮图像
        [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(10, 0) forBarMetrics:UIBarMetricsDefault];  // 返回按钮文本缩进
#endif
    }
    
    return self;
}

#pragma mark - UI Utility

+ (UIImage *)imageWithColor:(UIColor*)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage * theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}


+ (UIImage *)imageWithColor:(UIColor*)color
                      width:(CGFloat)width
                     height:(CGFloat)height
{
    CGRect rect = CGRectMake(0.0f, 0.0f, width, height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage * theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
