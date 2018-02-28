//
//  ViewController.m
//  分类横向滑动
//
//  Created by 会骑牛的小七 on 2018/2/28.
//  Copyright © 2018年 王帅. All rights reserved.
//

#import "ViewController.h"
#import "MenuView.h"

@interface ViewController ()<MenuViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *numberLable;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"分类选择";
    
    self.numberLable.text = @"";
    
    MenuView *menuView = [MenuView loadView];
    menuView.bounds = CGRectMake(0, 0, self.view.bounds.size.width, 220);
    menuView.center = self.view.center;
    menuView.titleArray = @[@"服务", @"知识", @"保险", @"民商", @"代理", @"工程", @"服务", @"知识", @"保险", @"民商", @"代理", @"工程"];
    menuView.imageArray = @[@"http://007city.com/fenleiImg/20180117105753227.png", @"http://007city.com/fenleiImg/20180117105753227.png", @"http://007city.com/fenleiImg/20180117105753227.png", @"http://007city.com/fenleiImg/20180117105753227.png", @"http://007city.com/fenleiImg/20180117105753227.png", @"http://007city.com/fenleiImg/20180117105753227.png", @"http://007city.com/fenleiImg/20180117105753227.png", @"http://007city.com/fenleiImg/20180117105753227.png", @"http://007city.com/fenleiImg/20180117105753227.png", @"http://007city.com/fenleiImg/20180117105753227.png", @"http://007city.com/fenleiImg/20180117105753227.png", @"http://007city.com/fenleiImg/20180117105753227.png"];
    menuView.delegate = self;
    [self.view addSubview:menuView];
    
}

- (void)menuViewItemIndex:(NSInteger)index {
    NSLog(@"点击了第%ld个", index);
    [self.numberLable setText:[NSString stringWithFormat:@"%ld", index]];
}

@end
