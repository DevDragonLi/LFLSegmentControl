
#LFLSegmentControl-简单易用分段模仿网易新闻和搜狐新闻的首页效果，滑动切换不同栏目视图 iOS

###公司项目中需要这个demo的效果,所以自己写了一下.如果觉得好用,还望star下.谢谢
## 效果图
 ![image](https://github.com/LFL2018/Som_related_information_LFL/blob/master/The_picture/LFLSegmentControl/LFLSegmentControl.gif?raw=true)

## 1. Installation 

###1.1   With [CocoaPods](http://cocoapods.org), add this line to your Podfile.

```
   pod 'SegmentControlLFL', '~> 1.0.0' 

```
然后终端执行pod install 即可

###1.2  也可以下载源码后把LFLUISegmentedControl文件夹直接拖入工程即可.

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

Requirements
==============
This library requires `iOS 6.0+` and `Xcode 6.0+`.

### 3. 有任何问题，请及时 issues me 
 <dragonli_52171@163.com>   

### 4. 已知问题,如果分段数组大于6个,因为没有采取滚动视图承载,可能会有显示问题,修改下源码即可.但是对于一般简单标题需求可完美使用.

 

