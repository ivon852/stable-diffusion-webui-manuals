---
title: "🖥️ 安裝至Windows"
weight: 4
---

Stable Diffusion WebUI支援Windows 10和Windows 11。

本文以Windows 11 22H2為例子。


# 1. 安裝顯示卡驅動程式

請確認電腦已經安裝最新版的顯示卡驅動程式。

Nvidia顯示卡建議用[Geforce Experience](https://www.nvidia.com/zh-tw/geforce/geforce-experience/)安裝最新驅動，會順便安裝CUDA。或者你想[手動下載CUDA](https://developer.nvidia.com/cuda-downloads)也行。

AMD顯示卡請用[驅動程式自動偵測工具](https://www.amd.com/zh-hant/support/kb/faq/gpu-131)安裝顯示卡驅動。

Intel Arc顯示卡請安裝[WHQL](https://www.intel.com.tw/content/www/tw/zh/download/726609/intel-arc-iris-xe-graphics-whql-windows.html)驅動。


# 2. 安裝Git和Python

1. 下載Git版本管理工具。至[Git for Windows](https://gitforwindows.org/)下載安裝檔，一直下一步即可。

![](../../images/windows-installation-1.webp)

2. 接著安裝Python。SD WebUI建議Python版本為`3.10.6`。請至[Python官網](https://www.python.org/downloads/release/python-3106/)下載`Python 3.10.6`的64位元安裝檔。

![](../../images/windows-installation-2.webp)

3. 安裝前務必勾選`Add Python 3.10 to PATH`，將Python加到環境變數。再按`Install Now`。

![](../../images/windows-installation-3.webp)

<details>

<summary>(進階) 如果你熟悉Python開發的話，改用Anaconda設定Python虛擬環境會更好。點選展開</summary>

Anaconda是針對資料科學打造的Python發行版，能管理一部電腦上的多重Python版本。如果之前已經裝過舊版Python，不需要解除安裝。

如果選擇以Anaconda來安裝Stable Diffusion WebUI的依賴套件，那麼日後就不能用Windows終端機執行`webui-user.bat`，而得使用Anaconda Prompt，除非你將conda加入環境變數。

1. 安裝[Anaconda](https://www.anaconda.com/products/distribution)或[Miniconda](https://docs.conda.io/en/latest/miniconda.html#windows-installers)

2. 搜尋應用程式列表，開啟Anaconda Prompt

3. 切換至Stable Diffusion WebUI所在資料夾 (需先執行下一節的git clone指令)
```powershell
cd C:\user\user\Desktop\stable-diffusion-webui
```

4. 建立Pyhton 3.10.6的虛擬環境
```bash
conda create --name sdwebui python=3.10.6
```

5. 啟動虛擬環境，然後再看下下節設定並啟動`webui-user.bat`，安裝Python依賴套件。
```bash
conda activate sdwebui
```

</details>


# 3. 複製Stable Diffusion WebUI儲存庫

1. 開啟檔案總管，在桌面資料夾裡面按右鍵＋Shift，點選`在這裡開啟Powershell`或`終端機視窗`。如果你C槽空間不足的話，也可以切換到其他硬碟資料夾再開啟終端機。

![](../../images/windows-installation-4.webp)

2. 輸入以下指令，檢查目前Python版本，輸出應為3.10.6
```bash
python --version
```

3. Nvidia顯示卡用戶輸入以下指令，確認CUDA是否有正確安裝，輸出應含有`nvcc: NVIDIA (R) Cuda compiler driver`
```bash
nvcc --version
```

4. Nvidia顯卡用戶輸入以下指令，複製Stable Diffusion WebUI的儲存庫。複製完成後保持終端機開著。
```bash
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
```

＊ AMD顯卡用戶請用這個DirectML的分支：
```bash
git clone https://github.com/lshqqytiger/stable-diffusion-webui-directml.git
```

＊ Intel Arc顯卡用戶請用這個DirectML的分支：
```bash
git clone https://github.com/Aloereed/stable-diffusion-webui-arc-directml.git
```

5. 複製完成儲存庫後，桌面會多出資料夾`stable-diffusion-webui`。如果你有下載模型，將剛剛下載的存檔點模型放到`models\Stable-diffusion`資料夾。這個資料夾可放入多個存檔點模型檔。

![](../../images/windows-installation-5.webp)


# 4. 設定啟動引數

如下圖所示，對`stable-diffusion-webui`資料夾裡面的`webui-user.bat`按右鍵，以記事本開啟 (看不到.bat請點選檔案總管檢視 → 顯示/隱藏 → 顯示副檔名)

![](../../images/windows-installation-6.webp)

接著您要編輯`set COMMANDLINE_ARGS=`這一行啟動引數。

若顯示卡VRAM小於等於4GB的話，將`set COMMANDLINE_ARGS=`替換成`set COMMANDLINE_ARGS=--medvram --opt-split-attention`引數。

電腦RAM（不是VRAM）小於等於8GB的話改替換為`set COMMANDLINE_ARGS=--lowvram --opt-split-attention`引數。注意使用`--lowvram`引數會讓高階顯示卡算圖變很慢。

(下面的不加也可以)

在最後面加上`--xformers`引數可進一步減少VRAM使用量。`--no-half-vae`降低用VAE時算出黑圖的機率。

加上`--enable-insecure-extension-access`讓你在網頁界面直接裝擴充功能。

加上`--listen`引數再開放防火牆7860通訊埠，即可用區域網路其他電腦的瀏覽器存取WebUI。

加上`--share`引數則會產生一組Gradio網址，讓你可以從外部網路或手機使用WebUI。網址72小時後過期。

其餘可用引數請見[命令列引數](../installation/command-line-arguments-and-settings/)


# 5. 啟動Stable Diffusion WebUI

初次啟動會下載好幾GB的資料，請保持網路順暢，不要開VPN。如果您所在的地方有網路審查干擾Github連線，請想辦法找代理繞過。

1. 回到終端機，輸入以下指令啟動SD WebUI：
```bash
cd stable-diffusion-webui
./webui-user.bat
```

2. 初次啟動會下載依賴套件，大概要等個30分鐘安裝。如果在此步驟遇到錯誤，請先看[常見問題](../installation/errors/)。

![](../../images/windows-installation-7.webp)

3. 啟動完成後會顯示一組網址。執行程式時請勿關閉終端機。

![](../../images/windows-installation-8.webp)

4. 用瀏覽器開啟：`http://127.0.0.1:7860`就可進入圖形界面了。執行程式時請勿關閉終端機，執行時若出錯終端機也會輸出訊息。

![](../../images/windows-installation-9.webp)

5. 要關閉SD WebUI，在終端機按Ctrl+C終止，再關閉視窗。

日後要啟動SD WebUI，只要對資料夾裡面的`webui-user.bat`按二下即可 (不需要用系統管理員執行)。
