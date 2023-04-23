---
title: "安装至macOS"
weight: 5
---

以macOS Ventura作例子。


# 1. 安装包管理器Homebrew

Brew是安装下面的东西所需要的必备工具，需要用到终端机指令。

1. 在应用列表开启终端机

![](/posts/stable-diffusion-webui-manuals/images/MKYNa6u.avif)

2. 贴上以下指令安装Homebrew (此指令来自[Homebrew官网](https://brew.sh/index_zh-tw))
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

3. 输入密码，全部Enter，等待安装完成。下面Homebrew在安装软件的时候都需要输入密码。

![](/posts/stable-diffusion-webui-manuals/images/BvkF63l.avif)


# 2. 安装Git和Anaconda

1. 继续开着终端机。输入以下指令安装Git版本管理工具。
```bash
brew install git
```


2. 接着是Pyhton。 Pyhton用Anaconda来建立虚拟环境比较方便，输入以下指令安装：
```bash
brew install --cask anaconda
echo 'export PATH="/usr/local/anaconda3/bin:$PATH" ' >> ~/.zshrc
source  ~/.zshrc
conda init zsh
```

3.  建立Python 3.10.6的虚拟环境，输入y同意，它会自动下载必要的包

```bash
conda create --name sdwebui python=3.10.6
```


# 3. 复制Stable Diffusion WebUI储存库

1. 将Stable Diffusion WebUI复制至家目录
```bash
cd ~
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
```

2. 开启Finder，点选前往 → 个人专属，会看到多了一个`stable-diffusion-webui`资料夹，这个就是软件本体了。

![](/posts/stable-diffusion-webui-manuals/images/xPSMOZa.avif)

3. 将下载的模型档移动至`stable-diffusion-webui`下的`models/Stable-diffusion`文件夹。

![](/posts/stable-diffusion-webui-manuals/images/XZvCmqn.avif)

4, 接着回到终端机，启动Python虚拟环境，终端机提示符前面会变成`(sdwebui)`
```bash
conda activate sdwebui
```


# 4. 设定启动引数

找到`stable-diffusion-webui`文件夹下的`webui-user.sh`，右键用文字编辑器开启。

![](/posts/stable-diffusion-webui-manuals/images/0nkVg73.avif)

参考上图框起来的地方，填入`export COMMANDLINE_ARGS=--medvram --opt-split-attention`引数，降低VRAM使用量。

额外加上`--listen`参数让其他电脑能以IP访问网页界面，`--share`则是产生一组Gradio网址。

其余引数请参阅[命令列引数](/posts/stable-diffusion-webui-manuals/installation/command-line-arguments-and-settings/)页面。


# 5. 启动Stable Diffusion WebUI

1. 执行`webui.sh`，它会自动下载PyTorch并安装依赖。
```bash
cd ~/stable-diffusion-webui
./webui.sh
```

2. 跑完它应该会显示一组网址

![](/posts/stable-diffusion-webui-manuals/images/vT6gVFu.avif)


3. 用浏览器开启`http://127.0.0.1:7860`进入网页图形界面。执行时请保持终端机开着。

![](/posts/stable-diffusion-webui-manuals/images/ZK9gSnP.avif)

欲中止SD WebUI执行，直接将对终端机图示按右键终止即可。

日后要启动SD WebUI，就是开启终端机，执行以下指令就会开启网页界面。
```bash
conda activate sdwebui
cd ~/stable-diffusion-webui
./webui.sh
```
