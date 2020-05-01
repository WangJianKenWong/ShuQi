//
//  FindStartSecondVC.m
//  MyApp
//
//  Created by apple on 2020/4/29.
//  Copyright © 2020 tii. All rights reserved.
//

#import "FindStartSecondVC.h"
#import "FindStartSecondHeaderView.h"
#import "FindStartSecondFooterView.h"

@interface FindStartSecondVC ()

@end

@implementation FindStartSecondVC

static NSString * const reuseIdentifier = @"FindStartSecondCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    ViewRadius(_longMovieImg, 7.f);
    self.collectionView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-100);
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
    return CGSizeMake(KScreenWidth, 20.f);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(KScreenWidth, 32.f);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    CGFloat widthColView = (KScreenWidth - 19*6) / 3.f;
    CGFloat heightColView = (KScreenWidth - 19*6) / 3.f+45;
    return CGSizeMake(widthColView, heightColView);
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *reusableview = nil ;
    if (kind == UICollectionElementKindSectionHeader ){
        FindStartSecondHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind : UICollectionElementKindSectionHeader withReuseIdentifier : @"FindStartSecondHeaderView" forIndexPath :indexPath];
        reusableview = headerView;
        return reusableview;
    }
    if (kind == UICollectionElementKindSectionFooter){
        FindStartSecondFooterView *footerview = [collectionView dequeueReusableSupplementaryViewOfKind : UICollectionElementKindSectionFooter withReuseIdentifier : @"FindStartSecondFooterView" forIndexPath :indexPath];
        [footerview.moreBtn buttonDistance:6.67f direction:right];
        reusableview = footerview;
    }
    return reusableview;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    return cell;
}

@end
