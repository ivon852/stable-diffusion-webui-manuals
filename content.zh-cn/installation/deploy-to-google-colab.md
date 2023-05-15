---
title: "☁️ 部署至Google Colab"
weight: 11
---

Google Colab是Google Research推出的免费在线服务，可用服务器等级的高级显卡跑Python程序。有需要的话还可以付费买Pro版，使用更高级的GPU。

|❗2023年4月21日，Google Colab员工在[Twitter](https://twitter.com/thechrisperry/status/1649189902079381505)宣布，需要付费购买Pro版才可以跑stable-diffusion-webui。免费版用户一侦测到`stable-diffusion-webui`字符串就会被封锁，出现`You may be executing code that is disallowed, and this may restrict your ability to use Colab in the future.`的警告消息。❗|
|-----------------------------------------|


Google Colabu已有很多现成的Stable Diffusion WebUI笔记本可以直接用，不用自己写程序，例如[camenduru的笔记本](https://ivonblog.com/posts/google-colab-stable-diffusion-webui/)。

如果你想自己写Stable Diffusion笔记本，这边提供我的范本程序，采最小安装，只安装必要的东西。

我的想法是将SD WebUI的程序和模型文件放到安装至云端。优点是装好后，日后要用就能二分钟内启动，而不用等下载模型。

缺点就是很占云端空间，大概需要10GB左右容量。15GB免费容量只够装一个存盘点模型和少许LoRA，再勉强塞个ControlNet的扩充功能。因此我的代码只下载必要的文件，扩充功能需要再另外装。

![](../../../images/deploy-to-google-colab-1.webp)

1. 至[Google Colab](https://colab.research.google.com/)，点击添加笔记本。

![](../../../images/deploy-to-google-colab-2.webp)

2. 点击添加保存格，填入以下内容。先别点击运行，这边我是分步讲解，后面再将这些代码合起来。
```python
# 挂载云端硬盘
from google.colab import drive
drive.mount('/content/drive')

# 创建存放程序文件的文件夹
!mkdir /content/drive/MyDrive/sd-webui-files
```

3. 于同一个保存格，再往下添加代码，安装CUDA
```python
# 安装CUDA、xformers、Triton依赖
!pip install torch==1.13.1+cu116 torchvision==0.14.1+cu116 torchaudio==0.13.1 --extra-index-url https://download.pytorch.org/whl/cu116 -U
!pip install -q xformers==0.0.16
!pip install -q triton==2.0.0
```

4. 拷贝SD WebUI的保存库到Google云端的`sd-webui-files`文件夹
```python
# 拷贝SD WebUI上游的保存库
!git clone --depth=1 https://github.com/AUTOMATIC1111/stable-diffusion-webui.git /content/drive/MyDrive/sd-webui-files/stable-diffusion-webui
```

5. 下载Anything V4.5存盘点模型至`sd-webui-files/stable-diffusion-webui/models`文件夹，网址为在模型网站按右键取得
```python
!wget -nc -P "/content/drive/MyDrive/sd-webui-files/stable-diffusion-webui/models/Stable-diffusion" "https://huggingface.co/andite/anything-v4.0/resolve/main/anything-v4.5-pruned.safetensors"
```

6. 接着修正保存库版本错误
```bash
# 防止其他保存库造成错误
%cd /content/drive/MyDrive/sd-webui-files/stable-diffusion-webui/
!git reset --hard
!git pull
!sed -i -e 's/checkout {commithash}/checkout --force {commithash}/g' launch.py
```

7. 最后，启动WebUI
```python
# 启动WebUI。直接从launch.py传递参数
!python launch.py --share --xformers --enable-insecure-extension-access --theme light
```

以上的代码合并起来就是如下样子：
```python
from google.colab import drive
drive.mount('/content/drive')
!mkdir /content/drive/MyDrive/sd-webui-files
!pip install torch==1.13.1+cu116 torchvision==0.14.1+cu116 torchaudio==0.13.1 --extra-index-url https://download.pytorch.org/whl/cu116 -U
!pip install -q xformers==0.0.16
!pip install -q triton==2.0.0
!git clone --depth=1 https://github.com/AUTOMATIC1111/stable-diffusion-webui.git /content/drive/MyDrive/sd-webui-files/stable-diffusion-webui
!wget -nc -P /content/drive/MyDrive/sd-webui-files/stable-diffusion-webui/models/Stable-diffusion https://huggingface.co/andite/anything-v4.0/resolve/main/anything-v4.5-pruned.safetensors
%cd /content/drive/MyDrive/sd-webui-files/stable-diffusion-webui/
!git reset --hard
!git pull
!sed -i -e 's/checkout {commithash}/checkout --force {commithash}/g' launch.py
!python launch.py --share --xformers --enable-insecure-extension-access --theme light
```

8. 点击运行阶段 → 变更运行阶段，选取使用GPU

![](../../../images/deploy-to-google-colab-3.webp)

9. 点击左上角运行保存格，允许访问云端硬盘。

![](../../../images/deploy-to-google-colab-4.webp)

10. 等待依赖装完，最后会产生Gradio网址，点进去

![](../../../images/deploy-to-google-colab-5.webp)

11. 接下来的用法就跟装在[自己电脑的SD WebUI](../features/)一样了，亦可以从网页界面安装[扩充功能](../extensions/)。

![](../../../images/deploy-to-google-colab-6.webp)

12. 使用后请点击运行阶段 → 中断并删除运行阶段。由于相关文件都是放在云端，关闭分页也不会删除，下次运行可以继续上一次进度。

13. 确认SD WebUI已经安装至云端后，将笔记本的保存格替换为以下代码。略过下载模型，直接启动SD WebUI。
```python
from google.colab import drive
drive.mount('/content/drive')

!pip install torch==1.13.1+cu116 torchvision==0.14.1+cu116 torchaudio==0.13.1 --extra-index-url https://download.pytorch.org/whl/cu116 -U
!pip install -q xformers==0.0.16
!pip install -q triton==2.0.0

%cd /content/drive/MyDrive/sd-webui-files/stable-diffusion-webui/
!python launch.py --share --xformers --enable-insecure-extension-access --theme light
```

`stable-diffusion-webui`会安装到Google云端硬盘的`sd-webui-files`文件夹下面。想添加模型或扩充功能，往Google云端文件夹的对应文件夹上传文件就可以了。

`stable-diffusion-webui`下面有几个重要的文件夹：

- extensions：放扩充功能的文件夹
- models/stable-duffusion：放存盘点模型
- models/Lora：放LoRA模型
- outputs：生图输出的文件夹
