---
title: "☁️ 部署至Google Colab"
weight: 11
---

Google Colab是Google Research推出的免費線上服務，可用伺服器等級的高級顯示卡跑Python程式。有需要的話還可以付費買Pro版，使用更高級的GPU。

{{< hint danger >}}
2023年4月21日，Google Colab員工在[Twitter](https://twitter.com/thechrisperry/status/1649189902079381505)宣佈，需要付費購買Pro版才可以跑stable-diffusion-webui。免費版用戶一偵測到stable-diffusion-webui字串就會被封鎖，出現"You may be executing code that is disallowed, and this may restrict your ability to use Colab in the future."的警告訊息。
{{< /hint >}}

Google Colabu已有很多現成的Stable Diffusion WebUI筆記本可以直接用，不用自己寫程式，例如這個[camenduru的筆記本](https://ivonblog.com/posts/google-colab-stable-diffusion-webui/)。

如果你想自己寫Stable Diffusion筆記本，這邊提供我的範本程式，採最小安裝，只安裝必要的東西。

我的想法是將SD WebUI的程式和模型檔案放到安裝至雲端。優點是裝好後，日後要用就能二分鐘內啟動，而不用等下載模型。

缺點就是很佔雲端空間，大概需要10GB左右容量。15GB免費容量只夠裝一個存檔點模型和少許LoRA，再勉強塞個ControlNet的擴充功能。因此我的程式碼只下載必要的檔案，擴充功能需要再另外裝。

![](../../images/deploy-to-google-colab-1.webp)

1. 至[Google Colab](https://colab.research.google.com/)，點選新增筆記本。

![](../../images/deploy-to-google-colab-2.webp)

2. 點選新增儲存格，填入以下內容。先別點選執行，這邊我是分步講解，後面再將這些程式碼合起來。
```python
# 掛載雲端硬碟
from google.colab import drive
drive.mount('/content/drive')

# 建立存放程式檔案的資料夾
!mkdir /content/drive/MyDrive/sd-webui-files
```

3. 於同一個儲存格，再往下新增程式碼，安裝CUDA
```python
# 安裝CUDA、xformers、Triton依賴
!pip install torch==1.13.1+cu116 torchvision==0.14.1+cu116 torchaudio==0.13.1 --extra-index-url https://download.pytorch.org/whl/cu116 -U
!pip install -q xformers==0.0.16
!pip install -q triton==2.0.0
```

4. 複製SD WebUI的儲存庫到Google雲端的`sd-webui-files`資料夾
```python
# 複製SD WebUI上游的儲存庫
!git clone --depth=1 https://github.com/AUTOMATIC1111/stable-diffusion-webui.git /content/drive/MyDrive/sd-webui-files/stable-diffusion-webui
```

5. 下載Anything V4.5存檔點模型至`sd-webui-files/stable-diffusion-webui/models`資料夾，網址為在模型網站按右鍵取得
```python
!wget -nc -P "/content/drive/MyDrive/sd-webui-files/stable-diffusion-webui/models/Stable-diffusion" "https://huggingface.co/andite/anything-v4.0/resolve/main/anything-v4.5-pruned.safetensors"
```

6. 接著修正儲存庫版本錯誤
```bash
# 防止其他儲存庫造成錯誤
%cd /content/drive/MyDrive/sd-webui-files/stable-diffusion-webui/
!git reset --hard
!git pull
!sed -i -e 's/checkout {commithash}/checkout --force {commithash}/g' launch.py
```

7. 最後，啟動WebUI
```python
# 啟動WebUI。直接從launch.py傳遞引數
!python launch.py --share --xformers --enable-insecure-extension-access --theme light
```

以上的程式碼合併起來就是如下樣子：
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

8. 點選執行階段 → 變更執行階段，選取使用GPU

![](../../images/deploy-to-google-colab-3.webp)

9. 點選左上角執行儲存格，允許存取雲端硬碟。

![](../../images/deploy-to-google-colab-4.webp)

10. 等待依賴裝完，最後會產生Gradio網址，點進去

![](../../images/deploy-to-google-colab-5.webp)

11. 接下來的用法就跟裝在[自己電腦的SD WebUI](../features/)一樣了，亦可以從網頁界面安裝[擴充功能](../extensions/)。

![](../../images/deploy-to-google-colab-6.webp)

12. 使用後請點選執行階段 → 中斷並刪除執行階段。由於相關檔案都是放在雲端，關閉分頁也不會刪除，下次執行可以繼續上一次進度。

13. 確認SD WebUI已經安裝至雲端後，將筆記本的儲存格替換為以下程式碼。略過下載模型，直接啟動SD WebUI。
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
- outputs：生圖輸出的資料夾
