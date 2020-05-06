//
//  LongMovieChooseHaederView.m
//  MyApp
//
//  Created by apple on 2020/5/6.
//  Copyright © 2020 tii. All rights reserved.
//

#import "LongMovieChooseHaederView.h"
#import "CBSegmentView.h"
@implementation LongMovieChooseHaederView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self setupHeaderView:self];
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
    CBSegmentView *sliderSegmentView1 = [[CBSegmentView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 176*0.25)];
        [self addSubview:sliderSegmentView1];
        [sliderSegmentView1 setTitleArray:array withStyle:CBSegmentStyleSlider];
        sliderSegmentView1.titleChooseReturn = ^(NSInteger x) {
          NSLog(@"点击了第%ld个按钮",x+1);
        };
        
        CBSegmentView *sliderSegmentView2 = [[CBSegmentView alloc]initWithFrame:CGRectMake(0, 176*0.25, SCREEN_WIDTH, 176*0.25)];
        [self addSubview:sliderSegmentView2];
        [sliderSegmentView2 setTitleArray:array withStyle:CBSegmentStyleSlider];
        sliderSegmentView2.titleChooseReturn = ^(NSInteger x) {
            NSLog(@"点击了第%ld个按钮",x+1);
        };
        
        CBSegmentView *sliderSegmentView3 = [[CBSegmentView alloc]initWithFrame:CGRectMake(0, 176*0.5, SCREEN_WIDTH, 176*0.25)];
        [self addSubview:sliderSegmentView3];
        [sliderSegmentView3 setTitleArray:array withStyle:CBSegmentStyleSlider];
        sliderSegmentView3.titleChooseReturn = ^(NSInteger x) {
            NSLog(@"点击了第%ld个按钮",x+1);
        };
    CBSegmentView *sliderSegmentView4 = [[CBSegmentView alloc]initWithFrame:CGRectMake(0, 176*0.75, SCREEN_WIDTH, 176*0.25)];
    [self addSubview:sliderSegmentView4];
    [sliderSegmentView4 setTitleArray:array withStyle:CBSegmentStyleSlider];
    sliderSegmentView4.titleChooseReturn = ^(NSInteger x) {
        NSLog(@"点击了第%ld个按钮",x+1);
    };
}
@end
