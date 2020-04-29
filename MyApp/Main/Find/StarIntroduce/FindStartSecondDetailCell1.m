//
//  FindStartSecondDetailCell1.m
//  MyApp
//
//  Created by apple on 2020/4/29.
//  Copyright © 2020 tii. All rights reserved.
//

#import "FindStartSecondDetailCell1.h"
#import "FindStartSecondDetailColCell.h"

@interface FindStartSecondDetailCell1 ()<UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation FindStartSecondDetailCell1{
    CGFloat widthColView;
    CGFloat heightColView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    _collection.delegate = self;
    _collection.dataSource = self;
    widthColView = (KScreenWidth - 14*2-20) / 3.f;
    heightColView = (KScreenWidth - 14*2-20) / 3.f+40;
    [_collection registerNib:[UINib nibWithNibName:@"FindStartSecondDetailColCell" bundle:nil] forCellWithReuseIdentifier:@"FindStartSecondDetailColCell"];
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
        FindStartSecondDetailColCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FindStartSecondDetailColCell" forIndexPath:indexPath];
        return cell;
    }
    return cell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
