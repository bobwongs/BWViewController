//
//  BWBasicVCtrler.m
//  BWNavigationController
//
//  Created by BobWong on 15/9/15.
//  Copyright (c) 2015年 Bob Wong Studio. All rights reserved.
//

#import "BWBasicVCtrler.h"


@interface BWBasicVCtrler ()

@end

@implementation BWBasicVCtrler

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
    
}

- (void)viewDidDisappear:(BOOL)animated
{
    if ([self.navigationController.viewControllers indexOfObject:self] == NSNotFound) {
        // back button was pressed.  We know this is true because self is no longer
        // in the navigation stack.
        
        NSLog(@"hello");
    }
    
    [super viewWillDisappear:animated];
}

#pragma mark - Data

- (void)setTitle:(NSString *)title
{
    [super setTitle:title];
}

#pragma mark - UI - NavigationBar

- (void)setTitleView:(UIView *)view
{
    self.navigationItem.titleView = view;
}

- (void)setLeftBarButtonItemTitle:(NSString *)title
{
    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonAct:)];
    
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)setLeftBarButtonItemView:(UIView *)view
{
    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc] initWithCustomView:view];
    
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)setRightBarButtonItemTitle:(NSString *)title
{
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonAct:)];
    
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)setRightBarButtonItemView:(UIView *)view
{
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc] initWithCustomView:view];
    
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)setBackBarButtonTitle:(NSString *)title
{
#if 0
    
    // 不能手势右滑，不建议实用
    [self setLeftBarButtonItemTitle:title];
    
#else
    
    // 自定义返回按钮文本，强烈建议使用
    // 在此返回文本设置为空，即导航条只有一个返回icon；如果要自定义返回按钮文本则设置Title即可
    UIBarButtonItem * backItem = [[UIBarButtonItem alloc] initWithTitle:@"《返回" style:UIBarButtonItemStylePlain target:self action:@selector(backItemAct:)];
    self.navigationItem.backBarButtonItem = backItem;
    
#endif
}

- (void)setBackBarButton2Title:(NSString *)title
{
    
}

#pragma mark - Interaction Event

- (void)leftBarButtonAct:(UIBarButtonItem *)sender
{
    NSLog(@"left bar button!");
}

- (void)rightBarButtonAct:(UIBarButtonItem *)sender
{
    NSLog(@"bar button act!");
}

- (void)backItemAct:(UIBarButtonItem *)sender
{
    NSLog(@"pop viewcontroller!");
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
