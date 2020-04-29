//
//  FindStartSecondDetailCell.m
//  MyApp
//
//  Created by apple on 2020/4/29.
//  Copyright © 2020 tii. All rights reserved.
//

#import "FindStartSecondDetailCell.h"

@implementation FindStartSecondDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    ViewRadius(_collectBtn, _collectBtn.bounds.size.height * 0.5);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
