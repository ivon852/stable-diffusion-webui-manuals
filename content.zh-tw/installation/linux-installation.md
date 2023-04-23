---
title: "安裝至Linux"
weight: 3
---

以Ubuntu 22.04為例子。

# 1 安裝顯示卡驅動

## 1.1. Nvidia

1. 安裝[專有Nvidia驅動](https://ivonblog.com/posts/ubuntu-install-nvidia-drivers/)，之後重開機。

2. 安裝[CUDA](http://ivonblog.com/posts/ubuntu-install-nvidia-drivers/)

3. 確認驅動安裝是否正確安裝
```bash
nvidia-smi
nvcc --version
```

## 1.2. AMD

1. 安裝AMD驅動程式，重開機。
```bash
sudo apt update && sudo apt upgrade -y
wget https://repo.radeon.com/amdgpu-install/22.40.3/ubuntu/focal/amdgpu-install_5.4.50403-1_all.deb
sudo apt-get install ./amdgpu-install_5.4.50403-1_all.deb
```

2. 安裝AMD ROCm，中間需要重開機。
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

3. 確認驅動是否有正確安裝
```bash
# 應會看到driver=amdgpu
sudo lshw -c video
# 查看ROCm是否正確安裝
sudo apt show rocm-libs
```


# 2. 安裝Anaconda

1. 安裝Python、wget、git。
```bash
sudo apt install python3 python3-pip python3-virtualenv wget git
```

2. Stable Diffusion WebUI的Wiki寫明Python版本建議為3.10.6，為此請先安裝[Anaconda](https://ivonblog.com/posts/linux-anaconda/)。

3. 建立Python 3.10.6的虛擬環境
```bash
conda create --name sdwebui python=3.10.6
```


# 3. 複製Stable Diffusion WebUI儲存庫

1. 將Stable Diffusion WebUI複製至使用者家目錄
```bash
cd ~
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
```

2. (選擇性) 將Anything v4.5模型下載至`stable-diffusion-webui/models/Stable-diffusion`目錄。
```bash
wget -nc -P ~/stable-diffusion-webui/models/Stable-diffusion https://huggingface.co/andite/anything-v4.0/resolve/main/anything-v4.5-pruned.safetensors -O anything-v4.5-pruned.safetensors
```

3. 啟動虛擬環境：
```bash
conda activate sdwebui
```

如果想要於bash script自動以conda啟動虛擬環境，可以把這二行加入至`webui-user.sh`頂端：
```bash
eval "$(conda shell.bash hook)"
conda activate sdwebui
```

於conda環境下，最好使用conda指令來安裝套件。不過Stable Diffusion WebUI仍偏好以pip建立虛擬環境。


# 4. 設定啟動引數

用VIM編輯`webui-user.sh`。

若GPU VRAM小於等於4GB的話加入`COMMANDLINE_ARGS=--medvram --opt-split-attention`引數，防止`RuntimeError: CUDA Out of memory`錯誤。

AMD顯示卡需要另外加上` --precision full --no-half`引數，否則生成的圖可能會一片漆黑。

額外加上`--listen`參數讓其他電腦能以IP存取網頁界面，`--share`則是產生一組Gradio網址。

加上`--enable-insecure-extension-access`讓你在網頁界面直接裝擴充功能。加上`--nowebui`則不會啟動網頁界面，單純接收WebUI API之用。

其餘可用引數請見[命令列引數](../installation/command-line-arguments-and-settings/)


# 5. 啟動Stable Diffusion WebUI

1. 執行`webui.sh`，它會自動下載PyTorch並安裝依賴套件。跑完它應該會顯示一組網址，本機用瀏覽器開啟`http://127.0.0.1:7860`進入網頁圖形界面。
```bash
cd ~/stable-diffusion-webui
./webui.sh
```

2. 若要從其他電腦存取，則是輸入`http://本機IP:7860`連線。記得開放防火牆：
```bash
sudo ufw allow 7860/tcp
sudo ufw reload
```
