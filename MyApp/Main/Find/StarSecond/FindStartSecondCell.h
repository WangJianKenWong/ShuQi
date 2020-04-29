//
//  FindStartSecondCell.h
//  MyApp
//
//  Created by apple on 2020/4/29.
//  Copyright © 2020 tii. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FindStartSecondCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UICollectionView *collection;
@property (nonatomic, strong) UIViewController *currentVC;

@end

NS_ASSUME_NONNULL_END
