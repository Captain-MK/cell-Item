//
//  textController.m
//  cellItem
//
//  Created by MK on 2018/4/17.
//  Copyright © 2018年 MK. All rights reserved.
//

#import "textController.h"
#import "TableViewCell.h"
#import "CollectionViewCell.h"
@interface textController ()<UITableViewDelegate,UITableViewDataSource,MKTableViewCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
/** data */
@property(nonatomic, strong)NSArray *items;
@end
static NSString *cellID = @"cell";
@implementation textController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.mainTableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    [self.mainTableView registerNib:[UINib nibWithNibName:NSStringFromClass([TableViewCell class]) bundle:nil] forCellReuseIdentifier:cellID];
    NSMutableArray *arrM = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        NSString *s = [NSString stringWithFormat:@"%@", @(i)];
        [arrM addObject:s];
    }
    self.items = [arrM copy];
}
#pragma mark MKTableViewCellDelegate
-(void)collectionViewDidSelectedItemIndexPath:(NSIndexPath *)indexPath collcetionView:(UICollectionView *)collectionView forCell:(CollectionViewCell *)cell{
    NSLog(@"点击%ldCollectionViewCell",(long)indexPath.item);
}
#pragma mark UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.titles = [NSString stringWithFormat:@"%ld",indexPath.row];
    cell.items = self.items;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.delegate = self;
    return cell;
}
#pragma mark UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}

@end
