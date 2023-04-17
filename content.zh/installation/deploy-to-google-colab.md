---
title: "1.6. 部署至Google Colab"
weight: 5
---


如果你想自己寫Stable Diffusion筆記本，這邊提供我的範本程式。

我的想法是將SD WebUI的程式和模型檔案放到安裝至雲端。優點是裝好後，日後要用就能二分鐘內啟動，而不用等下載模型。

缺點就是很佔雲端空間，大概需要10GB左右容量。15GB免費容量只夠裝一個存檔點模型和少許LoRA，再勉強塞個ControlNet的擴充功能。因此我的程式碼只下載必要的檔案，擴充功能需要再另外裝。
<img src=/posts/stable-diffusion-webui-manuals/images/Screenshot_20230403_132547.webp alt=""  width=500 loading="lazy">

1. 至[Google Colab](https://colab.research.google.com/)，點選新增筆記本。
<img src=/posts/stable-diffusion-webui-manuals/images/Screenshot_20230403_113248.webp alt=""  width=500 loading="lazy">

2. 於儲存格填入以下內容。Google Colab的Python不需要指定版本也能跑SD WebUI。另外在啟動時加上`--enable-insecure-extension-access`引數，就可以在網頁界面`Install from URL`直接安裝擴充功能，無需用git指令。
```python
# 掛載雲端硬碟
from google.colab import drive
drive.mount('/content/drive')

!mkdir /content/drive/MyDrive/sd-webui-files

# 安裝CUDA、xformers、Triton依賴
!pip install torch==1.13.1+cu116 torchvision==0.14.1+cu116 torchaudio==0.13.1 --extra-index-url https://download.pytorch.org/whl/cu116 -U
!pip install -q xformers==0.0.16
!pip install -q triton==2.0.0

# 複製SD WebUI上游的儲存庫
!git clone --depth=1 https://github.com/AUTOMATIC1111/stable-diffusion-webui.git /content/drive/MyDrive/sd-webui-files/stable-diffusion-webui

# 下載存檔點模型至models資料夾，網址為在模型網站按右鍵取得
!wget -nc -P /content/drive/MyDrive/sd-webui-files/stable-diffusion-webui/models/Stable-diffusion https://huggingface.co/andite/anything-v4.0/resolve/main/anything-v4.5-pruned.safetensors

# 下載LoRA模型
!wget -nc -P /content/drive/MyDrive/sd-webui-files/stable-diffusion-webui/models/Lora https://civitai.com/api/download/models/13739 -O Korean_Doll_Likenesss.safetensors

# 以git clone安裝擴充功能：中文化
!git clone --depth=1 https://github.com/benlisquare/stable-diffusion-webui-localization-zh_TW.git /content/drive/MyDrive/sd-webui-files/stable-diffusion-webui/extensions/stable-diffusion-webui-localization-zh_TW

# 以git clone安裝擴充功能：ControlNet，以及Scribbles模型
!git clone --depth=1 https://github.com/Mikubill/sd-webui-controlnet.git /content/drive/MyDrive/sd-webui-files/stable-diffusion-webui/extensions/sd-webui-controlnet
!wget -nc -P /content/drive/MyDrive/sd-webui-files/stable-diffusion-webui/extensions/sd-webui-controlnet/models https://huggingface.co/lllyasviel/ControlNet/resolve/main/models/control_sd15_scribble.pth

# 防止其他儲存庫造成錯誤
%cd /content/drive/MyDrive/sd-webui-files/stable-diffusion-webui/
!git reset --hard
!git pull
!sed -i -e 's/checkout {commithash}/checkout --force {commithash}/g' launch.py

# 啟動WebUI。直接從launch.py傳遞引數
!python launch.py --share --xformers --enable-insecure-extension-access --theme light
```

3. 點選執行階段 → 變更執行階段，選取使用GPU
<img src=/posts/stable-diffusion-webui-manuals/images/Screenshot_20230403_114247.webp alt=""  width=500 loading="lazy">

4. 點選左上角執行儲存格，允許存取雲端硬碟。
<img src=/posts/stable-diffusion-webui-manuals/images/Screenshot_20230403_114310.webp alt=""  width=500 loading="lazy">

5. 等待依賴裝完，最後會產生Gradio網址，點進去
<img src=/posts/stable-diffusion-webui-manuals/images/Screenshot_20230403_132014.webp alt=""  width=500 loading="lazy">

6. 接下來的用法就跟裝在[自己電腦的SD WebUI](https://ivonblog.com/posts/stable-diffusion-webui-manuals/features/)一樣了，亦可以從網頁界面安裝[擴充功能](https://ivonblog.com/posts/stable-diffusion-webui-manuals/extensions/)。
<img src=/posts/stable-diffusion-webui-manuals/images/Screenshot_20230403_132314.webp alt=""  width=500 loading="lazy">

6. 使用後請點選執行階段 → 中斷並刪除執行階段。由於相關檔案都是放在雲端，關閉分頁也不會刪除，下次執行可以繼續上一次進度。

7. 確認SD WebUI已經安裝至雲端後，將筆記本的儲存格替換為以下程式碼。略過下載模型，直接啟動SD WebUI。
```python
from google.colab import drive
drive.mount('/content/drive')

!pip install torch==1.13.1+cu116 torchvision==0.14.1+cu116 torchaudio==0.13.1 --extra-index-url https://download.pytorch.org/whl/cu116 -U
!pip install -q xformers==0.0.16
!pip install -q triton==2.0.0

%cd /content/drive/MyDrive/sd-webui-files/stable-diffusion-webui/
!python launch.py --share --xformers --enable-insecure-extension-access --theme light
```

`stable-diffusion-webui`會安裝到Google雲端硬碟的`sd-webui-files`資料夾下面。想新增模型或擴充功能，往Google雲端資料夾的對應資料夾上傳檔案就可以了。

`stable-diffusion-webui`下面有幾個重要的資料夾：

- extensions：放擴充功能的資料夾
- models/stable-duffusion：放存檔點模型
- models/Lora：放LoRA模型
- outputs：算圖輸出的資料夾
