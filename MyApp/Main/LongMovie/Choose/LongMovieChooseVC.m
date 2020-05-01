//
//  LongMovieChooseVC.m
//  MyApp
//
//  Created by apple on 2020/4/30.
//  Copyright © 2020 tii. All rights reserved.
//

#import "LongMovieChooseVC.h"
#import "LongMovieChooseHaederView.h"
#import "CBSegmentView.h"

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
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
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
        [self setupHeaderView:headerView];
        reusableview = headerView;
        return reusableview;
    }
    return reusableview;
}
- (void)setupHeaderView:(UIView *)headerView{
    NSArray *array=@[
                         @"第一",
                         @"第二次",
                         @"第三匹马",
                         @"第四首歌曲",
                         @"第五块香酥饼",
                         @"第六碗米饭",
                         @"第七支舞",
                         @"第八回",
                         @"第九"
                         ];
    CBSegmentView *sliderSegmentView1 = [[CBSegmentView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 176*0.25)];
        [headerView addSubview:sliderSegmentView1];
        [sliderSegmentView1 setTitleArray:array withStyle:CBSegmentStyleSlider];
        sliderSegmentView1.titleChooseReturn = ^(NSInteger x) {
          NSLog(@"点击了第%ld个按钮",x+1);
        };
        
        CBSegmentView *sliderSegmentView2 = [[CBSegmentView alloc]initWithFrame:CGRectMake(0, 176*0.25, self.view.frame.size.width, 176*0.25)];
        [headerView addSubview:sliderSegmentView2];
        [sliderSegmentView2 setTitleArray:array withStyle:CBSegmentStyleSlider];
        sliderSegmentView2.titleChooseReturn = ^(NSInteger x) {
            NSLog(@"点击了第%ld个按钮",x+1);
        };
        
        CBSegmentView *sliderSegmentView3 = [[CBSegmentView alloc]initWithFrame:CGRectMake(0, 176*0.5, self.view.frame.size.width, 176*0.25)];
        [headerView addSubview:sliderSegmentView3];
        [sliderSegmentView3 setTitleArray:array withStyle:CBSegmentStyleSlider];
        sliderSegmentView3.titleChooseReturn = ^(NSInteger x) {
            NSLog(@"点击了第%ld个按钮",x+1);
        };
    CBSegmentView *sliderSegmentView4 = [[CBSegmentView alloc]initWithFrame:CGRectMake(0, 176*0.75, self.view.frame.size.width, 176*0.25)];
    [headerView addSubview:sliderSegmentView4];
    [sliderSegmentView4 setTitleArray:array withStyle:CBSegmentStyleSlider];
    sliderSegmentView4.titleChooseReturn = ^(NSInteger x) {
        NSLog(@"点击了第%ld个按钮",x+1);
    };
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    return cell;
}

@end
