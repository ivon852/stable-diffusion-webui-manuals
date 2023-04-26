---
title: "❓ 如何安装扩充功能"
weight: 1
---


# 1. 用图形界面安装

最简单的就是点选Extensions → Available的`Load from:`，就会列出可下载安装的扩充功能。

![](../../../images/how-to-install-extensions-1.webp)

有些比较新的扩充功能则是要你复制Github储存库网址，并点选`Install from URL`，它会自动完成Git clone的操作。

![](../../../images/how-to-install-extensions-2.webp)

在安装扩充功能后，都要点选Installed → Apply and restart WebU重新载入网页界面。有些则是得关掉终端机，整个重新启动。

![](../../../images/how-to-install-extensions-3.webp)

如果未来要更新扩充功能，点选Check for updates。


# 2. 用指令安装

Stable Diffusion WebUI的扩充功能目录一律放在`extensions`资料夹。

1. 用指令安装扩充功能前先关闭主程式。

2. 接着在`stable-diffusion-webui/extensions`资料夹开启终端机，执行`git clone`指令，安装扩充功能。例如要安装正体中文翻译的话就是：
```bash
git clone https://github.com/benlisquare/stable-diffusion-webui-localization-zh_TW.git
```

3. 重新启动SD WebUI，即会看到新安装的扩充功能。

未来要一次更新全部扩充功能的话，在`stable-diffusion-webui/extensions`资料夹开启终端机，执行以下指令：
```bash
# Windows
Get-ChildItem | ForEach-Object { git -C $_.FullName pull }

# Linux
ls | xargs -I{} git -C {} pull
```
