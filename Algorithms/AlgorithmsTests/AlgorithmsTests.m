//
//  AlgorithmsTests.m
//  AlgorithmsTests
//
//  Created by WenMingYan on 2020/5/2.
//  Copyright © 2020 温明妍. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MYMergeListNode.h"

@interface AlgorithmsTests : XCTestCase

@end

@implementation AlgorithmsTests

- (void)setUp {
    
}

- (void)tearDown {

}

- (void)testMergeListNode {
    MYListNode *listNode = [MYMergeListNode mergeTwoListNode:nil withAnother:nil];
    XCTAssertTrue(listNode == nil,@"");
}

@end
 
