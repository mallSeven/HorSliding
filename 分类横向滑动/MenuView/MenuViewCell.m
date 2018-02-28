//
//  MenuViewCell.m
//  CollectionViewH
//
//  Created by 会骑牛的小七 on 2017/3/17.
//  Copyright © 2017年 王帅. All rights reserved.
//

#import "MenuViewCell.h"
#import "MenuViewSubCell.h"
#import "UIImageView+WebCache.h"

@implementation MenuViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
   
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"MenuViewSubCell" bundle:nil] forCellWithReuseIdentifier:@"MenuViewSubCell"];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    NSInteger itemW = self.collectionView.bounds.size.width / (self.itemsOfPage / 2);
    NSInteger itemH = self.collectionView.bounds.size.height / 2 - 10;
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.itemSize = CGSizeMake(itemW, itemH);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MenuViewSubCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MenuViewSubCell" forIndexPath:indexPath];
    cell.title.text = self.titleArray[indexPath.row];
    [cell.img sd_setImageWithURL:[NSURL URLWithString:self.imageArray[indexPath.row]] placeholderImage:[UIImage imageNamed:@"logo"]];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.imageArray.count;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(menuViewCell:)]) {
        [self.delegate menuViewCell:indexPath.row];
    }
}

@end
