//
//  LongMovieSecondColVC.h
//  MyApp
//
//  Created by apple on 2020/4/30.
//  Copyright © 2020 tii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZJScrollPageViewDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface LongMovieSecondColVC : UICollectionViewController<ZJScrollPageViewChildVcDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *longMovieImg;

@end

NS_ASSUME_NONNULL_END
