# Server

此目录下包含了 shiroko 的服务端，在安卓设备上运行。

-   jni 文件夹是 c++ 编写的 ndk 项目，是主要的功能实现。
-   launcher 文件夹一个安卓项目，是 shiroko 的启动器，用于调用 jni 编译的 c++ 共享库。

## 构建

### 环境配置

1. 配置环境变量 [ANDROID_HOME](https://developer.android.com/tools/variables?hl=zh-cn)
2. 安装 jdk17 (gradle 依赖)
3. 安装 25.1.8937393 版本的 ndk。
4. 参照 `./launcher/app/build.gredle` 中 `android.defaultConfig` 的 `minSdk` 和 `targetSdk`, 安装对应版本的 sdk

### 构建步骤

1. 构建 libs (libshiroko.so)

    在此目录下运行 `ndk-build`, 构建产物在 `libs` 目录下。

2. 构建 apk (shiroko)

    运行 `./gradlew build`。
    成功构建之后会生成 `app/build/outputs/apk/release/app-release.apk`, 这就是需要的产物

或者使用 `build.sh`, 会将需要的产物放在 build 目录下。

## 使用

1. 拷贝 `libshiroko.so` 和 `shiroko` 到安卓设备的 `/data/local/tmp` 目录下

2. 在 adb shell 中运行 `LD_LIBRARY_PATH=/data/local/tmp/ CLASSPATH=/data/local/tmp/shiroko app_process /system/bin shiroko.Main`

### 解释

`libshiroko.so` 是使用 ndk-build 构建的产物，需要匹配对应设备的 ABI。

`shiroko` 是指[[构建 apk](#构建步骤)]步骤的产物，为了方便重命名为 shiroko
