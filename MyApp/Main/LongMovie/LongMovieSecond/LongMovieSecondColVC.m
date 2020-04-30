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

@interface LongMovieSecondColVC ()<SDCycleScrollViewDelegate>

@end

@implementation LongMovieSecondColVC

static NSString * const reuseIdentifier = @"LongMovieColCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    ViewRadius(_longMovieImg, 7.f);
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
    return CGSizeMake(KScreenWidth, 47);//宽默认
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
        ViewRadius(headerView.chooseBtn, headerView.chooseBtn.bounds.size.height*0.5);
        [headerView.chooseBtn buttonDistance:4.f direction:left];
        [self addBannerView:headerView.adBannerView];
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
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:bannerView.bounds delegate:self placeholderImage:[UIImage imageNamed:@"short"]];
    NSArray *imagesURLStrings = @[
    @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
    @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
    @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
    ];
    cycleScrollView.imageURLStringsGroup = imagesURLStrings;
    cycleScrollView.delegate = self;
    cycleScrollView.pageDotImage = ImageNamed(@"address_wuliu_nol");
    cycleScrollView.currentPageDotImage = ImageNamed(@"adDot");
    cycleScrollView.pageControlBottomOffset = -25;
    [bannerView addSubview:cycleScrollView];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    return cell;
}
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    
}
@end
