//
//  BWTableSub2VCtrler.m
//  BWNavigationController
//
//  Created by BobWong on 15/9/15.
//  Copyright (c) 2015年 Bob Wong Studio. All rights reserved.
//

#import "BWTableSub2VCtrler.h"


@interface BWTableSub2VCtrler ()

@end

@implementation BWTableSub2VCtrler

- (void)setTitle:(NSString *)title
{
    [super setTitle:title];
    
    
    [self setBackBarButtonTitle:@"<返回"];
}

- (void)leftBarButtonAct:(UIBarButtonItem *)sender
{
    [super leftBarButtonAct:sender];
    
    NSLog(@"table sub2 left bar button!");
}

@end
