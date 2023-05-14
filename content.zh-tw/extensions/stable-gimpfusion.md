---
title: "修圖軟體GIMP整合 Stable-Gimpfusion"
weight: 9
---

- 擴充功能來源：[ArtBIT/stable-gimpfusion](https://github.com/ArtBIT/stable-gimpfusion)

ArtBIT開發的Stable-Gimpfusion能讓你在GIMP修圖時的圖層調用Stable Diffusion填充內容，支援文生圖、圖生圖、ControlNet。

類似的擴充功能有[blueturtleai/gimp-stable-diffusion](https://github.com/blueturtleai/gimp-stable-diffusion)，支援不規則選取區，還可以調用志願者經營的stable-horde伺服器來繪圖。但是它不支援SD WebUI。

1. 編輯SD WebUI的啟動引數，加入`--api`引數，再啟動SD WebUI。網頁界面可以不用開啟。

2. 安裝自由軟體[GIMP](https://www.gimp.org/)

3. 下載[stable_gimpfusion.py](https://raw.githubusercontent.com/ArtBIT/stable-gimpfusion/main/stable_gimpfusion.py)，放到GIMP的擴充功能資料夾 (Linux為`$HOME/.gimp-2.10/plug-ins/`並賦予執行權限，Windows為`C:\Users\{your_id}\AppData\Roaming\GIMP\2.10\plug-ins\`)

4. 開啟GIMP，開啟圖片。

5. 點選右上角的Gimpfusion，點選要使用文生圖(text to image)還是圖生圖(image to image)

![](../../images/stable-gimpfusion-1.webp)

6. 輸入提示詞，Stable Diffusion就會開始生圖

![](../../images/stable-gimpfusion-2.webp)

7. 進度條可從終端機查看，之後結果會新增至GIMP的圖層。目前此擴充功能只支援填充整個圖層。

![](../../images/stable-gimpfusion-3.webp)
