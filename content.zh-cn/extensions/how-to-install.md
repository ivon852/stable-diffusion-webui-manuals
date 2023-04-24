---
title: "3.1. 如何安装扩展"
weight: 1
---


# 用图形界面安装

最简单的就是点选Extensions → Available的`Load from:`，就会列出可下载安装的扩展。

![](../../../images/FwlfcXi.webp)

有些比较新的扩展则是要你复制Github仓库連結，并点选`Install from URL`，它会自动完成Git clone的操作。

![](../../../images/mrcehrU.webp)

在安装扩展后，都要点选Installed → Apply and restart WebU重新载入网页界面。有些则是得关掉终端机，整个重新启动。

![](../../../images/9QksXqM4.webp)

如果未来要更新扩展，点选Check for updates。


# 用指令安装

Stable Diffusion WebUI的扩展目录一律放在`extensions`文件夹。

1. 用指令安装扩展前先关闭軟件。

2. 接着在`stable-diffusion-webui/extensions`文件夹开启终端机，执行`git clone`指令，安装扩展。例如要安装中文翻译的话就是：
```bash
git clone https://github.com/dtlnor/stable-diffusion-webui-localization-zh_CN.git
```

3. 重新启动SD WebUI，即会看到新安装的扩展。

未来要一次更新全部扩展的话，在`stable-diffusion-webui/extensions`文件夹开启终端机，执行以下指令：
```bash
# Windows
Get-ChildItem | ForEach-Object { git -C $_.FullName pull }

# Linux
ls | xargs -I{} git -C {} pull
```
