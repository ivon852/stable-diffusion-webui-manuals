---
title: "❓ 如何更新程序"
weight: 20
---

AUTOMATIC1111的Stable Diffusion WebUI项目原代码托管在Github，目前「更新」是以`git pull`指令来操作。

最新版本号码和更新日志可以到[Github Releases](https://github.com/AUTOMATIC1111/stable-diffusion-webui/releases)查看。

## 1. 检查本机程序版本

这节步骤是用于检查本机程序的版本，非必要。如果未来要降版才运行这些步骤。

1. 进入`stable-diffusion-webui`文件夹，在里面打开终端机

Windows请于空白处按右键＋SHIFT → 打开终端机

Linux和macOS请用cd指令，切换到`stable-diffusion-webui`文件夹：
```bash
cd ~/stable-diffusion-webui
```

2. 输入以下指令，会印出一组长长的英数代码，
```bash
git rev-parse HEAD
# 范例输出：89f9faa63388756314e8a1d96cf86bf5e0663045
```

3. 这串英数就是本机程序的版本(分支代码)。更新后要降版的话，务必记下此代码。


## 2. 更新程序到最新版本

1. 进入`stable-diffusion-webui`文件夹，在里面打开终端机

Windows请于空白处按右键＋SHIFT → 打开终端机

Linux和macOS请用cd指令，切换到`stable-diffusion-webui`文件夹：
```bash
cd ~/stable-diffusion-webui
```

2. 如果您已经很久没更新，或是AUTOMATIC1111发布了大版本更新，则建议您删除`venv`文件夹，让它启动后重装依赖套件。

3. 如果您想要在更新后降版，请先运行上面提及的`git rev-parse HEAD`指令取得本机的分支代码。

4. 拉取最新分支，更新到最新版文件。
```bash
git reset --hard main
git pull
```

5. 检查启动指令稿(用文本编辑器打开`webui-user.bat`或`webui-user.sh`)，查看[命令行参数](https://ivonblog.com/posts/stable-diffusion-webui-manuals/installation/command-line-arguments-and-settings/)有无变更。

6. 启动WebUI，看能否正常启动，以及查看有哪些新变化。

7. 如果您发现某个功能坏掉，想要降版回之前的版本，则在终端机按CTRL+C终止程序，然后输入`git checkout`指令，退回之前的版本：
```bash
git checkout "分支代码"
```
