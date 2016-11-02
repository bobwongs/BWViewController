# iOS ViewController
iOS Xcode项目中的ViewController开发经验总结

## Contents

- ViewController项目开发经验
- 应用的ViewController框架设计
- UINavigationController
- UITabBarController

## ViewController项目开发经验

复杂视图可以考虑使用一个ViewController包含多个子ViewController；

ViewController代码模板的维护；

## 应用的ViewController框架设计

> 设计一

主页TabBarController中嵌套多个NavigationController；如果需要登录或者其他特殊页面则可以从主页Present出来ViewController；

> 研究项

学习优秀App的ViewController框架；

## UINavigationController

>  开发经验

通过继承UINavigationController来自定义适合项目的NavigationController，不建议使用Category；

巧妙运用UINavigationControllerDelegate和继承于父控制器来解决一些问题；

在自定义ViewController上编写生成导航条返回按钮事件；

> 全屏手势右滑

描述

​	导航控制器全屏手势右滑返回；

实现

​	原理

​		通过KVC改写UINavigationController的私有成员属性；

​	实现方案

​		方案一：继承UINavigationController，重写viewDidLoad方法；

​		方案二：通过创建Category来重写load方法；

代码

```
// 获取手势，并且关闭此手势

UIGestureRecognizer *gestureRecognizer = self.interactivePopGestureRecognizer;

gestureRecognizer.enabled = NO;

// 获取手势的回调数组

NSMutableArray *arrayTargets = [gestureRecognizer valueForKey:@"_targets"];

// 获取系统的侧滑手势的回调对象和方法

id target = [[arrayTargets firstObject] valueForKey:@"target"];

SEL selector = NSSelectorFromString(@"handleNavigationTransition:");

// 创建一个手势，添加上去

UIPanGestureRecognizer *grPan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:selector];

[gestureRecognizer.view addGestureRecognizer:grPan];
```

>  禁用滑动返回

代码

```
self.navigationController.interactivePopGestureRecognizer.enabled = NO;
```

开发经验

​	在viewDidLoad上禁用，在viewDidDisappear上启用，就不会导致所有相关的导航界面手势右滑失效；

> 自定义导航条样式

​	隐藏线条

​		代码

```
- (instancetype)initCustomBottomLineRootViewController:(UIViewController *)rootViewController

{

    if (self = [super initWithRootViewController:rootViewController]) {

        [self.navigationBar setBackgroundImage:[[self class] imageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];  // 设置导航条背景Image来隐藏线条

        self.navigationBar.shadowImage = [[UIImage alloc] init];  // 设置这个为[UIImage new]对象的话，在切换视图的时候导航条的渐变色会很突兀，因为没有背景图

    // [self.navigationBar addSubview:line];  // 自定义线条

    }

    return self;

}
```

>  自定义导航条颜色

​	描述

​		导航条颜色；

​		导航条背景色（毛玻璃背景色）；

​		导航条Item颜色；

​		导航条Title样式；

​	代码

```
- (instancetype)initWithRootViewController:(UIViewController *)rootViewController

                        barBackgroundColor:(UIColor *)color

{

    if (self = [super initWithRootViewController:rootViewController]) {

self.navigationBar.barTintColor = color;  // 导航条颜色

self.navigationBar.backgroundColor = color;  // 导航条背景色

self.navigationBar.tintColor = color;  // 导航条Item颜色

self.navigationBar.titleTextAttributes = dictAttribute; // 导航条Title样式

    }

    return self;

}

NSDictionary * dictAttribute = @{

                                     UITextAttributeTextColor : color,

                                     UITextAttributeFont : font,

          };
```

> 自定义导航条返回按钮

​	描述

​		自定义导航条返回按钮样式；

​	实现

​		实现方案

​			方案一：self.navigationItem.leftBarButtonItem

​				在自定义基视图控制器中编写设置导航条返回按钮的方法；

​				可能潜在问题的解决方案

​				如果使用自定义的按钮去替换系统默认返回按钮，会出现滑动返回手势失效的情况。解决方法		也很简单，只需要重新添加导航栏的interactivePopGestureRecognizer的delegate即可。首先为ViewContoller添加UIGestureRecognizerDelegate协议，然后设置代理：self.navigationController.interactivePopGestureRecognizer.delegate = self（待验证，当前好像能支持手势右滑，iOS 9系统）;

​				需要兼容好push一个新视图马上进行右滑返回会闪退的Bug；

​			方案二：UINavigationBar Appearance全局更改返回按钮样式；

​			方案三：self.navigationItem.backBarButtonItem

​				弊端

​					不能自定义backBarButtonItem的返回事件；需要通过viewDidDisappear来定义返回事件；

​			方案四：自定义NavigationController；

机制

1、如果B视图有一个自定义的左侧按钮（leftBarButtonItem），则会显示这个自定义按钮；

2、如果B没有自定义按钮，但是A视图的backBarButtonItem属性有自定义项，则显示这个自定义项；

3、如果前2条都没有，则默认显示一个后退按钮，后退按钮的标题是A视图的标题；

代码

 方案一

