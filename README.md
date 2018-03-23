# Tools v1.1.2

## Update
2018.03.21更新：

- 日期扩展逻辑细节优化。

## Usage  

#### 1.CocoaPods

**Objective-C**

```
pod 'URTools_OC'
```

**Swift**

```
pod 'URTools_Swift'
```



#### 2.使用说明

1. 方法调用

    1. 初始化方法直接调用即可。如:  

        ```Swift
        let label = UILabel(text: "label", textColor: .lightGray, font: UIFont.systemFont(ofSize: 18.0))
        ```
        
    2. 扩展方法调用需要通过`.urt`进行调用。如：

        ```Swift
        view.backgroundColor = UIColor.urt.randomColor
        ```    
    
2. 使用配置  
`UIDevice+UUID.swift`工具包含Keychain存储功能并支持**同组应用（同一证书打包）**共享钥匙串信息，在使用时需对工程进行配置：

    1. Targets -> Capabilities -> Keychain Sharing, 打开`Keychain Sharing`开关。
    2. `Keychain Groups`内容改为统一标识，例如： `com.company.Family`。

## Next
1. 若缺少特定功能，建议在此基础上`进行封装`或`添加Extension`，尽量避免直接修改原有逻辑。
2. 若缺少所需共通性功能，可提`issue`。
3. 若扩展出现Bug或扩展设计存在问题，请立即指出。

	
## Tree
1. Swift版

		.
		|____Date+Extension.swift  //日期扩展
		|____Dictionary+Extension.swift  //字典扩展
		|____Encryption	//文件夹
		| |____String+Encryption.swift  //加密扩展 包含 Base64 MD5 DES AES(128/192/256)
		|____Enum.swift	//枚举
		|____Global.swift		//全局扩展
		|____UIDevice+UUID.swift  //设备扩展
		|____RoundedCornersImageView.swift  //圆角视图类
		|____String+Extension.swift  //字符串扩展
		|____UIColor+Extension.swift  // 颜色扩展
		|____UIImage+Extension.swift  // 图片扩展
		|____UILabel+Extension.swift
		|____UIBarButtonItem+Extension.swift
		|____UIButton+Extension.swift
		|____UIView+Extension.swift

2. Objective-C版

		.
		|____Encryption	//文件夹
		| |____GTMBase64	//第三方库
		| | |____GTMBase64.h		
		| | |____GTMBase64.m
		| | |____GTMDefines.h
		| |____NSString+Encryption.h  // 加密扩展 包含 MD5 DES AES(128/192/256) 
		| |____NSString+Encryption.m
		|____Global.h  //全局扩展
		|____Global.m
		|____NSDate+Extension.h  // 日期扩展
		|____NSDate+Extension.m
		|____NSMutableDictionary+Extension.h  // 字典扩展
		|____NSMutableDictionary+Extension.m
		|____NSString+Extension.h  // 字符串扩展
		|____NSString+Extension.m
		|____UIColor+Extension.h  // 颜色扩展
		|____UIColor+Extension.m
		|____UIImage+Extension.h  // 图片扩展
		|____UIImage+Extension.m
		|____UIImageView+CornerRadius.h  // 圆角视图扩展
		|____UIImageView+CornerRadius.m
		|____UILabel+Extension.h  
		|____UILabel+Extension.m
		|____UIView+Extension.h
		|____UIView+Extension.m
		|____UIButton+Extension.h
		|____UIButton+Extension.m
		|____UIBarButtonItem+Extension.h
		|____UIBarButtonItem+Extension.m


