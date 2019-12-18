//
//  MYBaseChapterViewController.m
//  Algorithms
//
//  Created by 温明妍 on 2019/12/18.
//  Copyright © 2019 温明妍. All rights reserved.
//

#import "MYBaseChapterViewController.h"
#import <Masonry/Masonry.h>

@interface MYBaseChapterViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation MYBaseChapterViewController


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
    [self invokeWithTitle:title value:vcString];
}

- (void)invokeWithTitle:(NSString *)title value:(NSString *)vcString {
    
}

#pragma mark - --------------------CustomDelegate--------------
#pragma mark - --------------------Event Response--------------
#pragma mark - --------------------private methods--------------
#pragma mark - --------------------getters & setters & init members ------------------

- (NSDictionary<NSString *,NSString *> *)nameDict {
    return @{
        @"default":@"MYViewController",
    };
}

- (NSArray<NSString *> *)names {
    return @[
        @"default"
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
