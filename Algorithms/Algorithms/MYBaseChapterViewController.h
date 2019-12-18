//
//  MYBaseChapterViewController.h
//  Algorithms
//
//  Created by 温明妍 on 2019/12/18.
//  Copyright © 2019 温明妍. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MYBaseChapterViewController : UIViewController

- (NSArray<NSString *> *)names;

- (NSDictionary<NSString *,NSString *> *)nameDict;

- (void)invokeWithTitle:(NSString *)title value:(NSString *)vcString;

@end

NS_ASSUME_NONNULL_END
