//
//  LongMovieSectionHaederColCell.h
//  MyApp
//
//  Created by apple on 2020/5/6.
//  Copyright © 2020 tii. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LongMovieSectionHaederColCell : UICollectionReusableView
@property (weak, nonatomic) IBOutlet UIButton *chooseBtn;
@property (weak, nonatomic) IBOutlet UIView *adBannerView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

NS_ASSUME_NONNULL_END
