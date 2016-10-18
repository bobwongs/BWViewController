//
//  BWNavigationController.h
//  BWNavigationController
//
//  Created by BobWong on 15/9/14.
//  Copyright (c) 2015年 Bob Wong Studio. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BWNavigationController : UINavigationController

#pragma mark - Initialization

/** UINavigationController的初始化，样式：使用默认的Title字体样式
 *  @param rootViewController 根视图控制器
 *  @param color 导航条的背景色
 */
- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
                        barBackgroundColor:(UIColor *)color;

/** UINavigationController的初始化，样式：自定义默认的Title字体样式
 *  @param rootViewController 根视图控制器
 *  @param color 导航条的背景色
 */
- (instancetype)initCustomTitleWithRootViewController:(UIViewController *)rootViewController
                                   barBackgroundColor:(UIColor *)color;

/** UINavigationController的初始化，样式：使用标题文本属性NSDictionary对象来自定义的Title字体样式
 *  @param rootViewController 根视图控制器
 *  @param color 导航条的背景色
 *  @param dict TitleTextAttributes
 */
- (instancetype)initCustomTitleWithRootViewController:(UIViewController *)rootViewController
                                   barBackgroundColor:(UIColor *)color
                                  titleTextAttributes:(NSDictionary *)dict;

/** UINavigationController的初始化，样式：自定义导航条底部线条样式
 *  @param rootViewController 根视图控制器
 */
- (instancetype)initCustomBottomLineRootViewController:(UIViewController *)rootViewController;

/** UINavigationController的初始化，样式：自定义导航条返回按钮样式和NavigationItem颜色
 *  @param rootViewController 根视图控制器
 *  @param tintColor NavigationItem颜色
 */
- (instancetype)initCustomBackButtonWithRootViewController:(UIViewController *)rootViewController
                                                 tintColor:(UIColor *)tintColor;

@end
