
#LFLSegmentControl-简单易用分段模仿网易新闻和搜狐新闻的首页效果，滑动切换不同栏目视图 iOS

###因为最近公司项目需要这个demo的效果,但是网上找了很多,发现都不能满足我的需求,所以自己写了一下.如果觉得好用,请star下.谢谢.
## 效果图
 ![image](https://github.com/LFL2018/PicSources/blob/master/LFLSegmentControl/LFLSegmentControl.gif?raw=true)

## 1. Installation 

###1.1   With [CocoaPods](http://cocoapods.org), add this line to your Podfile.

```
pod 'ScreenCompatible_LFL', '~> 1.0.0'

```

###1.2  也可以下载源码后把FrameAutoScaleLFL文件夹直接拖入工程即可,建议 使用pod

##2.代码演示部分
```
//    1.初次创建：
LFLUISegmentedControl* LFLuisement=[[LFLUISegmentedControl alloc]initWithFrame:CGRectMake(0, 64, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds))];
LFLuisement.delegate = self;
//   2.设置显示切换标题数组
NSArray* LFLarray=[NSArray arrayWithObjects:@"演示标题",@"DragonLi",@"LFL2018",@"Github",nil];

[LFLuisement AddSegumentArray:LFLarray];
//   default Select the Button
[LFLuisement selectTheSegument:2];
self.LFLuisement = LFLuisement;
[self.view addSubview:LFLuisement];

#pragma mark ---LFLUISegmentedControlDelegate
/**
*  点击标题按钮
*
*  @param selection 对应下标 begain 0
*/
-(void)uisegumentSelectionChange:(NSInteger)selection{
//    可以根据选中下标执行不同操作,详见demo
}

```

### 3. 有任何问题，请及时 issues me

Email:  dragonli_52171@163.com

