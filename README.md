## 接入方式

项目地址 (https://github.com/zhao560/UTMSDK)

要使用CocoaPods将UTMSDK集成到您的Xcode项目中，请在您的`Podfile`中指定

由于sdk 依赖了 `Alamofire` 和 `SDWebImage` 如果手动导入sdk 请自行导入

```ruby
pod 'UTMSDK', '~> 1.0.1'
```

## Requirements

-   iOS 10.0+ / macOS 10.12+ / tvOS 10.0+ / watchOS 3.0+
-   Xcode 11+
-   Swift 5.1+

## How To Use

SDK 需要在 AppDelegate 的方法 - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 里进行初始化  (**注意需要放在设置Window之前**)

-   Objective-C

```objective-c
#import <WDUTMSDK/WDUTMSDK-Swift.h>

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    /**
     *  初始化
     * @param channel 渠道
     * @param app 需要传入bundleId 以-分割 请参考demo
     */
    [WDTracker setupWithChannel:@"AppStore" app: @""];
}
```

-   Swift

```swift
import WDUTMSDK

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    /**
     *  初始化
     * @param channel 渠道
     * @param app 需要传入bundleId 以-分割 请参考demo
     */
    WDTracker.setup(channel: "AppStore", app: bundleId)
  	// 是否开启debug模式
  	WDTracker.debug = true
}
```

## 自动埋点

默认地，SDK会⾃动收集必要信息以及点击事件。已实现的⾃动埋点包括:

-   ⽤户⾸次进⼊，会上报包含设备信息的⼀条数据

    <img src="http://boniuapp.oss-cn-hangzhou.aliyuncs.com/mydays/other/1605062821046.png" alt="image-20201110141603507" style="zoom:50%;" align="left"/>

-   如果⽤户进⼊⻚⾯，会上报包含访问的信息

    <img src="http://boniuapp.oss-cn-hangzhou.aliyuncs.com/mydays/other/1605062905997.png" alt="image-20201110141652589" style="zoom:50%;" align="left"/>

-    如果⽤户点击按钮，会上报包含点击信息的⼀条数据

     <img src="http://boniuapp.oss-cn-hangzhou.aliyuncs.com/mydays/other/1605062943424.png" alt="image-20201110142404356" style="zoom:50%;" align="left"/>

     

-   其它事件

    ```sw
    pipe.open  // 打开App时
    pipe.close // 关闭App是
    pipe.active // 从后台唤醒App时
    pipe.deactive // 将App切换到后台时
    ```



## 自定义事件

如果需要上报⾃定义的埋点事件和数据, 例如在分享成功后上报事件,可以通过以下⽅法

-   key: 事件的名称, 需要唯⼀、易识别 

-   extra: 事件相关联的数据信息, 例如订单号、⾦额等

```swfit
WDTracker.fire("xxx.xxx", extra: { 
    "key": "value" 
})
```



## 设置页面标识

-   utm_model: ⻚⾯模块名, 默认均为空, ⼀般可根据业务类型划分模块
-   utm_name: ⻚⾯标识名, 默认为“类型标题“, 例如 ` WDHonePageViewController⾸⻚ ` , 各⻚⾯可通过设置该属性进⾏⾃定义
-   utm_ignore: 忽略该⻚⾯采集, ⼀般只⽤在部分业务⽆关且不需要采集事件的ViewController上, 例如启动⻚

```swift
// UTMSDK为UIViewController添加了3个属性满足页面标识的各种需求
extension UIViewController {
  	// 页面模块
    @objc public var utm_model: String
  	// 页面标识
    @objc public var utm_name: String
  	// 忽略页面跳转埋点
    @objc public var utm_ignore: String
}
```





