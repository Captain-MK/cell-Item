//
//  TableViewCell.h
//  cellItem
//
//  Created by MK on 2018/4/17.
//  Copyright © 2018年 MK. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TableViewCell, CollectionViewCell;

@protocol MKTableViewCellDelegate <NSObject>

@optional
-(void)collectionViewDidSelectedItemIndexPath:(NSIndexPath *)indexPath collcetionView:(UICollectionView *)collectionView forCell:(TableViewCell *)cell;

@end
@interface TableViewCell : UITableViewCell
/** delegate */
@property(nonatomic, weak)id<MKTableViewCellDelegate> delegate;
/** data */
@property(nonatomic, copy)NSArray *items;
/** data */
@property(nonatomic, copy)NSString *titles;
@end
