//
//  FindStartSecondCell.m
//  MyApp
//
//  Created by apple on 2020/4/29.
//  Copyright © 2020 tii. All rights reserved.
//

#import "FindStartSecondCell.h"
#import "MemberMyCollectStartColCell.h"
#import "FindStartSecondDetailVC.h"

@interface FindStartSecondCell ()<UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation FindStartSecondCell{
    CGFloat widthColView;
    CGFloat heightColView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    _collection.delegate = self;
    _collection.dataSource = self;
    widthColView = (KScreenWidth - 19*6) / 3.f;
    heightColView = (KScreenWidth - 19*6) / 3.f+45;
    [_collection registerNib:[UINib nibWithNibName:@"MemberMyCollectStartColCell" bundle:nil] forCellWithReuseIdentifier:@"MemberMyCollectStartColCell"];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return CGSizeMake(widthColView, heightColView);
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = nil;
    if (!cell) {
        MemberMyCollectStartColCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MemberMyCollectStartColCell" forIndexPath:indexPath];
        return cell;
    }
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [_currentVC.navigationController pushViewController:[FindStartSecondDetailVC new] animated:YES];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
