---
title: "🖥️ 安装至macOS"
weight: 5
---

以macOS Ventura作示范。


# 1. 安装套件管理员Homebrew

Brew是安装下面的东西所需要的必备工具，需要用到终端机指令。

1. 在应用程序列表打开终端机

![](../../../images/macos-installation-1.webp)

2. 粘贴以下指令安装Homebrew (此指令来自[Homebrew官网](https://brew.sh/index_zh-tw))
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

3. 输入密码，全部Enter，等待安装完成。下面Homebrew在安装软件的时候都需要输入密码。

![](../../../images/macos-installation-2.webp)


# 2. 安装Git和Anaconda

1. 继续开着终端机。输入以下指令安装Git版本管理工具。
```bash
brew install git
```


2. 接着是Pyhton。Pyhton用Anaconda来创建虚拟环境比较方便，输入以下指令安装：
```bash
brew install --cask anaconda
echo 'export PATH="/usr/local/anaconda3/bin:$PATH" ' >> ~/.zshrc
source  ~/.zshrc
conda init zsh
```

3.  创建Python 3.10.6的虚拟环境，输入y同意，它会自动下载必要的套件

```bash
conda create --name sdwebui python=3.10.6
```


# 3. 拷贝Stable Diffusion WebUI保存库

1. 将Stable Diffusion WebUI拷贝至家目录
```bash
cd ~
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
```

2. 打开Finder，点击前往 → 个人专属，会看到多了一个`stable-diffusion-webui`文件夹，这个就是程序本体了。

![](../../../images/macos-installation-3.webp)

3. 将下载的模型档移动至`stable-diffusion-webui`下的`models/Stable-diffusion`文件夹。

![](../../../images/macos-installation-4.webp)

4, 接着回到终端机，启动Python虚拟环境，终端机提示符前面会变成`(sdwebui)`
```bash
conda activate sdwebui
```


# 4. 设置启动参数

找到`stable-diffusion-webui`文件夹下的`webui-user.sh`，右键用文本编辑器打开。

![](../../../images/macos-installation-5.webp)

参考上图框起来的地方，填入`export COMMANDLINE_ARGS=--medvram --opt-split-attention`参数，降低VRAM使用量。

额外加上`--listen`参数让其他电脑能以IP访问网页界面，`--share`则是产生一组Gradio网址。

其余参数请参阅[命令行参数](../installation/command-line-arguments-and-settings/)页面。


# 5. 启动Stable Diffusion WebUI

1. 运行`webui.sh`，它会自动下载PyTorch并安装依赖套件。
```bash
cd ~/stable-diffusion-webui
./webui.sh
```

2. 跑完它应该会显示一组网址

![](../../../images/macos-installation-6.webp)


3. 用浏览器打开`http://127.0.0.1:7860`进入网页图形界面。运行程序时请保持终端机开着。

![](../../../images/macos-installation-7.webp)

欲中止SD WebUI运行，直接将对终端机图标按右键终止即可。

日后要启动SD WebUI，就是打开终端机，运行以下指令就会打开网页界面。
```bash
conda activate sdwebui
cd ~/stable-diffusion-webui
./webui.sh
```
