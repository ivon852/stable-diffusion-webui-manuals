---
title: "安装至Windows"
weight: 4
---

Stable Diffusion WebUI支持Windows 10和Windows 11操作系统。


# 1. 安装显卡驱动

请确认电脑已经安装最新版的显示卡驱动。

Nvidia显示卡建议用[Geforce Experience](https://www.nvidia.com/zh-tw/geforce/geforce-experience/)安装最新驱动，会顺便安装CUDA。或者你想[手动下载CUDA](https://developer.nvidia.com/cuda-downloads)也行。

AMD请用[驱动自动侦测工具](https://www.amd.com/zh-hant/support/kb/faq/gpu-131)安装显示卡驱动。


# 2. 安装Git和Python

1. 下载Git版本管理工具。至[Git for Windows](https://gitforwindows.org/)下载安装档，一直下一步即可。

![](../../../images/ozgVF8y.webp)

2. 接着安装Python。 SD WebUI建议Python版本为`3.10.6`。请至[Python官网](https://www.python.org/downloads/release/python-3106/)下载`Python 3.10.6`的64位元安装包。

![](../../../images/a3JMgF9.webp)

3. 安装前务必勾选`Add Python 3.10 to PATH`，将Python加到环境变量。再按`Install Now`。

![](../../../images/DMo5Wkt.webp)

<details>

<summary>(进阶) 如果你熟悉Python开发的话，改用Anaconda设定Python虚拟环境会更好。点选展开</summary>

Anaconda是针对资料科学打造的Python发行版，能管理一部电脑上的多重Python版本。如果之前已经装过旧版Python，不需要解除安装。

如果选择以Anaconda来安装Stable Diffusion WebUI的依赖，那么日后就不能用Windows终端机执行`webui-user.bat`，而得使用Anaconda Prompt，除非你将conda加入环境变量。

1. 安装[Anaconda](https://www.anaconda.com/products/distribution)或[Miniconda](https://docs.conda.io/en/latest/miniconda.html#windows-installers)

2. 搜寻应用程序列表，开启Anaconda Prompt

3. 切换至Stable Diffusion WebUI所在文件夹 (需先执行下一节的git clone指令)
```powershell
cd C:\user\user\Desktop\stable-diffusion-webui
```

4. 建立Pyhton 3.10.6的虚拟环境
```bash
conda create --name sdwebui python=3.10.6
```

5. 启动虚拟环境，然后再看下下节设定并启动`webui-user.bat`，安装Python依赖包。
```bash
conda activate sdwebui
```

</details>


# 3. 复制Stable Diffusion WebUI储存库

1. 开启文件管理器，在桌面文件夹里按右键＋Shift，点选`在这里开启Powershell`或`终端机视窗`。如果你C盘空间不足的话，也可以切换到其他文件资料夹再开启终端机。

![](../../../images/6HJHSMy.webp)

2. 输入以下指令，检查目前Python版本，输出应为3.10.6
```bash
python --version
```

3. Nvidia显示卡用户输入以下指令，确认CUDA是否有正确安装，输出应含有`nvcc: NVIDIA (R) Cuda compiler driver`
```bash
nvcc --version
```

4. Nvidia显卡用户输入以下指令，复制Stable Diffusion WebUI的储存库。复制完成后保持终端机开着。
```bash
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
```

＊ AMD显卡用户请暂时先用这个专门设计给AMD DirectML的分支：
```bash
git clone https://github.com/lshqqytiger/stable-diffusion-webui-directml.git
```

5. 复制完成后，桌面会多出文件夹`stable-diffusion-webui`。如果你有下载模型，将刚刚下载的存档点模型放到`models\Stable-diffusion`文件夹。这个资料夹可放入多个存档点模型。

![](../../../images/8aCrI2p.webp)


# 4. 设定启动引数

对`stable-diffusion-webui`文件夹里面的`webui-user.bat`按右键，以记事本开启，编辑`COMMANDLINE_ARGS=`这一行后面的启动引数。 (看不到.bat请点文件管理器检视 → 显示/隐藏 → 显示扩展名)

![](../../../images/Z56oZMe.webp)

若显示卡VRAM小于等于4GB的话加入`COMMANDLINE_ARGS=--medvram --opt-split-attention`引数。

电脑RAM（不是VRAM）小于等于8GB的话改加入`COMMANDLINE_ARGS=--lowvram --opt-split-attention`引数。注意使用`--lowvram`引数会让高阶显卡算图变很慢。

(下面的不加也可以)

加入`--xformers`引数可进一步减少VRAM使用量。 `--no-half-vae`降低用VAE时算出黑图的机率。

加上`--enable-insecure-extension-access`让你在网页界面直接装扩充功能。

加入`--listen`引数再开放防火墙7860通讯埠，即可用区域网路其他电脑的浏览器访问WebUI。

加入`--share`引数则会产生一组Gradio网址，让你可以从外部网路或手机使用WebUI。网址72小时后过期。

其余可用引数请见[命令列引数](..installation/command-line-arguments-and-settings/)


# 5. 启动Stable Diffusion WebUI

初次启动会下载好几GB的资料，请保持网路顺畅。如果你的网络无法正常访问Github，请想办法找代理绕过。

1. 回到终端机，输入以下指令启动SD WebUI：
```bash
cd stable-diffusion-webui
./webui-user.bat
```

2. 初次启动会下载依赖，大概要等个30分钟安装。如果在此步骤遇到错误，请先看[常见问题](../installation/errors/)。

![](../../../images/k7zpeWV.webp)

3. 启动完成后会显示一组网址。执行程式时请勿关闭终端机。

![](../../../images/cQt7XvU.webp)

4. 用浏览器开启：`http://127.0.0.1:7860`就可进入图形界面了。执行时请勿关闭终端机，执行时若出错终端机也会输出讯息。

![](../../../images/fCC9Rxv.webp)

5. 要关闭SD WebUI，在终端机按Ctrl+C终止，再关闭视窗。

日后要启动SD WebUI，只要对文件夹里面的`webui-user.bat`按二下即可 (不需要用管理员身份执行)。
