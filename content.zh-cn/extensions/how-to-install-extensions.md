---
title: "❓ 如何安装扩充功能"
weight: 1
---

注意：安装扩充功能可能会导致Stable Diffusion WebUI无法启动，或是启动变慢。

如果遇到bug，您应当优先到扩充功能开发者的保存库回报，而非直接到AUTOMATIC1111的保存库询问。


# 1. 用图形界面安装

1. 您必须在[命令行参数](../installation/command-line-arguments-and-settings/)加入`--enable-insecure-extension-access`才能从图形界面装扩充功能。

2. 最简单的方法就是点击Extensions → Available的`Load from:`，就会列出可下载安装的扩充功能，点击安装。

![](../../../images/how-to-install-extensions-1.webp)

3. 有些比较新的扩充功能则是要您拷贝Github保存库网址，并点击选Extensions → `Install from URL`，粘贴网址再按Install，它会自动完成git clone的操作。

![](../../../images/how-to-install-extensions-2.webp)

4. 在安装扩充功能后，都要点击Installed → Apply and restart WebU，重新加载网页界面。有些则是得关掉终端机，重新启动WebUI。

![](../../../images/how-to-install-extensions-3.webp)

5. 如果未来要更新扩充功能，点击Installed → Check for updates，等待下载完成，然后重启WebUI。您可以在这个界面按取消打勾来禁用特定的扩充功能。

![](../../../images/how-to-install-extensions-4.webp)


# 2. 用指令安装

Stable Diffusion WebUI的扩充功能目录一律放在`extensions`文件夹。

1. 用指令安装扩充功能前先关闭主程序。

2. 接着在`stable-diffusion-webui/extensions`文件夹打开终端机，运行`git clone`指令，安装扩充功能。例如要安装正体中文翻译的话就是把该保存库拷贝下来：
```bash
git clone https://github.com/benlisquare/stable-diffusion-webui-localization-zh_TW.git
```

3. 重新启动SD WebUI，即会看到新安装的扩充功能。

未来要一次更新全部扩充功能的话，在`stable-diffusion-webui/extensions`文件夹打开终端机，运行以下指令：
```bash
# Linux
ls | xargs -I{} git -C {} pull

# Windows
Get-ChildItem | ForEach-Object { git -C $_.FullName pull }
```


# 3. 如何移除扩充功能

1. 关闭Stable Diffusion WebUI的终端机。

2. 到`stable-diffusion-webui`下的`extension`文件夹，将要移除的扩充功能文件夹删除。

3. 如果要完全移除扩充功能，将`stable-diffusion-webui`下的`venv`文件夹也删除，迫使主程序下次启动重新安装pip依赖套件。
