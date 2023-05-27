---
title: "❓ 常见安装问题"
weight: 21
---

本节列出一些安装AUTOMATIC1111的Stable Diffusion WebUI常遇到的错误消息的解决方式。

![](../../../images/errors-1.png)


# 1. 如何回报错误

你可以到[我的Discussion](https://github.com/ivon852/netlify-ivon-blog-comments/discussions/437)或是[AUTOMATIC1111保存库的Issue](https://github.com/AUTOMATIC1111/stable-diffusion-webui/issues)查看别人遇过的错误消息。

如果遇到了真正无法解决的错误，请注册Github帐号，并到[AUTOMATIC1111保存库的Issue](https://github.com/AUTOMATIC1111/stable-diffusion-webui/issues)页面，点击New Issue → Bug Report，用英文填写遇到的状况。


# 确保您的电脑符合Stable Diffusion的系统需求

参阅[Stable Diffusion系统需求](../installation/system-requirements)


# 可能是扩充功能导致的错误

有时除了Stable Diffusion WebUI本身问题外，也有可能是你安装的扩充功能出错导致程序无法启动。

请尝试删除`stable-diffusion-webui/extensions`下的某个新安装的扩充功能文件夹，或是将整个extensions文件夹先移动到其他位置，再尝试启动SD WebUI。

也可以尝试将Stable Diffusion WebUI主程序[更新到最新版本](../installation/how-to-update)。


# RuntimeError: CUDA Out of memory

显卡的VRAM不足。Stable Diffusion WebUI的显卡VRAM最低要求为4GB，要无压力的玩建议8GB以上。

打开`webui-user.bat`，在`COMMANDLINE_ARGS`后面加入`--medvram`或`--lowvram`参数，降低VRAM使用量。如果还是在生图时出现此消息，建议降低生图的分辨率，或是买张更好的显卡，或是改用[Google Colab](https://ivonblog.com/posts/google-colab-stable-diffusion-webui/)。


# No module named pip

于`stable-diffusion-webui`文件夹，右键＋SHIFT，打开终端机，运行`python3 -m ensurepip`安装pip

然后删除`venv`文件夹，重新运行`webui-user.bat`


# 因为文件包含病毒或潜在的垃圾软件，所以作业未顺利完成

如果你的Stable Diffusion WebUI是从Github下载，模型也是从HuggingFace或Civitai等安全网站下载，则可以断定是误判。

暂时[关闭Windows Defender](https://adersaytech.com/tutorial/kb-article/disable-windows-defender.html)之类的杀毒软件，再删除`stable-diffusion-webui\venv`文件夹，重新运行`webui-user.bat`。


# RuntimeError: Couldn't install torch.

几个可能：

1. 确认Python版本为3.10.6，不可从微软商店安装。并确认是否有安装最新GPU驱动(Nvidia需要额外安装CUDA)。

2. 杀毒软件挡住。

3. 非Nvidia GPU用户也可能遇到此错误，于`webui-user.bat`的`COMMANDLINE_ARGS`加入`--skip-torch-cuda-test`参数跳过检测。

4. 你没有独显，所以它不给跑。没有独显请考虑用[Google Colab](https://ivonblog.com/posts/google-colab-stable-diffusion-webui/)


# Torch is not able to use GPU

如果显卡是Nvidia的话，请确认CUDA有正确安装。

显卡是AMD的话，编辑`webui-user.bat`，加入`COMMANDLINE_ARGS=--medvram --opt-split-attention --skip-torch-cuda-test`

修改完之后，删除`venv`文件夹，重新启动WebUI。


# fatal: unable to access Recv failure: Connection was reset

网络问题，好发于中国用户，因为GFW对Github的连接干扰导致相关文件下载失败。

需要[换个代理](https://www.bilibili.com/read/cv21253533/)或[改DNS](https://zhuanlan.zhihu.com/p/571519560)才能正常连接。

但是有时只将部份网址换成「国内源」是不够的，因为Stable Diffussion WebUI还会尝试从HuggingFace等处下载模型。

为此全域挂着VPN，避免连接受到阻扰会是较好的作法。


# AssertionError: extension access disabled because of commandline flags

`webui-user.bat`(或`webui-user.sh`)的`COMMANDLINE_ARGS`有加入`--share`或`--listen`参数就会无法从网页界面装扩充功能，这是出于安全性考量。

你可以：

1. 将`--share`或`--listen`参数删除。
2. 额外加上`--enable-insecure-extension-access`参数。
3. 改用Git clone的方式来安装扩充功能：关闭SD WebUI。于`stable-diffusion-webui\extensions`文件夹打开终端机，输入`git clone <保存库网址>`下载扩充功能。


# modules.devices.NansException: A tensor with all NaNs was produced in Unet.

此错误可能会发生在含有VAE的模型算图的时候，会导致算出来结果是黑图。

打开`webui-user.bat`，`COMMANDLINE_ARGS`后面额外加上`--no-half --no-haf-vae`参数。


# OSError: [Errno 28] No space left on device

硬盘或暂存文件夹没空间了，[清出空间](https://helpcenter.trendmicro.com/zh-tw/article/tmka-08271/)后，删除stable-diffusion-webui里面的`venv`文件夹，再重新运行webui-user.bat重装。


# 127.0.0.1:7860拒绝连接

变量太多，提供几个可能解决方案：

1. 请确认打开网址前终端机是否还开着，并有显示`Running on Local URL : http://127.0.0.1:7860`的字样
2. 网址改用`http://localhost:7860`连接
3. 用记事本打开`C:\Windows\System32\drivers\etc\hosts`，确认里面有无`127.0.0.1 localhost`这一行。
4. 请确认电脑没有运行其他服务器的程序(如Microsoft IIS)，导致占用通信端口。
5. 打开终端机，运行`ipconfig /flushdns`指令刷新DNS纪录
6. 暂时关闭防火墙


# DefaultCPUAllocator: not enough memory: you tried to allocate

电脑RAM不足。跑Stable Diffusion WebUI的RAM至少要8GB，低于此数值的话，Windows用户请试着激活[系统正在管理分页档大小](https://support.microsoft.com/zh-tw/windows/%E6%94%B9%E5%96%84-windows-%E9%9B%BB%E8%85%A6%E6%95%88%E8%83%BD%E7%9A%84%E6%8F%90%E7%A4%BA-b3b3ef5b-5953-fb6a-2528-4bbed82fba96)，Linux用户则是增加SWAP的大小。


# RuntimeError: unexpected EOF, expected more bytes. The file might be corrupted.

可能是文件毁损，删除这些文件夹：`stable-diffusion-webui\models\GFPGAN`、`stable-diffusion-webui\models\Codeformer`、`stable-diffusion-webui\repositories\CodeForme`

然后重启SD WebUI让它重新下载脸部模型。


# Cloning Taming Transformers into repositories\taming-transformers...

这不是错误，单纯是还在下载而已。

有时候Github下载会比较慢，要耐心等。如果下载失败，删除`venv`文件夹，并晚点重新运行`webui-user.bat`试试。


# can't open file '/stable-diffusion-webui/launch.py

如果运行`webui-user.sh`出现此错误，则编辑`webui-user.sh`，将`install_dir`后面改成`$(pwd)`。

如果是在Google Colab遇到此错误，代表程序没装成功，请看一下终端机输出，检查前面的指令是否有哪步运行出错。


# Couldn't launch python, exit code 9009

Windows用户请重装Python 3.10.6，并确认有在安装界面勾选`Add Python to PATH`


# libtcmalloc.so.4 python3: version `GLIBCXX_3.4.30' not found (required by /usr/lib/libtcmalloc.so.4)

可能是暂时性的bug。

启动conda虚拟环境：`conda activate sdwebui`，然后安装gcc：`conda install -c conda-forge gcc`，接着退出虚拟环境：`conda deactivate`，再尝试启动WebUI。


# PyTorch has CUDA Version=11.7 and torchvision has CUDA Version=11.8. Please reinstall the torchvision that matches your PyTorch install.

可能是暂时性的bug。

如果有使用Anaconda，启动conda虚拟环境：`conda activate sdwebui && source venv/bin/activate`

安装旧版本PyTorch：`pip uninstall torch && pip install xformers==0.0.16rc425 torch==1.13.1+cu117 torchvision==0.14.1+cu117 --extra-index-url https://download.pytorch.org/whl/cu117`

接着退出虚拟环境：`deactivate && conda deactivate`

再尝试启动WebUI。
