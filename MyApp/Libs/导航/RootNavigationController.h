//
//  RootNavigationController.h
//  UniversalApp
//
//  Created by iBamboo on 2017/9/15.
//  Copyright © 2017年 iBamboo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootNavigationController : UINavigationController

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;
- (void)popToViewController:(UIViewController *)viewController animated:(BOOL)animated;

@end
