---
title: "❓ 如何更新程序"
weight: 20
---

AUTOMATIC1111的Stable Diffusion WebUI项目原代码托管在Github，目前「更新」是以`git pull`指令来操作。

版本号码和更新日志可以到[Github Releases](https://github.com/AUTOMATIC1111/stable-diffusion-webui/releases)查看。

1. 进入`stable-diffusion-webui`文件夹，在里面打开终端机

Windows请于空白处按右键＋SHIFT → 打开终端机

Linux和macOS请用cd指令，切换到`stable-diffusion-webui`文件夹：
```bash
cd ~/stable-diffusion-webui
```

2. 如果您已经很久没更新，或是AUTOMATIC1111发布了大版本更新，则建议您删除`venv`文件夹，让它启动后重装依赖套件。

3. 拉取最新分支，更新到最新版文件。
```bash
git reset --hard main
git pull
```

4. 检查启动指令稿(用文本编辑器打开`webui-user.bat`或`webui-user.sh`)，查看[命令行参数](https://ivonblog.com/posts/stable-diffusion-webui-manuals/installation/command-line-arguments-and-settings/)有无变更。

5. 启动WebUI
