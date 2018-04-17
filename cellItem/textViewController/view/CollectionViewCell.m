//
//  CollectionViewCell.m
//  cellItem
//
//  Created by MK on 2018/4/17.
//  Copyright © 2018年 MK. All rights reserved.
//

#import "CollectionViewCell.h"
@interface CollectionViewCell ()

@end
@implementation CollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.layer.cornerRadius = 5.f;
    self.layer.masksToBounds = YES;
}

@end
