//
//  BWMainVCtrler.m
//  BWNavigationConroller
//
//  Created by BobWong on 15/9/14.
//  Copyright (c) 2015年 Bob Wong Studio. All rights reserved.
//

#import "BWMainVCtrler.h"
#import "BWTableVCtrler.h"
#import "BWNavigationController.h"
#import "BWTableSub0VCtrler.h"
#import "BWTableSub1VCtrler.h"
#import "BWTableSub2VCtrler.h"
#import "BWTableSub3VCtrler.h"


typedef NS_ENUM(NSInteger, ButtonTag) {
    Button0Tag = 100,
    Button1Tag,
    Button2Tag,
    Button3Tag,
    Button4Tag,
    Button5Tag,
    Button6Tag,
    Button7Tag
};


@interface BWMainVCtrler ()

@end

@implementation BWMainVCtrler

#pragma mark - Initialization

- (instancetype)init
{
    if (self = [super init]) {
        
    }
    
    return self;
}

#pragma mark - View Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initData];
    [self initView];
}

#pragma mark - Data

- (void)initData
{
    
}

#pragma mark - UI

- (void)initView
{
    NSArray * titleArray = @[
                             @"样式1 - 系统",
                             @"样式2 - 自定义NavigationBar的背景色",
                             @"样式3 - 自定义NavigationBar的背景色和Title字体和颜色",
                             @"样式4 - 自定义NavigationBar底部线条样式",
                             @"样式5 - 自定义NavigationBar标题视图",
                             @"样式6 - 自定义NavigationItem",
                             @"样式7 - 自定义返回按钮样式(backBarButtonItem)",
                             @"样式8 - 自定义返回按钮样式(leftBarButtonItem)"
                             ];
    
    for (NSInteger index = 0; index < titleArray.count; index++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.tag = index + Button0Tag;
        button.frame = CGRectMake(0, 50 + 50 * index, SCREEN_WIDTH, 30);
        [button setTitle:titleArray[index] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonAct:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
}

#pragma mark - Interation Event

- (void)buttonAct:(UIButton *)sender
{
    NSInteger buttonTag = sender.tag;
    
    BWTableVCtrler * tableVC = [[BWTableVCtrler alloc] init];
    BWTableSub0VCtrler * tableVC2 = [[BWTableSub0VCtrler alloc] init];
    BWTableSub1VCtrler * tableVC3 = [[BWTableSub1VCtrler alloc] init];
    BWTableSub2VCtrler * tableVC4 = [[BWTableSub2VCtrler alloc] init];
    BWTableSub3VCtrler * tableVC5 = [[BWTableSub3VCtrler alloc] init];
    
    // 样式1 - 系统
    if (buttonTag == Button0Tag) {
        UINavigationController * nvgtVC = [[UINavigationController alloc] initWithRootViewController:tableVC];
        
        [self presentViewController:nvgtVC animated:YES completion:nil];
    }
    
    // 样式2 - 自定义NavigationBar的背景色
    else if (buttonTag == Button1Tag) {
        BWNavigationController * nvgtVC = [[BWNavigationController alloc] initWithRootViewController:tableVC barBackgroundColor:[UIColor whiteColor]];
        
        [self presentViewController:nvgtVC animated:YES completion:nil];
    }
    
    // 样式3 - 自定义NavigationBar的背景色和Title字体和颜色
    else if (buttonTag == Button2Tag) {
        BWNavigationController * nvgtVC = [[BWNavigationController alloc] initCustomTitleWithRootViewController:tableVC barBackgroundColor:[UIColor whiteColor]];
        
        [self presentViewController:nvgtVC animated:YES completion:nil];
    }
    
    // 样式4 - 自定义NavigationBar底部线条样式
    else if (buttonTag == Button3Tag) {
        BWNavigationController * nvgtVC = [[BWNavigationController alloc] initCustomBottomLineRootViewController:tableVC];
        
        [self presentViewController:nvgtVC animated:YES completion:nil];
    }
    
    // 样式5 - 自定义NavigationBar标题视图
    else if (buttonTag == Button4Tag) {
        UINavigationController * nvgtVC = [[UINavigationController alloc] initWithRootViewController:tableVC2];
        
        [self presentViewController:nvgtVC animated:YES completion:nil];
    }
    
    // 样式6 - 自定义NavigationItem
    else if (buttonTag == Button5Tag) {
        UINavigationController * nvgtVC = [[UINavigationController alloc] initWithRootViewController:tableVC3];
        
        [self presentViewController:nvgtVC animated:YES completion:nil];
    }
    
    // 样式7 - 自定义返回按钮样式
    else if (buttonTag == Button6Tag) {
        BWNavigationController * nvgtVC = [[BWNavigationController alloc] initCustomBackButtonWithRootViewController:tableVC4 tintColor:[UIColor greenColor]];
        
        
        [self presentViewController:nvgtVC animated:YES completion:nil];
    }
    
    // 样式8 - 自定义返回按钮样式
    else if (buttonTag == Button7Tag) {
        BWNavigationController * nvgtVC = [[BWNavigationController alloc] initWithRootViewController:tableVC5 barBackgroundColor:[UIColor grayColor]];
        
        [self presentViewController:nvgtVC animated:YES completion:nil];
    }
}

#pragma mark - Tools

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
