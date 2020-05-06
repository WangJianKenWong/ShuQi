//
//  LongMovieSectionHaederColCell.m
//  MyApp
//
//  Created by apple on 2020/5/6.
//  Copyright © 2020 tii. All rights reserved.
//

#import "LongMovieSectionHaederColCell.h"
#import "SDCycleScrollView.h"

@implementation LongMovieSectionHaederColCell

- (void)awakeFromNib {
    [super awakeFromNib];
    ViewRadius(self.chooseBtn, self.chooseBtn.bounds.size.height*0.5);
    [self.chooseBtn buttonDistance:4.f direction:left];
    [self setupBannerView];
    self.searchBar.backgroundColor = [UIColor clearColor];
    // 关闭自动调整
    self.searchBar.translatesAutoresizingMaskIntoConstraints = NO;
        //设置背景色
    [self.searchBar setBackgroundColor:[UIColor colorWithHexString:@"#F0F1F3"]];
    UIImage* searchBarBg = [self GetImageWithColor:[UIColor colorWithHexString:@"#F0F1F3"] andWidth:1.f andHeight:28.f];
        //设置背景图片
//    [self.searchBar setBackgroundImage:searchBarBg];
        //设置文本框背景
    [self.searchBar setSearchFieldBackgroundImage:searchBarBg forState:UIControlStateNormal];
    UITextField *searchField = [self.searchBar valueForKey:@"_searchField"];
    searchField.textColor = [UIColor colorWithHexString:@"#333333"];
    [searchField setValue:[UIColor colorWithHexString:@"#BBBBBB"] forKeyPath:@"_placeholderLabel.textColor"];
        //设置文本边框
    searchField.layer.borderColor = [UIColor clearColor].CGColor;
    ViewRadius(self.searchBar, 18.f);

}
- (UIImage*) GetImageWithColor:(UIColor*)color andWidth:(CGFloat)width andHeight:(CGFloat)height
{
    CGRect r= CGRectMake(0.0f, 0.0f, width, height);
    UIGraphicsBeginImageContext(r.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, r);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}
- (void)setupBannerView{
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 60, SCREEN_WIDTH, self.bounds.size.height-110) delegate:self placeholderImage:[UIImage imageNamed:@"short"]];
    NSArray *imagesURLStrings = @[
    @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
    @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
    @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg"
    ];
    cycleScrollView.imageURLStringsGroup = imagesURLStrings;
    cycleScrollView.delegate = self;
    cycleScrollView.pageDotImage = [self GetImageWithColor:[UIColor colorWithHexString:@"#D8D8D8"] andWidth:4.5f andHeight:4.5f];
    cycleScrollView.currentPageDotImage = [self GetImageWithColor:[UIColor colorWithHexString:@"#FF0000"] andWidth:14.f andHeight:4.5f];;
    cycleScrollView.pageControlBottomOffset = -25;
    [self addSubview:cycleScrollView];
}
@end
