//
//  MYChatper1ViewController.m
//  Algorithms
//
//  Created by 温明妍 on 2019/12/16.
//  Copyright © 2019 温明妍. All rights reserved.
//  第一章的vc

#import "MYChatper1ViewController.h"
#import <Masonry/Masonry.h>
#import "MYSortUtils.h"

@implementation MYChatper1ViewController

- (void)invokeWithTitle:(NSString *)title value:(NSString *)vcString {
    if ([self respondsToSelector:NSSelectorFromString(vcString)]) {
        [self performSelector:NSSelectorFromString(vcString)];
    }
}

- (void)insertionSort {
    NSArray *array = @[@5,@2,@4,@6,@1,@3];
    NSArray *result = [MYSortUtils insertionSortingWithArray:array];
    NSLog(@"result = %@",result);
}

- (NSDictionary<NSString *,NSString *> *)nameDict {
    return @{
        @"insertion Sort":@"insertionSort",
    };
}

- (NSArray<NSString *> *)names {
    return @[
        @"insertion Sort",
    ];
}

@end
