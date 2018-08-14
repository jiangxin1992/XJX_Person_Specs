# YYSpecs私有库文档大全

## 准备工作

#### 每一个想要使用YY私有模块库的同学都必须先把项目库入口加载到cocoapods的管理目录中，使用以下命令完成这一步

```
pod repo add YYSpecs https://git.ycosystem.com/iOSMode/YYSpecs.git
```
## 知道

##### 在ruby／python／shell中 # 是注释，相当于 java／oc／swift／js等语言中的 // 注释

## 创建
### 选择项目目录
### 1 首先需要进入一个文件夹，用来放即将创建的项目（模块）
### 2 创建pods公共组件库，
##### 这一步最简单的办法就是直接创建一个文件夹然后里面创建一个.podspec结尾的文件，这样我们的公共组件库就创建成功了。在这里我使用的是pod命令来创建：pod lib create xxx
```
pod lib create 项目名称
例如：
pod lib create YYTest
```
### 3 创建时会让你做一些选择，
#####几个问题分别是1，选择语言 2， 是否需要在库中包含演示例子 3，使用什么测试框架 4，是否需要基于视图的测试 5, 使用什么做前缀。  尽量都选no
##### 在本次例子中，我选的是 ObjC /  No  / None /  No / YY
```
$ pod lib create YYTest
Cloning `https://github.com/CocoaPods/pod-template.git` into `YYTest`.
Configuring YYTest template.
security: SecKeychainSearchCopyNext: The specified item could not be found in the keychain.

------------------------------

To get you started we need to ask a few questions, this should only take a minute.

If this is your first time we recommend running through with the guide: 
 - http://guides.cocoapods.org/making/using-pod-lib-create.html
 ( hold cmd and double click links to open in a browser. )


What language do you want to use?? [ Swift / ObjC ]
 > ObjC

Would you like to include a demo application with your library? [ Yes / No ]
 > No

Which testing frameworks will you use? [ Specta / Kiwi / None ]
 > None

Would you like to do view based testing? [ Yes / No ]
 > No

What is your class prefix?
 > YY

```
### 4 创建完成后，可以看到项目的目录大致为以下结构
```
$ tree YYToast/ -L 2
YYTest/
├── Example							#demo APP
│   ├── Podfile						#demo APP 的依赖描述文件
│   ├── Podfile.lock
│   ├── Pods						#demo APP 的依赖文件
│   ├── Tests
│   ├── YYTest.xcodeproj
│   └── YYTest.xcworkspace
├── LICENSE							#开源协议 默认MIT，gitlab创建项目时请选择MIT
├── README.md						#markdown格式的README
├── YYTest							#组件的目录
│   ├── Assets						#资源文件，模块的资源
│   └── Classes						#类文件，模块主要放在这里
├── YYTest.podspec					#！！第2步要创建的podspec文件，需要修改
└── _Pods.xcodeproj -> Example/Pods/Pods.xcodeproj
```
### 5 在gitlab上创建一个同名项目
##### 1, 将项目创建到iOSMode项目组中
##### 2, 这一步需要注意，开源协议(授权许可)选择为 MIT（开源协议需要一致）。 .gitignore选择xcode

### 6 可以把写好的东西放到指定的目录里面
##### 存放目录参考上面的文件夹结构（在classes里面），注意暴露头文件

### 7 把创建后的文件提交到远程gitlab
```
git add .
git commit -s -m "Initial Commit of Library"
git remote add origin https://git.ycosystem.com/iOSMode/YYTest.git
git push origin master
```

### 8 创建tag， 即库的版本号，例如```0.1.0```
##### 注意，版本号需要跟podspec里面的版本号一致，这个在下文中会说明
##### 这一步一定不要忘记 不然下面就会说找不到版本。
```
git tag -m "第一版" 0.1.0
git push --tags
```

### 9 修改 podspec 文件
##### 需要修改的地方在说明里，请按照说明修改，必须修改
##### 该文件是ruby语法的文件。语言环境改成ruby可以看见语法高亮
##### 想要了解更多请点击<a href="http://guides.cocoapods.org/syntax/podspec.html">官方文档</a>
```
#
# Be sure to run `pod lib lint YYToast.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YYTest'.        # 名称
  s.version          = '0.1.0'			# 版本号,每次版本提交需要修改到跟上面的tag一致。
  s.summary          = 'A short description of YYToast.' # 简短介绍，必须修改，否则报警告

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here. # 在两个desc之间的是详细说明，必须修改，否则报警告
                       DESC

  s.homepage         = 'https://github.com/sun.chuanjun/YYToast' # 项目位置，必须修改，自动生成的是github的，请修改成刚刚创建的地址
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }  # 开源协议
  s.author           = { 'sun.chuanjun' => 'sun.chuanjun@ycofoundation.com' } # 作者信息
  s.source           = { :git => 'https://github.com/sun.chuanjun/YYToast.git', :tag => s.version.to_s } # 项目可以download的地址，必须修改，请修改成刚刚在gitlab上创建出来的地址。注意：这里只能是http／https的地址，不支持ssh地址
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0' # 支持的平台及版本

  s.source_files = 'YYToast/Classes/**/*' #代码源文件地址，**/*表示Classes目录及其子目录下所有文件，如果有多个目录下则用逗号分开，如果需要在项目中分组显示，这里也要做相应的设置
  
  # s.resource_bundles = {
  #   'YYToast' => ['YYToast/Assets/*.png']
  # } # 资源文件地址

  # s.public_header_files = 'Pod/Classes/**/*.h' # 公开头文件地址，可以不写
  # s.frameworks = 'UIKit', 'MapKit' # 所需的framework，多个用逗号隔开
  # s.dependency 'AFNetworking', '~> 2.3' # 依赖关系，该项目所依赖的其他库，如果有多个需要填写多个s.dependency
