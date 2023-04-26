---
title: "❓ 如何更新程序"
weight: 20
---

Stable Diffusion WebUI的项目原代码托管在Github，目前「更新」是以`git pull`指令来操作。

1. 在`stable-diffusion-webui`这个文件夹里面打开终端机

Windows请按右键＋SHIFT → 打开终端机

Linux/MacOS请用cd指令，切换到`stable-diffusion-webui`目录：
```bash
cd ~/stable-diffusion-webui
```

2. 保险起见，先用`git rev-parse`指令取得目前分支，会印出一组五位数分支代码
```bash
git rev-parse --short HEAD
```

3. 接着拉取最新分支，更新到最新版文件。
```bash
git pull
```

4. 如果文件无法拉取，请使用`git reset`：
```bash
git reset --hard main
git pull
```

5. 如果出现`Merge branch 'master' of`的消息，请按`Esc`键，输入`:q!`退出即可。


前面用到的`git rev-parse`这个指令，是用来切出分支，降级用的指令。

若是在更新程序后有功能坏掉，那就用`git checkout`降回之前的版本。
```bash
git checkout "分支代码"
```
