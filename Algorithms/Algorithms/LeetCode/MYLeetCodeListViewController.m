//
//  MYLeetCodeListViewController.m
//  Algorithms
//
//  Created by WenMingYan on 2020/5/2.
//  Copyright © 2020 温明妍. All rights reserved.
//

#import "MYLeetCodeListViewController.h"
#import <Masonry/Masonry.h>
#import "MYMergeListNode.h"

@interface MYLeetCodeListViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation MYLeetCodeListViewController


#pragma mark - --------------------dealloc ------------------
#pragma mark - --------------------life cycle--------------------

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initView];
}

- (void)initData {
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

- (void)initView {
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - --------------------UITableViewDelegate--------------

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    cell.textLabel.text = [[self names] objectAtIndex:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self names].count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *title = [[self names] objectAtIndex:indexPath.row];
    NSString *vcString = [self nameDict][title];
    SEL selector = NSSelectorFromString(vcString);
    if ([self respondsToSelector:selector]) {
        //TODO: wmy
        [self performSelector:selector];
    }
}

#pragma mark - --------------------Event Response--------------

- (void)mergeListNode {
    NSLog(@"mergeListNode");
    [MYMergeListNode mergeTwoListNode:nil withAnother:nil];
}

#pragma mark - --------------------private methods--------------
#pragma mark - --------------------getters & setters & init members ------------------

- (NSDictionary<NSString *,NSString *> *)nameDict {
    return @{
        @"MergeListNode":@"mergeListNode",
    };
}

- (NSArray<NSString *> *)names {
    return @[
        @"MergeListNode"
    ];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

@end
