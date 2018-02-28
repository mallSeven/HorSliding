//
//  MenuViewCell.h
//  CollectionViewH
//
//  Created by 会骑牛的小七 on 2017/3/17.
//  Copyright © 2017年 王帅. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MenuViewCellDelegate <NSObject>

- (void)menuViewCell:(NSInteger)index;

@end

@interface MenuViewCell : UICollectionViewCell<UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, assign) id<MenuViewCellDelegate> delegate;

@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSArray *imageArray;

@property (nonatomic, assign) NSInteger itemsOfPage;
@property (nonatomic, assign) CGSize imageViewSize;

@end
