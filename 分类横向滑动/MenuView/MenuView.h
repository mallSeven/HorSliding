//
//  MenuView.h
//  CollectionViewH
//
//  Created by 会骑牛的小七 on 2017/3/17.
//  Copyright © 2017年 王帅. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuViewCell.h"

//协议
@protocol MenuViewDelegate <NSObject>

- (void)menuViewItemIndex:(NSInteger)index;

@end

@interface MenuView : UIView<UICollectionViewDelegate, UICollectionViewDataSource, MenuViewCellDelegate>

@property (nonatomic, assign) id<MenuViewDelegate> delegate;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSArray *imageArray;

@property (nonatomic, assign) NSInteger itemsOfPage;
@property (nonatomic, assign) CGSize imageViewSize;

+ (instancetype)loadView;

@end
