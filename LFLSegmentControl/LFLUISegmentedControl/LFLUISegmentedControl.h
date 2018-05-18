//
//  LFLUISegmentedControl.h
//  SegmentedLFL
//
//  Created by vintop_xiaowei on 16/1/2.
//  Copyright © 2016年 vintop_DragonLi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LFLUISegmentedControlDelegate< NSObject>

@optional

/// 外界调用获取点击下标
-(void)uisegumentSelectionChange:(NSInteger)selection;

@end

@interface LFLUISegmentedControl : UIView

@property(nonatomic,weak)id <LFLUISegmentedControlDelegate>delegate;
/**
 *  @param segument 手动切换下标位置
 */
-(void)selectTheSegument:(NSInteger)segument;
/// 设置下划线颜色
- (void)lineColor:(UIColor *)color;
/**
 *  指定初始化方法
 *  @param frame         frame
 *  @param titleArray    显示的标题数组
 *  @param defaultSelect 默认选中的标题下标,默认选中第一个
 *   34 ---默认高度,可以根据项目需求自己更改
 */
+ (instancetype)segmentWithFrame:(CGRect)frame
                      titleArray:(NSArray *)titleArray
                   defaultSelect:(NSInteger)defaultSelect;
/**
 *  设置颜色
 *  @param titleColor       标题颜色  默认黑色
 *  @param selectTitleColor 选中标题颜色 默认 黑色
 *  @param BackGroundColor  整体背景颜色  默认白色
 *  @param titleFontSize    标题字体大小 默认14
 */

- (void)titleColor:(UIColor *)titleColor
  selectTitleColor:(UIColor *)selectTitleColor
   BackGroundColor:(UIColor *)BackGroundColor
     titleFontSize:(CGFloat)size;
@end
