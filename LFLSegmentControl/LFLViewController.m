//
//  LFLViewController.m
//  SegmentedLFL
//
//  Created by vintop_xiaowei on 16/1/3.
//  Copyright © 2016年 vintop_DragonLi. All rights reserved.
/**
        https://github.com/LFL2018 
        使用说明
 1.使用处  #import "LFLUISegmentedControl.h"
   按照 viewDidLoad 添加即可
 2. 如果需要滚动视图切换不同界面
 打开  [self createMainScrollView];
 参考即可,(本demo里面加入的是图片,可以是其他view等),主要是切换时改变偏移
 */
#define self_Width CGRectGetWidth([UIScreen mainScreen].bounds)
#define self_Height CGRectGetHeight([UIScreen mainScreen].bounds)

#import "LFLViewController.h"
#import "LFLUISegmentedControl.h"

@interface LFLViewController ()<LFLUISegmentedControlDelegate,UIScrollViewDelegate>

@property(nonatomic, strong)UIScrollView *mainScrollView; /**< 正文mainSV */
@property (nonatomic ,strong)LFLUISegmentedControl * LFLuisement; /**< LFLuisement */

@end

@implementation LFLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
// 1.创建控件,建议高度37,其他数值,需要修改源码,适应居中标题view
    self.LFLuisement=[LFLUISegmentedControl segmentWithFrame:CGRectMake(0, 64,self_Width ,37) titleArray:@[@"演示标题",@"DragonLi",@"LFL2018",@"Github"] defaultSelect:0];
//    2, 自定义各类颜色 和 字体大小
//    [self.LFLuisement titleColor:[UIColor greenColor] selectTitleColor:[UIColor redColor] BackGroundColor:[UIColor grayColor] titleFontSize:13];
//    3. 设置下滑线颜色 .默认为主流的红色
//    [self.LFLuisement lineColor:[UIColor brownColor]];
    self.LFLuisement.delegate = self;
    [self.view addSubview:self.LFLuisement];
    [self.view addSubview:self.mainScrollView];
}
#pragma mark --- UIScrollView代理方法

static NSInteger pageNumber = 0;

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    pageNumber = (int)(scrollView.contentOffset.x / self_Width + 0.5);
    //    滑动SV里视图,切换标题
    [self.LFLuisement selectTheSegument:pageNumber];
}

#pragma mark ---LFLUISegmentedControlDelegate
/**
 *  点击标题按钮
 *
 *  @param selection 对应下标 begain 0
 */
-(void)uisegumentSelectionChange:(NSInteger)selection{
//    加入动画,显得不太过于生硬切换
    [UIView animateWithDuration:.2 animations:^{
        [self.mainScrollView setContentOffset:CGPointMake(self_Width *selection, 0)];
    }];
}

#pragma mark getter

- (UIScrollView *)mainScrollView {
	if(_mainScrollView == nil) {
        CGFloat begainScrollViewY = 37+ 64;
        _mainScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, begainScrollViewY, self_Width,(self_Height -begainScrollViewY))];
        _mainScrollView.backgroundColor = [UIColor cyanColor];
        _mainScrollView.bounces = NO;
        _mainScrollView.pagingEnabled = YES;
        _mainScrollView.contentSize = CGSizeMake(self_Width * 4, (self_Height -begainScrollViewY));
        //设置代理
        _mainScrollView.delegate = self;
        //添加滚动显示的三个对应的界面view
        for (int i = 0; i < 4; i++) {
            UIView *viewExample = [[UIView alloc]initWithFrame:CGRectMake(self_Width *i, 0, self_Width,self_Height)];
            viewExample.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
            [_mainScrollView addSubview:viewExample];
        }
	}
	return _mainScrollView;
}

@end