```
// 创建Button

CGFloat height = 30, h_bar = 44;

CGFloat width_back_image = height / 2, width_title = 40;

UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];

button.frame = CGRectMake(0, (h_bar - height) / 2, width_back_image + width_title, height);  // 15：按钮图像宽度，40：按钮文本宽度

[button setImage:[UIImage imageNamed:@"bw_icon_back_100"] forState:UIControlStateNormal];

[button setTitle:@"返回" forState:UIControlStateNormal];

[button setTitleColor:UIColor.grayColor forState:UIControlStateHighlighted];

[button addTarget:self action:@selector(btnActionBack) forControlEvents:UIControlEventTouchUpInside];

// 设置leftBarButtonItem

UIBarButtonItem *itemLeft = [[UIBarButtonItem alloc] initWithCustomView:button];

UIBarButtonItem * spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];  // 创建UIBarButtonSystemItemFixedSpace

spaceItem.width = -15;  // 创建UIBarButtonSystemItemFixedSpace的Item，让返回按钮紧靠屏幕边缘

self.navigationItem.leftBarButtonItems = @[spaceItem, itemLeft];
```

方案二

仅有返回图片（适配了iOS6，看看有没更新的方法）

```
UIImage *backButtonImage = [[UIImage imageNamed:@"fanhui.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 30, 0, 0)];

[[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];

//将返回按钮的文字position设置不在屏幕上显示

[[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin) forBarMetrics:UIBarMetricsDefault];
```

> 隐藏导航条

​	代码

​		隐藏不伴随动画

```
self.navigationController.navigationBarHidden = YES;
```

​		隐藏伴随动画

```
[self.navigationController setNavigationBarHidden:YES animated:YES];
```

>  隐藏返回键

```
self.navigationItem.hidesBackButton = YES;
```

​	注：一般不用隐藏，因为隐藏的话手势右滑事件会失效，直接自定义设置左侧的leftBarButtonItem，或者在上一个视图控制器中对返回按钮进行设置；

> 隐藏主视图的NavigationBar

实现UINavigationController Delegate的一个方法

```
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{

if ( viewController == [self.navigationController.viewControllers firstObject]) {

[navigationController setNavigationBarHidden:YES animated:animated];

}

else if ( [navigationController isNavigationBarHidden] ) {

[navigationController setNavigationBarHidden:NO animated:animated];

}

}
```

> 手势右滑返回事件（待研究）

​	实现

​		方案一：禁止手势右滑返回事件；

​		方案二：更换手势代理，重写代理事件；

​			代码

```
self.navigationController.interactivePopGestureRecognizer.delegate = self;

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {

    return NO;

}
```

>  其他

​	导航条不要透明度；

​	导航条渐变样式；

​	从有导航条的页面转场到无导航条界面的切换；

## UITabBarController

> 开发经验

TabBarItem的Title和导航条的Title不同时候的设置；

> 自定义TabBar样式

设置UITabBar背景视图

```
mainTabBarVC.tabBar.backgroundColor = [UIColor greenColor];     // 更改TabBar的背景色，缺点：带有系统给的渐变色，不能按照自己想要的颜色来进行设置

mainTabBarVC.tabBar.backgroundImage = [UIImage imageNamed:@"tabBar_bg"];    // 设置背景图片，不会有系统给的渐变色，所以如果想要设置不带渐变色的背景颜色和背景图片则可以使用此方式
```

设置选中UITabBarItem的颜色

```
mainTabBarVC.tabBar.tintColor = [UIColor whiteColor];   // 更改选中的TabBarItem的颜色
```

设置选中TabBarItem的背景图

```
mainTabBarVC.tabBar.selectionIndicatorImage = [UIImage imageNamed:@"selected_bg"];  // 设置选中TabBarItem的背景图，缺点：不能够自适配TabBarItem的尺寸大小，如果图片过大的话会超出
```

设置UITabBarItem右上角的数值

​	代码

```
self.tabBarItem.badgeValue = badgeString;
```

​	实用代码
// 数量为0的时候不显示，超过99时显示99+

```
- (void)bw_setVCTabBarItemBadge:(NSInteger)badgeNum {

  NSString *badgeString = nil;

  if (badgeNum >= 100) {

      badgeString = @"99+";

  }

  else if (badgeNum != 0) {

      badgeString = @(badgeNum).stringValue;

  }

  self.tabBarItem.badgeValue = badgeString;

}

```

> 屏蔽某个UITabBarItem的选中事件

设置代理UITabBarController Delegate

```
[self.tabBarController setDelegate:self];
```

实现代理方法

```
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {

//屏蔽某个UITabBarItem的选中事件

if ([viewController isKindOfClass:[SecondTabController class]]) {

NSLog(@"hi!");

return NO;

}

return YES;

}

```

> 隐藏UITabBar

​	系统自带的解决方案（结合UINavigationController一起使用）
​		设置跳转到的目标视图

```
nextVC.hidesBottomBarWhenPushed = YES;
```

其他解决方案
​	方案一

```
- (void)hidesTabBar:(BOOL)hidden{

[UIView beginAnimations:nil context:NULL];

[UIView setAnimationDuration:0.25];

UIView *view = self.tabBarController.tabBar;

if (hidden) {

[view setFrame:CGRectMake(view.frame.origin.x, [UIScreen mainScreen].bounds.size.height, view.frame.size.width , view.frame.size.height)];

}

else{

[view setFrame:CGRectMake(view.frame.origin.x, [UIScreen mainScreen].bounds.size.height - 49, view.frame.size.width, view.frame.size.height)];

}

[UIView commitAnimations];

}
```

方案二
​	设置UINavigationController的显示代理方法；

> 自定义UITabBarController的底部视图

​	描述
​		需求要求底部视图的特殊样式；
​	解决方案
​		方案一
​			隐藏原来的UITabBar，然后在其位置加上自定义的选项视图，然后对自定义选项的选中事件响应UITabBarItem的选中事件；