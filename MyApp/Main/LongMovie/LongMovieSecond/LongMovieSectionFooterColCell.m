//
//  LongMovieSectionFooterColCell.m
//  MyApp
//
//  Created by apple on 2020/5/6.
//  Copyright © 2020 tii. All rights reserved.
//

#import "LongMovieSectionFooterColCell.h"

@implementation LongMovieSectionFooterColCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.moreBtn buttonDistance:5.f direction:right];
    [self.otherBtn buttonDistance:5.f direction:right];
}

@end
