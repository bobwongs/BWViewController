//
//  BWTableSub1VCtrler.m
//  BWNavigationController
//
//  Created by BobWong on 15/9/15.
//  Copyright (c) 2015年 Bob Wong Studio. All rights reserved.
//

#import "BWTableSub1VCtrler.h"

@interface BWTableSub1VCtrler ()

@end

@implementation BWTableSub1VCtrler

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)initNavigationItem
{
    [super initNavigationItem];
    
    [self setLeftBarButtonItemTitle:@"左边按钮"];
}

- (void)leftBarButtonAct:(UIBarButtonItem *)sender
{
    NSLog(@"BWTableSub1VCtrler Left UIBarButtonItem");
}

@end