end
```
### 10 验证
##### 通过命令验证是否可以提交，需要注意，不能有任何警告和错误, 下面的就是通过的
```
$ pod lib lint

 -> YYToast (0.1.0)

YYTest passed validation.
```
### 11 如果验证有问题，解决后代码变动也要提交到gitlab后再执行下一步。同时验证也必须正确才能执行下一步

### 12 提交podspec到私有spec repo
##### 这个时候需要，必须前面验证通过，不然提交会失败，因为提交过程先会进行验证。
##### 执行下面命令后CocoasPod自动会将podspec到本地和远程spec repo Git仓库。我们这时候可以在Git远程仓库可以看到这个podspec文件了。
```
pod repo push 私有仓库 xxxxxx.podspec
例如
pod repo push YYSpecs YYTest.podspec
```
###13 制作完成 the end

## 更新
### 1 从上面第6步开始。注意如果报错，要把错误提交之后再更新到cocoapods

### 2 添加多模块

我已经制作好了YYTest的0.1.0版本，现在我对他进行升级工作，这次我添加了更多的模块到YYTest之中，包括工具类，底层Model及UIKit扩展等

#####这里又尝试了一下subspec功能，给YYTest创建了多个子分支。

####具体做法是先将源文件添加到Pod/Classes中，然后按照不同的模块对文件目录进行整理，因为我有四个模块，所以在Pod/Classes下有创建了四个子目录，完成之后继续编辑之前的YYTest.podspec，这次增加了subspec特性
```
#
# Be sure to run `pod lib lint YYToast.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YYTest'.        # 名称
  s.version          = '0.1.0'			# 版本号,每次版本提交需要修改到跟上面的tag一致。
  s.summary          = 'A short description of YYToast.' # 简短介绍，必须修改，否则报警告

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here. # 在两个desc之间的是详细说明，必须修改，否则报警告
                       DESC

  s.homepage         = 'https://github.com/sun.chuanjun/YYToast' # 项目位置，必须修改，自动生成的是github的，请修改成刚刚创建的地址
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }  # 开源协议
  s.author           = { 'sun.chuanjun' => 'sun.chuanjun@ycofoundation.com' } # 作者信息
  s.source           = { :git => 'https://github.com/sun.chuanjun/YYToast.git', :tag => s.version.to_s } # 项目可以download的地址，必须修改，请修改成刚刚在gitlab上创建出来的地址。注意：这里只能是http／https的地址，不支持ssh地址
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0' # 支持的平台及版本

  s.source_files = 'YYToast/Classes/**/*' #代码源文件地址，**/*表示Classes目录及其子目录下所有文件，如果有多个目录下则用逗号分开，如果需要在项目中分组显示，这里也要做相应的设置
  
  # s.resource_bundles = {
  #   'YYToast' => ['YYToast/Assets/*.png']
  # } # 资源文件地址
  # --------------------add start---------------------------------
  s.subspec 'NetWorkEngine' do |networkEngine|
      networkEngine.source_files = 'Pod/Classes/NetworkEngine/**/*'
      networkEngine.public_header_files = 'Pod/Classes/NetworkEngine/**/*.h'
      networkEngine.dependency 'AFNetworking', '~> 2.3'
  end

  s.subspec 'DataModel' do |dataModel|
      dataModel.source_files = 'Pod/Classes/DataModel/**/*'
      dataModel.public_header_files = 'Pod/Classes/DataModel/**/*.h'
  end

  s.subspec 'CommonTools' do |commonTools|
      commonTools.source_files = 'Pod/Classes/CommonTools/**/*'
      commonTools.public_header_files = 'Pod/Classes/CommonTools/**/*.h'
      commonTools.dependency 'OpenUDID', '~> 1.0.0'
  end

  s.subspec 'UIKitAddition' do |ui|
      ui.source_files = 'Pod/Classes/UIKitAddition/**/*'
      ui.public_header_files = 'Pod/Classes/UIKitAddition/**/*.h'
      ui.resource = "Pod/Assets/MLSUIKitResource.bundle"
      ui.dependency 'PodTestLibrary/CommonTools'
  # ---------------------add end----------------------------
  # s.public_header_files = 'Pod/Classes/**/*.h' # 公开头文件地址，可以不写
  # s.frameworks = 'UIKit', 'MapKit' # 所需的framework，多个用逗号隔开
  # s.dependency 'AFNetworking', '~> 2.3' # 依赖关系，该项目所依赖的其他库，如果有多个需要填写多个s.dependency
  end
