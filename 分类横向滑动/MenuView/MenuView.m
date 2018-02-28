//
//  MenuView.m
//  CollectionViewH
//
//  Created by 会骑牛的小七 on 2017/3/17.
//  Copyright © 2017年 王帅. All rights reserved.
//

#import "MenuView.h"

@implementation MenuView

+ (instancetype)loadView {
    return [[[NSBundle mainBundle] loadNibNamed:@"MenuView" owner:nil options:nil] lastObject];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.autoresizingMask = UIViewAutoresizingNone;
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"MenuViewCell" bundle:nil] forCellWithReuseIdentifier:@"MenuViewCell"];
    
    self.itemsOfPage = 10;
    
    self.imageViewSize = CGSizeMake(48, 48);
    
    self.backgroundColor = [UIColor whiteColor];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    layout.itemSize = self.collectionView.bounds.size;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MenuViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MenuViewCell" forIndexPath:indexPath];
    [self setupCelldataWithCell:cell indexPath:indexPath];
    cell.itemsOfPage = self.itemsOfPage;
    cell.imageViewSize = self.imageViewSize;
    cell.delegate = self;
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (self.imageArray == nil) {
        return 0;
    }
    NSInteger pageNum = (self.imageArray.count - 1) / self.itemsOfPage + 1;
    self.pageControl.numberOfPages = pageNum;
    return pageNum;
}

- (void)setupCelldataWithCell:(MenuViewCell *)cell indexPath:(NSIndexPath *)indexPath {
    NSInteger startIndex = indexPath.item * self.itemsOfPage;
    NSInteger endIndex = (indexPath.item + 1) * (self.itemsOfPage - 1);
    if (endIndex > self.imageArray.count - 1) {
        endIndex = self.imageArray.count - 1;
    }
    
    NSMutableArray *array = [NSMutableArray array];
    NSMutableArray *title = [NSMutableArray array];
    for (NSInteger index = startIndex; index <= endIndex; index ++) {
        [array addObject:self.imageArray[index]];
        [title addObject:self.titleArray[index]];
    }
    
    cell.imageArray = array;
    cell.titleArray = title;
    
}

- (void)menuViewCell:(NSInteger)index {
    if ([self.delegate respondsToSelector:@selector(menuViewItemIndex:)]) {
        [self.delegate menuViewItemIndex:self.pageControl.currentPage * self.itemsOfPage + index];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.pageControl.currentPage = scrollView.contentOffset.x / scrollView.bounds.size.width;
}

//- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
//    
//    if (indexPath.row % 2 != 0) {
//        cell.transform = CGAffineTransformMakeTranslation(0, -50);
//    }else{
//        cell.transform = CGAffineTransformMakeTranslation(0, 50);
//    }
//    cell.alpha = 0.0;
//    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [UIView animateWithDuration:0.7 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:0 options:0 animations:^{
//            cell.transform = CGAffineTransformIdentity;
//            cell.alpha = 1.0;
//        } completion:^(BOOL finished) {
//            
//        }];
//    });
//}

@end
