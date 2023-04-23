---
title: "安裝至macOS"
weight: 5
---

以macOS Ventura作示範。


# 1. 安裝套件管理員Homebrew

Brew是安裝下面的東西所需要的必備工具，需要用到終端機指令。

1. 在應用程式列表開啟終端機

![](../../images/MKYNa6u.avif)

2. 貼上以下指令安裝Homebrew (此指令來自[Homebrew官網](https://brew.sh/index_zh-tw))
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

3. 輸入密碼，全部Enter，等待安裝完成。下面Homebrew在安裝軟體的時候都需要輸入密碼。

![](../../images/BvkF63l.avif)


# 2. 安裝Git和Anaconda

1. 繼續開著終端機。輸入以下指令安裝Git版本管理工具。
```bash
brew install git
```


2. 接著是Pyhton。Pyhton用Anaconda來建立虛擬環境比較方便，輸入以下指令安裝：
```bash
brew install --cask anaconda
echo 'export PATH="/usr/local/anaconda3/bin:$PATH" ' >> ~/.zshrc
source  ~/.zshrc
conda init zsh
```

3.  建立Python 3.10.6的虛擬環境，輸入y同意，它會自動下載必要的套件

```bash
conda create --name sdwebui python=3.10.6
```


# 3. 複製Stable Diffusion WebUI儲存庫

1. 將Stable Diffusion WebUI複製至家目錄
```bash
cd ~
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
```

2. 開啟Finder，點選前往 → 個人專屬，會看到多了一個`stable-diffusion-webui`資料夾，這個就是程式本體了。

![](../../images/xPSMOZa.avif)

3. 將下載的模型檔移動至`stable-diffusion-webui`下的`models/Stable-diffusion`資料夾。

![](../../images/XZvCmqn.avif)

4, 接著回到終端機，啟動Python虛擬環境，終端機提示符前面會變成`(sdwebui)`
```bash
conda activate sdwebui
```


# 4. 設定啟動引數

找到`stable-diffusion-webui`資料夾下的`webui-user.sh`，右鍵用文字編輯器開啟。

![](../../images/0nkVg73.avif)

參考上圖框起來的地方，填入`export COMMANDLINE_ARGS=--medvram --opt-split-attention`引數，降低VRAM使用量。

額外加上`--listen`參數讓其他電腦能以IP存取網頁界面，`--share`則是產生一組Gradio網址。

其餘引數請參閱[命令列引數](../installation/command-line-arguments-and-settings/)頁面。


# 5. 啟動Stable Diffusion WebUI

1. 執行`webui.sh`，它會自動下載PyTorch並安裝依賴套件。
```bash
cd ~/stable-diffusion-webui
./webui.sh
```

2. 跑完它應該會顯示一組網址

![](../../images/vT6gVFu.avif)


3. 用瀏覽器開啟`http://127.0.0.1:7860`進入網頁圖形界面。執行程式時請保持終端機開著。

![](../../images/ZK9gSnP.avif)

欲中止SD WebUI執行，直接將對終端機圖示按右鍵終止即可。

日後要啟動SD WebUI，就是開啟終端機，執行以下指令就會開啟網頁界面。
```bash
conda activate sdwebui
cd ~/stable-diffusion-webui
./webui.sh
```
