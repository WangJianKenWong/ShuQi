//
//  PXCatalogTableViewCell.h
//  LastProject
//
//  Created by Mac on 16/3/21.
//  Copyright (c) 2016年 QQ:1002766945. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PXCatalogTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *bookImageView;

@property (weak, nonatomic) IBOutlet UILabel *bookNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *authorLabel;

@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;



@end
