//
//  MYLinkNode.m
//  Algorithms
//
//  Created by 明妍 on 2019/4/11.
//  Copyright © 2019 明妍. All rights reserved.
//

#import "MYLinkNode.h"

@implementation MYLinkNode


+ (instancetype)arrayToLineNode:(NSArray<NSNumber *> *)array {
    if (!array.count) {
        return nil;
    }
    MYLinkNode *headNode = [[MYLinkNode alloc] init];
    MYLinkNode *linkNode = [[MYLinkNode alloc] init];
    linkNode.preNode = headNode;
    headNode.nextNode = linkNode;
    linkNode.number = [(NSNumber *)array[0] integerValue];
    MYLinkNode *aNode = linkNode;
    for (int i = 1; i < array.count; i++) {
        MYLinkNode *node = [[MYLinkNode alloc] init];
        node.number = [(NSNumber *)array[i] integerValue];
        aNode.nextNode = node;
        node.preNode = aNode;
        aNode = node;
    }
    return headNode;
}

- (NSArray *)array {
    NSMutableArray *array = [NSMutableArray array];
    //TODO: 1. 看看这个是否有用
    MYLinkNode *tempLink = self;
    while (tempLink) {
    [array addObject:[NSNumber numberWithInteger:tempLink.number]];
        tempLink = tempLink.nextNode;
    }
    
    return [array copy];
}

@end
