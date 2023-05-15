---
title: "❓ 常見安裝問題"
weight: 21
---

本節列出一些安裝AUTOMATIC1111的Stable Diffusion WebUI常遇到的錯誤訊息的解決方式。

![](../../images/errors-1.png)


# 1. 如何回報錯誤

你可以到[我的Discussion](https://github.com/ivon852/netlify-ivon-blog-comments/discussions/437)或是[AUTOMATIC1111儲存庫的Issue](https://github.com/AUTOMATIC1111/stable-diffusion-webui/issues)查看別人遇過的錯誤訊息。

如果遇到了真正無法解決的錯誤，請註冊Github帳號，並到[AUTOMATIC1111儲存庫的Issue](https://github.com/AUTOMATIC1111/stable-diffusion-webui/issues)頁面，點選New Issue → Bug Report，用英文填寫遇到的狀況。


# 確保您的電腦符合Stable Diffusion的系統需求

參閱[Stable Diffusion系統需求](../installation/system-requirements)


# 可能是擴充功能導致的錯誤

有時除了Stable Diffusion WebUI本身問題外，也有可能是你安裝的擴充功能出錯導致程式無法啟動。

請嘗試刪除`stable-diffusion-webui/extensions`下的某個新安裝的擴充功能資料夾，或是將整個extensions資料夾先移動到其他位置，再嘗試啟動SD WebUI。

也可以嘗試將Stable Diffusion WebUI主程式[更新到最新版本](../installation/how-to-update)。


# RuntimeError: CUDA Out of memory

顯示卡的VRAM不足。Stable Diffusion WebUI的顯示卡VRAM最低要求為4GB，要無壓力的玩建議8GB以上。

開啟`webui-user.bat`，在`COMMANDLINE_ARGS`後面加入`--mdevram`或`--lowvram`引數，降低VRAM使用量。如果還是在生圖時出現此訊息，建議降低生圖的解析度，或是買張更好的顯示卡，或是改用[Google Colab](https://ivonblog.com/posts/google-colab-stable-diffusion-webui/)。


# No module named pip

於`stable-diffusion-webui`資料夾，右鍵＋SHIFT，開啟終端機，執行`python3 -m ensurepip`安裝pip

然後刪除`venv`資料夾，重新執行`webui-user.bat`


# 因為檔案包含病毒或潛在的垃圾軟體，所以作業未順利完成

如果你的Stable Diffusion WebUI是從Github下載，模型也是從HuggingFace或Civitai等安全網站下載，則可以斷定是誤判。

暫時[關閉Windows Defender](https://adersaytech.com/tutorial/kb-article/disable-windows-defender.html)之類的防毒軟體，再刪除`stable-diffusion-webui\venv`資料夾，重新執行`webui-user.bat`。


# RuntimeError: Couldn't install torch.

幾個可能：

1. 確認Python版本為3.10.6，不可從微軟商店安裝。並確認是否有安裝最新GPU驅動(Nvidia需要額外安裝CUDA)。

2. 防毒軟體擋住。

3. 非Nvidia GPU用戶也可能遇到此錯誤，於`webui-user.bat`的`COMMANDLINE_ARGS`加入`--skip-torch-cuda-test`引數跳過檢測。

4. 你沒有獨顯，所以它不給跑。沒有獨顯請考慮用[Google Colab](https://ivonblog.com/posts/google-colab-stable-diffusion-webui/)


# Torch is not able to use GPU

如果顯卡是Nvidia的話，請確認CUDA有正確安裝。

顯卡是AMD的話，編輯`webui-user.bat`，加入`COMMANDLINE_ARGS=--medvram --opt-split-attention --skip-torch-cuda-test`

修改完之後，刪除`venv`資料夾，重新啟動WebUI。


# fatal: unable to access Recv failure: Connection was reset

網路問題，好發於中國用戶，因為GFW對Github的連線干擾導致相關檔案下載失敗。

需要[換個代理](https://www.bilibili.com/read/cv21253533/)或[改DNS](https://zhuanlan.zhihu.com/p/571519560)才能正常連線。

但是有時只將部份網址換成「國內源」是不夠的，因為Stable Diffussion WebUI還會嘗試從HuggingFace等處下載模型。

為此全域掛著VPN，避免連線受到阻擾會是較好的作法。


# AssertionError: extension access disabled because of commandline flags

`webui-user.bat`(或`webui-user.sh`)的`COMMANDLINE_ARGS`有加入`--share`或`--listen`引數就會無法從網頁界面裝擴充功能，這是出於安全性考量。

你可以：

1. 將`--share`或`--listen`引數刪除。
2. 額外加上`--enable-insecure-extension-access`引數。
3. 改用Git clone的方式來安裝擴充功能：關閉SD WebUI。於`stable-diffusion-webui\extensions`資料夾開啟終端機，輸入`git clone <儲存庫網址>`下載擴充功能。


# modules.devices.NansException: A tensor with all NaNs was produced in Unet.

此錯誤可能會發生在含有VAE的模型算圖的時候，會導致算出來結果是黑圖。

開啟`webui-user.bat`，`COMMANDLINE_ARGS`後面額外加上`--no-half --no-haf-vae`引數。


# OSError: [Errno 28] No space left on device

硬碟或暫存資料夾沒空間了，[清出空間](https://helpcenter.trendmicro.com/zh-tw/article/tmka-08271/)後，刪除stable-diffusion-webui裡面的`venv`資料夾，再重新執行webui-user.bat重裝。


# 127.0.0.1:7860拒絕連線

變數太多，提供幾個可能解決方案：

1. 請確認開啟網址前終端機是否還開著，並有顯示`Running on Local URL : http://127.0.0.1:7860`的字樣
2. 網址改用`http://localhost:7860`連線
3. 用記事本開啟`C:\Windows\System32\drivers\etc\hosts`，確認裡面有無`127.0.0.1 localhost`這一行。
4. 請確認電腦沒有執行其他伺服器的程式(如Microsoft IIS)，導致佔用通訊埠。
5. 開啟終端機，執行`ipconfig /flushdns`指令刷新DNS紀錄
6. 暫時關閉防火牆


# DefaultCPUAllocator: not enough memory: you tried to allocate

電腦RAM不足。跑Stable Diffusion WebUI的RAM至少要8GB，低於此數值的話，Windows用戶請試著啟用[系統正在管理分頁檔大小](https://support.microsoft.com/zh-tw/windows/%E6%94%B9%E5%96%84-windows-%E9%9B%BB%E8%85%A6%E6%95%88%E8%83%BD%E7%9A%84%E6%8F%90%E7%A4%BA-b3b3ef5b-5953-fb6a-2528-4bbed82fba96)，Linux用戶則是增加SWAP的大小。


# RuntimeError: unexpected EOF, expected more bytes. The file might be corrupted.

可能是檔案毀損，刪除這些資料夾：`stable-diffusion-webui\models\GFPGAN`、`stable-diffusion-webui\models\Codeformer`、`stable-diffusion-webui\repositories\CodeForme`

然後重啟SD WebUI讓它重新下載臉部模型。


# Cloning Taming Transformers into repositories\taming-transformers...

這不是錯誤，單純是還在下載而已。

有時候Github下載會比較慢，要耐心等。如果下載失敗，刪除`venv`資料夾，並晚點重新執行`webui-user.bat`試試。


# can't open file '/stable-diffusion-webui/launch.py

如果執行`webui-user.sh`出現此錯誤，則編輯`webui-user.sh`，將`install_dir`後面改成`$(pwd)`。

如果是在Google Colab遇到此錯誤，代表程式沒裝成功，請看一下終端機輸出，檢查前面的指令是否有哪步執行出錯。


# Couldn't launch python, exit code 9009

Windows用戶請重裝Python 3.10.6，並確認有在安裝界面勾選`Add Python to PATH`


# libtcmalloc.so.4 python3: version `GLIBCXX_3.4.30' not found (required by /usr/lib/libtcmalloc.so.4)

可能是暫時性的bug。

啟動conda虛擬環境：`conda activate sdwebui`，然後安裝gcc：`conda install -c conda-forge gcc`，接著退出虛擬環境：`conda deactivate`，再嘗試啟動WebUI。


# PyTorch has CUDA Version=11.7 and torchvision has CUDA Version=11.8. Please reinstall the torchvision that matches your PyTorch install.

可能是暫時性的bug。

如果有使用Anaconda，啟動conda虛擬環境：`conda activate sdwebui && source venv/bin/activate`

安裝舊版本PyTorch：`pip uninstall torch && pip install xformers==0.0.16rc425 torch==1.13.1+cu117 torchvision==0.14.1+cu117 --extra-index-url https://download.pytorch.org/whl/cu117`

接著退出虛擬環境：`deactivate && conda deactivate`

再嘗試啟動WebUI。
