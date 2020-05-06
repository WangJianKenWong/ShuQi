//
//  LongMovieChooseVC.m
//  MyApp
//
//  Created by apple on 2020/4/30.
//  Copyright © 2020 tii. All rights reserved.
//

#import "LongMovieChooseVC.h"
#import "LongMovieChooseHaederView.h"

@interface LongMovieChooseVC ()

@end

@implementation LongMovieChooseVC

static NSString * const reuseIdentifier = @"MemberMyCollectLongMovieColCell";

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"筛选";
    UINib *headerNib = [UINib nibWithNibName: @"LongMovieChooseHaederView"
                                      bundle: [NSBundle mainBundle]];
    [self.collectionView registerNib: headerNib
          forSupplementaryViewOfKind: UICollectionElementKindSectionHeader
                 withReuseIdentifier: @"LongMovieChooseHaederView"];
}


#pragma mark <UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(KScreenWidth, 190.f);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    CGFloat widthColView = (KScreenWidth - 19*6) / 3.f;
    CGFloat heightColView = (KScreenWidth - 19*6) / 3.f+45;
    return CGSizeMake(widthColView, heightColView);
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *reusableview = nil ;
    
    if (kind == UICollectionElementKindSectionHeader ){
        LongMovieChooseHaederView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind : UICollectionElementKindSectionHeader withReuseIdentifier : @"LongMovieChooseHaederView" forIndexPath :indexPath];
        reusableview = headerView;
        return reusableview;
    }
    return reusableview;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    return cell;
}

@end
