---
title: "🖥️ 安装至Windows"
weight: 4
---

Stable Diffusion WebUI支持Windows 10和Windows 11。


# 1. 安装显卡驱动程序

请确认电脑已经安装最新版的显卡驱动程序。

Nvidia显卡建议用[Geforce Experience](https://www.nvidia.com/zh-tw/geforce/geforce-experience/)安装最新驱动，会顺便安装CUDA。或者你想[手动下载CUDA](https://developer.nvidia.com/cuda-downloads)也行。

AMD请用[驱动程序自动侦测工具](https://www.amd.com/zh-hant/support/kb/faq/gpu-131)安装显卡驱动。


# 2. 安装Git和Python

1. 下载Git版本管理工具。至[Git for Windows](https://gitforwindows.org/)下载安装档，一直下一步即可。

![](../../../images/windows-installation-1.webp)

2. 接着安装Python。SD WebUI建议Python版本为`3.10.6`。请至[Python官网](https://www.python.org/downloads/release/python-3106/)下载`Python 3.10.6`的64比特安装档。

![](../../../images/windows-installation-2.webp)

3. 安装前务必勾选`Add Python 3.10 to PATH`，将Python加到环境变量。再按`Install Now`。

![](../../../images/windows-installation-3.webp)

<details>

<summary>(高端) 如果你熟悉Python开发的话，改用Anaconda设置Python虚拟环境会更好。点击展开</summary>

Anaconda是针对数据科学打造的Python发行版，能管理一部电脑上的多重Python版本。如果之前已经装过旧版Python，不需要卸载。

如果选择以Anaconda来安装Stable Diffusion WebUI的依赖套件，那么日后就不能用Windows终端机运行`webui-user.bat`，而得使用Anaconda Prompt，除非你将conda加入环境变量。

1. 安装[Anaconda](https://www.anaconda.com/products/distribution)或[Miniconda](https://docs.conda.io/en/latest/miniconda.html#windows-installers)

2. 搜索应用程序列表，打开Anaconda Prompt

3. 切换至Stable Diffusion WebUI所在文件夹 (需先运行下一节的git clone指令)
```powershell
cd C:\user\user\Desktop\stable-diffusion-webui
```

4. 创建Pyhton 3.10.6的虚拟环境
```bash
conda create --name sdwebui python=3.10.6
```

5. 启动虚拟环境，然后再看下下节设置并启动`webui-user.bat`，安装Python依赖套件。
```bash
conda activate sdwebui
```

</details>


# 3. 拷贝Stable Diffusion WebUI保存库

1. 打开文件总管，在桌面文件夹里面按右键＋Shift，点击`在这里打开Powershell`或`终端机窗口`。如果你C槽空间不足的话，也可以切换到其他硬盘文件夹再打开终端机。

![](../../../images/windows-installation-4.webp)

2. 输入以下指令，检查目前Python版本，输出应为3.10.6
```bash
python --version
```

3. Nvidia显卡用户输入以下指令，确认CUDA是否有正确安装，输出应含有`nvcc: NVIDIA (R) Cuda compiler driver`
```bash
nvcc --version
```

4. Nvidia显卡用户输入以下指令，拷贝Stable Diffusion WebUI的保存库。拷贝完成后保持终端机开着。
```bash
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
```

＊ AMD显卡用户请暂时先用这个专门设计给AMD DirectML的分支：
```bash
git clone https://github.com/lshqqytiger/stable-diffusion-webui-directml.git
```

5. 拷贝完成后，桌面会多出文件夹`stable-diffusion-webui`。如果你有下载模型，将刚刚下载的存盘点模型放到`models\Stable-diffusion`文件夹。这个文件夹可放入多个存盘点模型档。

![](../../../images/windows-installation-5.webp)


# 4. 设置启动参数

对`stable-diffusion-webui`文件夹里面的`webui-user.bat`按右键，以记事本打开，编辑`COMMANDLINE_ARGS=`这一行后面的启动参数。(看不到.bat请点击文件总管查看 → 显示/隐藏 → 显示扩展名)

![](../../../images/windows-installation-6.webp)

若显卡VRAM小于等于4GB的话加入`COMMANDLINE_ARGS=--medvram --opt-split-attention`参数。

电脑RAM（不是VRAM）小于等于8GB的话改加入`COMMANDLINE_ARGS=--lowvram --opt-split-attention`参数。注意使用`--lowvram`参数会让高端显卡算图变很慢。

(下面的不加也可以)

加入`--xformers`参数可进一步减少VRAM使用量。`--no-half-vae`降低用VAE时算出黑图的几率。

加上`--enable-insecure-extension-access`让你在网页界面直接装扩充功能。

加入`--listen`参数再开放防火墙7860通信端口，即可用局域网路其他电脑的浏览器访问WebUI。

加入`--share`参数则会产生一组Gradio网址，让你可以从外部网络或手机使用WebUI。网址72小时后过期。

其余可用参数请见[命令行参数](../installation/command-line-arguments-and-settings/)


# 5. 启动Stable Diffusion WebUI

初次启动会下载好几GB的数据，请保持网络顺畅，不要开VPN。如果你所在的地方有网络审查干扰Github连接，请想办法找代理绕过。

1. 回到终端机，输入以下指令启动SD WebUI：
```bash
cd stable-diffusion-webui
./webui-user.bat
```

2. 初次启动会下载依赖套件，大概要等个30分钟安装。如果在此步骤遇到错误，请先看[常见问题](../installation/errors/)。

![](../../../images/windows-installation-7.webp)

3. 启动完成后会显示一组网址。运行程序时请勿关闭终端机。

![](../../../images/windows-installation-8.webp)

4. 用浏览器打开：`http://127.0.0.1:7860`就可进入图形界面了。运行程序时请勿关闭终端机，运行时若出错终端机也会输出消息。

![](../../../images/windows-installation-9.webp)

5. 要关闭SD WebUI，在终端机按Ctrl+C终止，再关闭窗口。

日后要启动SD WebUI，只要对文件夹里面的`webui-user.bat`按二下即可 (不需要用系统管理员运行)。
