//
//  MemberMyCollectStartVC.m
//  MyApp
//
//  Created by apple on 2020/4/28.
//  Copyright © 2020 tii. All rights reserved.
//

#import "MemberMyCollectStartVC.h"
#import "MemberMyCollectStartColCell.h"

@interface MemberMyCollectStartVC ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation MemberMyCollectStartVC{
    CGFloat widthColView;
    CGFloat heightColView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.sectionInset = UIEdgeInsetsMake(15.0, 19.0, 15.0, 19.0);
    CGFloat heightY = kIs_iPhoneX?88:64;
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, KScreenHeight-45-heightY) collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    widthColView = (KScreenWidth - 19*6) / 3.f;
    heightColView = (KScreenWidth - 19*6) / 3.f+45;
    [_collectionView registerNib:[UINib nibWithNibName:@"MemberMyCollectStartColCell" bundle:nil] forCellWithReuseIdentifier:@"MemberMyCollectStartColCell"];
    [self.view addSubview:_collectionView];
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

@end
