//
//  MemberVIPColCell.m
//  MyApp
//
//  Created by apple on 2020/5/6.
//  Copyright © 2020 tii. All rights reserved.
//

#import "MemberVIPColCell.h"

@implementation MemberVIPColCell

- (void)awakeFromNib {
    [super awakeFromNib];
    ViewBorderRadius(self.backView, 3.33f, 1.f, [UIColor colorWithHexString:@"#E6C979"]);
}

@end
