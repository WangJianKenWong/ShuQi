//
//  FindStartSecondVC.h
//  MyApp
//
//  Created by apple on 2020/4/29.
//  Copyright © 2020 tii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZJScrollPageViewDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface FindStartSecondVC : UICollectionViewController<ZJScrollPageViewChildVcDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *longMovieImg;
@property (weak, nonatomic) IBOutlet UIButton *moreBtn;

@end

NS_ASSUME_NONNULL_END
