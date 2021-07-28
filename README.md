# flutter_wechat

## 简介

[flutter_wechat](https://github.com/sunpu007/flutter_wechat)是一个防微信客户端的flutter应用，基于flutter2.x实现。它使用了最新的flutter技术栈，内置了 i18n 国际化解决方案(arb)。希望本项目能帮助你。

## 前序准备

你需呀在本地安装 [flutter](https://flutter.dev/docs/get-started/install) 和 [git](https://git-scm.com/)。本项目技术栈基于 [dio](https://pub.dev/packages/dio)、[provider](https://pub.dev/packages/provider)、[shared_preferences](https://pub.dev/packages/shared_preferences)、[web_socket_channel](https://pub.dev/packages/web_socket_channel)、[image_picker](https://pub.dev/packages/image_picker)、[webview_flutter](https://pub.dev/packages/webview_flutter)、[qrscan](https://pub.dev/packages/qrscan)、[permission_handler](https://pub.dev/packages/permission_handler)，所有请求都基于静态模式。

## 开发

```
- 登录 / 注册（注册只实现了静态页面，后期有机会完善）

- 聊天
  - 聊天页
- 通讯录
  - 个人详情
    - 图片预览
- 发现
  - 朋友圈
- 我的
  - websocket连接
- 扫一扫
  - webview

```

## 开发

```bash
# 克隆项目
git clone git@github.com:sunpu007/flutter_wechat.git

# 进入项目目录
cd flutter_wechat

# 安装依赖
flutter pub get

# 启动服务
flutter run
```
## 部分界面截图

![demo](https://user-images.githubusercontent.com/20461171/127133672-211d77be-8ee6-4972-a5fb-6f4ec690444c.png)

## 联系我

<img src="https://user-images.githubusercontent.com/20461171/127292875-69a03211-59c3-4df4-adde-0b1fbaae44cc.jpg" width="200px" alt="wxid_mwukw2ulwej422" />

## License

[MIT](https://github.com/sunpu007/flutter_wechat/blob/main/LICENSE)

Copyright (c) 2021-present Jerry_sun
