//
//  BWTableSub3VCtrler.m
//  BWNavigationController
//
//  Created by BobWong on 15/10/23.
//  Copyright © 2015年 Bob Wong Studio. All rights reserved.
//

#import "BWTableSub3VCtrler.h"

@interface BWTableSub3VCtrler ()

@end

@implementation BWTableSub3VCtrler

- (void)setTitle:(NSString *)title
{
    [super setTitle:title];
    
    
    [self setBackBarButton2Title:@"<<返回"];
}

- (void)backItemAct:(UIBarButtonItem *)sender
{
    [super backItemAct:sender];
    
    NSLog(@"table sub3 vctrler!");
}

@end
