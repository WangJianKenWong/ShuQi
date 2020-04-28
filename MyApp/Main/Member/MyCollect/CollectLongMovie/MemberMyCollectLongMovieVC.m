//
//  MemberMyCollectLongMovieVC.m
//  MyApp
//
//  Created by apple on 2020/4/28.
//  Copyright © 2020 tii. All rights reserved.
//

#import "MemberMyCollectLongMovieVC.h"
#import "MemberMyCollectLongMovieColCell.h"

@interface MemberMyCollectLongMovieVC ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation MemberMyCollectLongMovieVC{
    CGFloat widthColView;
    CGFloat heightColView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.sectionInset = UIEdgeInsetsMake(15.0, 14.0, 15.0, 14.0);
    CGFloat heightY = kIs_iPhoneX?88:64;
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, KScreenHeight-45-heightY) collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    widthColView = (KScreenWidth - 14*2-20) / 3.f;
    heightColView = (KScreenWidth - 14*2-20) / 3.f+40;
    [_collectionView registerNib:[UINib nibWithNibName:@"MemberMyCollectLongMovieColCell" bundle:nil] forCellWithReuseIdentifier:@"MemberMyCollectLongMovieColCell"];
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
        MemberMyCollectLongMovieColCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MemberMyCollectLongMovieColCell" forIndexPath:indexPath];
        return cell;
    }
    return cell;
}

@end
