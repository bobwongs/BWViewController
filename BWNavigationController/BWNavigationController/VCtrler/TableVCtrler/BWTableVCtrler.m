//
//  BWTableVCtrler.m
//  BWNavigationConroller
//
//  Created by BobWong on 15/9/14.
//  Copyright (c) 2015年 Bob Wong Studio. All rights reserved.
//

#import "BWTableVCtrler.h"


@interface BWTableVCtrler () <UITableViewDataSource, UITableViewDelegate>
{
    // Data
    NSArray * _dataSource;
    
    // UI
    UITableView * _tableView;
}

@end

@implementation BWTableVCtrler

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
    
    self.title = @"标题Title";
    self.view.backgroundColor = [UIColor whiteColor];
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    [self initData];
    [self initNavigationItem];
    [self initView];
}

#pragma mark - Data

- (void)initData
{
    
}

#pragma mark - UI

- (void)initNavigationItem
{    
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(barButtonAct:)];
    
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)initView
{
    [self initTableView];
}

- (void)initTableView
{
    if (_tableView) {
        [_tableView reloadData];
        
        return ;
    }
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - STATUS_BAR_HEIGHT - NAVIGATION_BAR_HEIGHT) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}

#pragma mark - Interaction Event

- (void)barButtonAct:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITableView Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    cell.textLabel.text = @"Next";
    
    return cell;
}

#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController pushViewController:[[self class] new] animated:YES];
}

@end
