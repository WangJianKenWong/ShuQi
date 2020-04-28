//
//  MemberMyOrderCell.m
//  MyApp
//
//  Created by apple on 2020/4/28.
//  Copyright © 2020 tii. All rights reserved.
//

#import "MemberMyOrderCell.h"

@implementation MemberMyOrderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    ViewRadius(_myCopyBtn, _myCopyBtn.bounds.size.height*0.5);
    ViewRadius(_backView, 3.5f);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
