//
//  LongMovieSecondColVC.m
//  MyApp
//
//  Created by apple on 2020/4/30.
//  Copyright © 2020 tii. All rights reserved.
//

#import "LongMovieSecondColVC.h"
#import "LongMovieColCell.h"
#import "LongMovieSectionHaederColCell.h"
#import "LongMovieSectionFooterColCell.h"
#import "SDCycleScrollView.h"
#import "LongMovieChooseVC.h"

@interface LongMovieSecondColVC ()<SDCycleScrollViewDelegate>

@end

@implementation LongMovieSecondColVC

static NSString * const reuseIdentifier = @"LongMovieColCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    ViewRadius(_longMovieImg, 7.f);
    UINib *headerNib = [UINib nibWithNibName: @"LongMovieSectionHaederColCell"
                                      bundle: [NSBundle mainBundle]];
    [self.collectionView registerNib: headerNib
          forSupplementaryViewOfKind: UICollectionElementKindSectionHeader
                 withReuseIdentifier: @"LongMovieSectionHaederColCell"];
    UINib *footerNib = [UINib nibWithNibName: @"LongMovieSectionFooterColCell"
                                      bundle: [NSBundle mainBundle]];
    [self.collectionView registerNib: footerNib
          forSupplementaryViewOfKind: UICollectionElementKindSectionFooter
                 withReuseIdentifier: @"LongMovieSectionFooterColCell"];
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return CGSizeMake(KScreenWidth, 241.f+47);
    }
    return CGSizeZero;//宽默认

}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    if (section == 2) {
        return CGSizeZero;//宽默认
    }
    return CGSizeMake(KScreenWidth, 80);//宽默认
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    CGFloat widthColView = (KScreenWidth - 14*2-30) / 3.f;
    CGFloat heightColView = (KScreenWidth - 14*2-30) / 3.f+50;
    return CGSizeMake(widthColView, heightColView);
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *reusableview = nil ;
    if (kind == UICollectionElementKindSectionHeader ){
        LongMovieSectionHaederColCell *headerView = [collectionView dequeueReusableSupplementaryViewOfKind : UICollectionElementKindSectionHeader withReuseIdentifier : @"LongMovieSectionHaederColCell" forIndexPath :indexPath];
        [headerView.chooseBtn addTarget:self action:@selector(goToChoose) forControlEvents:UIControlEventTouchUpInside];
        reusableview = headerView;
        return reusableview;
    }
    if (kind == UICollectionElementKindSectionFooter){
        LongMovieSectionFooterColCell *footerview = [collectionView dequeueReusableSupplementaryViewOfKind : UICollectionElementKindSectionFooter withReuseIdentifier : @"LongMovieSectionFooterColCell" forIndexPath :indexPath];
        reusableview = footerview;
    }
    return reusableview;
}
- (void)addBannerView:(UIView *)bannerView{
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    return cell;
}
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    
}
- (void)goToChoose{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"LongMovie" bundle:nil];
    LongMovieChooseVC *longMovieChooseVC = [sb instantiateViewControllerWithIdentifier:@"LongMovieChooseVC"];
    [self.navigationController pushViewController:longMovieChooseVC animated:YES];
}
@end
