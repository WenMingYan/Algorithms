//
//  MYChapter0ViewController.m
//  Algorithms
//
//  Created by 温明妍 on 2019/12/18.
//  Copyright © 2019 温明妍. All rights reserved.
//

#import "MYChapter0ViewController.h"
#import "MYSunUtils.h"

@interface MYChapter0ViewController ()

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation MYChapter0ViewController

- (void)invokeWithTitle:(NSString *)title value:(NSString *)vcString {
    if ([self respondsToSelector:NSSelectorFromString(vcString)]) {
        [self performSelector:NSSelectorFromString(vcString)];
    }
}

- (void)invokeSunSet {
    NSDate *date = [MYSunUtils sunSetTimeWithLongitude:0 andLatitude:0];
    NSLog(@"date = %@",date);
}

- (void)invokeSunRaise {
    NSDate *date = [MYSunUtils sunRaiseTimeWithLongitude:0 andLatitude:0];
    NSLog(@"date = %@",date);
}

- (NSDictionary<NSString *,NSString *> *)nameDict {
    return @{
        @"sun set":@"invokeSunSet",
        @"sun raise":@"invokeSunRaise",
    };
}

- (NSArray<NSString *> *)names {
    return @[
        @"sun set",
        @"sun raise"
    ];
}

@end