```
因为我们创建了subspec所以项目整体的依赖dependency，源文件source\_files，头文件public\_header_files，资源文件resource等都移动到了各自的subspec中，每个subspec之间也可以有相互的依赖关系，比如UIKitAddition就依赖于CommonTools。
### 3 验证
##### 编辑完成之后，在测试项目里pod update一下，几个子项目都被加进项目工程了，写代码验证无误之后，就可以将这个工程push到远端仓库，并打上新的tag->1.0.0
##### 最后再次使用pod lib lint验证编辑好的podsepc文件，没有自身的WARNING或者ERROR之后，就可以再次提交到Spec Repo中了，命令跟之前是一样的
### 4 使用
##### 完成这些之后，在实际项目中我们就可以选择使用整个组件库或者是组件库的某一个部分了，对应的Podfile中添加的内容为,头部的两个source下面有提到为啥

```
source 'https://github.com/CocoaPods/Specs.git'
source 'https://git.ycosystem.com/iOSMode/YYSpecs.git'

platform :ios, '8.0'

target :test do
	pod 'YYTest/NetWorkEngine', '1.0.0'  #使用某一个部分
	pod 'YYTest/UIKitAddition', '1.0.0'

	pod 'YYTest', '1.0.0'   #使用整个库
end
```

## 使用

### 1, 想要在项目中使用私有库，目前需要在Podfile文件中加入以下两句话，不然可能会报找不到库的错误。
```
source 'https://github.com/CocoaPods/Specs.git'        # 引入pod原有的库
source 'https://git.ycosystem.com/iOSMode/YYSpecs.git' # 引入自定义私有库
```

例如：

```
source 'https://github.com/CocoaPods/Specs.git'
source 'https://git.ycosystem.com/iOSMode/YYSpecs.git'

platform :ios, '8.0'

target :test do
    pod 'YYTest', '~>0.0.1' # test
end
```

## 删除仓库
### 只需要一个命令就好了
```
pod repo remove WTSpecs	
```
添加回来就按照准备工作执行一句话即可

##删除仓库中的一个模块
### 此时不用借助pod，只需要执行几个命令就ok
```
cd  ~/.cocoapods/repos/YYSpecs #进入私有的仓库
rm -rf xxxx # 删除仓库文件夹
# 下面是git命令
git add --all . #添加修改
git ci -m "remove unuseful pods" #说明删除的内容
git push origin master # 推到远端

```
