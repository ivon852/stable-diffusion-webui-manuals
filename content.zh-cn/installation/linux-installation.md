---
title: "🖥️ 安装至GNU/Linux"
weight: 3
---

本文以Ubuntu 22.04 LTS为例子。

请使用一般用户，不可以用Root用户安装。


# 1 安装显卡驱动

## 1.1. Nvidia

1. 安装[专有Nvidia驱动](https://ivonblog.com/posts/ubuntu-install-nvidia-drivers/)，之后重开机。

2. 安装[CUDA](http://ivonblog.com/posts/ubuntu-install-nvidia-drivers/)

3. 确认驱动安装是否正确安装
```bash
nvidia-smi
nvcc --version
```

## 1.2. AMD

1. 安装AMD驱动程序，重开机。
```bash
sudo apt update && sudo apt upgrade -y
wget https://repo.radeon.com/amdgpu-install/22.40.3/ubuntu/focal/amdgpu-install_5.4.50403-1_all.deb
sudo apt-get install ./amdgpu-install_5.4.50403-1_all.deb
```

2. 安装AMD ROCm，中间需要重开机。
```bash
sudo apt install linux-headers-`uname -r` linux-modules-extra-`uname -r`
curl -fsSL https://repo.radeon.com/rocm/rocm.gpg.key | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/rocm-keyring.gpg
echo 'deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/rocm-keyring.gpg] https://repo.radeon.com/amdgpu/5.4.2/ubuntu jammy main' | sudo tee /etc/apt/sources.list.d/amdgpu.list
sudo apt-get update
sudo apt install amdgpu-dkms
sudo reboot
echo 'deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/rocm-keyring.gpg] https://repo.radeon.com/rocm/apt/5.4.2 jammy main' | sudo tee /etc/apt/sources.list.d/rocm.list
echo -e 'Package: *\nPin: release o=repo.radeon.com\nPin-Priority: 600' | sudo tee /etc/apt/preferences.d/rocm-pin-600
sudo apt-get update
sudo apt install rocm-hip-sdk rocm-opencl-sdk
echo "export LD_LIBRARY_PATH=/opt/rocm-5.4.2/lib:/opt/rocm-5.4.2/lib64" >> ~/.bashrc
source ~/.bashrc
```

3. 确认驱动是否有正确安装
```bash
# 应会看到driver=amdgpu
sudo lshw -c video
# 查看ROCm是否正确安装
sudo apt show rocm-libs
```


# 2. 安装Anaconda

1. 安装Python、wget、git。
```bash
sudo apt install python3 python3-pip python3-virtualenv wget git
```

2. 安装[Anaconda](https://ivonblog.com/posts/linux-anaconda/)。

3. 创建Python 3.10.6的虚拟环境
```bash
conda create --name sdwebui python=3.10.6
```


# 3. 拷贝Stable Diffusion WebUI保存库

1. 将Stable Diffusion WebUI拷贝至用户家目录
```bash
cd ~
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
```

2. (选择性) 将Anything v4.5模型下载至`stable-diffusion-webui/models/Stable-diffusion`目录。
```bash
wget -nc -P ~/stable-diffusion-webui/models/Stable-diffusion https://huggingface.co/andite/anything-v4.0/resolve/main/anything-v4.5-pruned.safetensors -O anything-v4.5-pruned.safetensors
```

3. 启动虚拟环境：
```bash
conda activate sdwebui
```

如果想要于bash script自动以conda启动虚拟环境，可以把这二行加入至`webui-user.sh`顶端：
```bash
eval "$(conda shell.bash hook)"
conda activate sdwebui
```

于conda环境下，最好使用conda指令来安装套件。不过Stable Diffusion WebUI仍偏好以pip创建虚拟环境。


# 4. 设置启动参数

用VIM编辑`webui-user.sh`。

显卡VRAM在8GB以上，将`# COMMANDLINE_ARGS=`替换成`COMMANDLINE_ARGS=--xformers --enable-insecure-extension-access`参数。

若显卡VRAM小于等于4GB，将`# COMMANDLINE_ARGS=`替换成`COMMANDLINE_ARGS=--medvram --opt-split-attention --xformers --enable-insecure-extension-access`参数。

额外加上`--listen`参数让其他电脑能以IP访问网页界面，`--share`则是产生一组Gradio网址。

加上`--xformers`可进一步减少VRAM占用，只支持Nvidia显卡。加入`--no-half-vae`减少使用VAE时算出黑图的几率。

加上`--enable-insecure-extension-access`让你在网页界面直接装扩充功能。加上`--nowebui`则不会启动网页界面，单纯接收WebUI API之用。

其余可用参数请见[命令行参数](../installation/command-line-arguments-and-settings/)


# 5. 启动Stable Diffusion WebUI

运行`webui.sh`，它会自动下载PyTorch并安装依赖套件。跑完它应该会显示一组网址，本机用浏览器打开`http://127.0.0.1:7860`进入网页图形界面。
```bash
cd ~/stable-diffusion-webui
./webui.sh
```
