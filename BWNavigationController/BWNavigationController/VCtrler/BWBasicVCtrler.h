//
//  BWBasicVCtrler.h
//  BWNavigationController
//
//  Created by BobWong on 15/9/15.
//  Copyright (c) 2015年 Bob Wong Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BWBasicVCtrler : UIViewController

#pragma mark - UI - NavigationBar

/**
 *  NavigationBar的标题，样式：视图标题
 *  @param view 标题视图
 */
- (void)setTitleView:(UIView *)view;

/**
 *  NavigationItem的左边按钮，样式：文本
 *  @param title 按钮文本
 */
- (void)setLeftBarButtonItemTitle:(NSString *)title;

/**
 *  NavigationItem的左边按钮，样式：视图
 *  @param view 按钮视图
 */
- (void)setLeftBarButtonItemView:(UIView *)view;

/**
 *  NavigationItem的右边按钮，样式：文本
 *  @param title 按钮文本
 */
- (void)setRightBarButtonItemTitle:(NSString *)title;

/**
 *  NavigationItem的右边按钮，样式：视图
 *  @param view 按钮视图
 */
- (void)setRightBarButtonItemView:(UIView *)view;

/**
 *  NavigationBar的返回按，样式：文本
 *  @param title 按钮文本
 */
- (void)setBackBarButtonTitle:(NSString *)title;

- (void)setBackBarButton2Title:(NSString *)title;

#pragma mark - Interaction Event - Bar Button Item

/**
 *  Bar Button Item 左边
 */
- (void)leftBarButtonAct:(UIBarButtonItem *)sender;

/**
 *  Bar Button Item 右边
 */
- (void)rightBarButtonAct:(UIBarButtonItem *)sender;

/**
 *  Back bar button 返回事件
 */
- (void)backItemAct:(UIBarButtonItem *)sender;

@end
