//
//  TableViewCell.m
//  cellItem
//
//  Created by MK on 2018/4/17.
//  Copyright © 2018年 MK. All rights reserved.
//

#import "TableViewCell.h"
#import "CollectionViewCell.h"
@interface TableViewCell ()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@end
static NSString *MKCollectionViewReuseID = @"MKCollectionViewReuseID";
@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self setup];
}
-(void)setItems:(NSArray *)items{
    _items = items;
    self.titleLable.text = [NSString stringWithFormat:@"Cell%@",self.titles];
    [self.collectionView reloadData];
}
#pragma mark UICollectionViewDataSource

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.items.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *item = [collectionView dequeueReusableCellWithReuseIdentifier:MKCollectionViewReuseID forIndexPath:indexPath];
    item.titileLable.text = [NSString stringWithFormat:@"Item%@",self.items[indexPath.row]];
    return item;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(collectionViewDidSelectedItemIndexPath:collcetionView:forCell:)]) {
        [self.delegate collectionViewDidSelectedItemIndexPath:indexPath collcetionView:collectionView forCell:self];
    }
}
#pragma mark Setup
-(void)setup{
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([CollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:MKCollectionViewReuseID];
    
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    layout.itemSize = CGSizeMake(288, 157);
    layout.minimumLineSpacing = 10 ;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
}

@end
