//
//  InsertionSort.m
//  Algorithms
//
//  Created by 明妍 on 2019/4/11.
//  Copyright © 2019 明妍. All rights reserved.
//

#import "MYInsertionSort.h"
#import "MYLinkNode.h"

@implementation MYInsertionSort

+ (NSArray<NSNumber *> *)insertionSortWithArray:(NSArray<NSNumber *> *)sortArray {
    NSMutableArray *result = [NSMutableArray arrayWithArray:sortArray];
    for (int i = 1; i < result.count; i++) {
        NSInteger key = [[result objectAtIndex:i] integerValue];
        for (int j = 0; j < i ; j++) {
            NSInteger duibi = [[result objectAtIndex:j] integerValue];
            if (duibi > key) {
                for (int k = i; k > j; k--) {
                    result[k] = result[k - 1];
                }
                result[j] = [NSNumber numberWithInteger:key];
//                NSLog(@"sort = %@",result);
                break;
            }// end of if
        }// end of for j
    }// end of for i
    return result;
    
    
}

+ (NSArray<NSNumber *> *)insertionSortLinkWithArray:(NSArray<NSNumber *> *)sortArray {
    MYLinkNode *node = [MYLinkNode arrayToLineNode:sortArray];
    if (!node) {
        return nil;
    }
    MYLinkNode *headNode = node;
    MYLinkNode *keyNode = node.nextNode.nextNode;
    MYLinkNode *keyNodeNextNode = keyNode.nextNode;
    MYLinkNode *duibiNode = node.nextNode;
    while (keyNode != nil) {
        while (duibiNode != keyNode) {
            if (duibiNode.number > keyNode.number) {
                duibiNode.nextNode = keyNode.nextNode;
                keyNode.preNode = duibiNode.preNode;
                duibiNode.preNode.nextNode = keyNode;
                keyNode.nextNode = duibiNode;
            }
            duibiNode = duibiNode.nextNode;
            break;
        }
        duibiNode = node.nextNode;
        keyNode = keyNodeNextNode;
        keyNodeNextNode = keyNodeNextNode.nextNode;
    }
    return [headNode array];
}

@end
