---
title: "3.1. 如何安裝擴充功能"
weight: 1
---


# 1. 用圖形界面安裝

最簡單的就是點選Extensions → Available的`Load from:`，就會列出可下載安裝的擴充功能。

![](../../images/FwlfcXi.webp)

有些比較新的擴充功能則是要你複製Github儲存庫網址，並點選`Install from URL`，它會自動完成Git clone的操作。

![](../../images/mrcehrU.webp)

在安裝擴充功能後，都要點選Installed → Apply and restart WebU重新載入網頁界面。有些則是得關掉終端機，整個重新啟動。

![](../../images/9QksXqM4.webp)

如果未來要更新擴充功能，點選Check for updates。


# 2. 用指令安裝

Stable Diffusion WebUI的擴充功能目錄一律放在`extensions`資料夾。

1. 用指令安裝擴充功能前先關閉主程式。

2. 接著在`stable-diffusion-webui/extensions`資料夾開啟終端機，執行`git clone`指令，安裝擴充功能。例如要安裝正體中文翻譯的話就是：
```bash
git clone https://github.com/benlisquare/stable-diffusion-webui-localization-zh_TW.git
```

3. 重新啟動SD WebUI，即會看到新安裝的擴充功能。

未來要一次更新全部擴充功能的話，在`stable-diffusion-webui/extensions`資料夾開啟終端機，執行以下指令：
```bash
# Windows
Get-ChildItem | ForEach-Object { git -C $_.FullName pull }

# Linux
ls | xargs -I{} git -C {} pull
```
