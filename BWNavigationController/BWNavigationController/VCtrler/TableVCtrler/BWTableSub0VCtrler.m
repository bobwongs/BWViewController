//
//  BWTableSub0VCtrler.m
//  BWNavigationController
//
//  Created by BobWong on 15/9/15.
//  Copyright (c) 2015年 Bob Wong Studio. All rights reserved.
//

#import "BWTableSub0VCtrler.h"

@interface BWTableSub0VCtrler ()

@end

@implementation BWTableSub0VCtrler

- (void)initNavigationItem
{
    [super initNavigationItem];
    
    UIView * titleView = [[UIView alloc] init];
    titleView.frame = CGRectMake(0, 0, 100, NAVIGATION_BAR_HEIGHT);
    titleView.backgroundColor = [UIColor greenColor];
    [self setTitleView:titleView];
}

@end
