---
title: "❓ 如何安裝擴充功能"
weight: 1
---


# 1. 用圖形界面安裝

注意：您必須在[命令列引數](../installation/command-line-arguments-and-settings/)加入`--enable-insecure-extension-access`才能從圖形界面裝擴充功能。

最簡單的就是點選Extensions → Available的`Load from:`，就會列出可下載安裝的擴充功能，點選安裝。

![](../../images/how-to-install-extensions-1.webp)

有些比較新的擴充功能則是要你複製Github儲存庫網址，並點選選Extensions → `Install from URL`，貼上網址再按Install，它會自動完成git clone的操作。

![](../../images/how-to-install-extensions-2.webp)

在安裝擴充功能後，都要點選Installed → Apply and restart WebU重新載入網頁界面。有些則是得關掉終端機，整個重新啟動。

![](../../images/how-to-install-extensions-3.webp)

如果未來要更新擴充功能，點選Check for updates。


# 2. 用指令安裝

Stable Diffusion WebUI的擴充功能目錄一律放在`extensions`資料夾。

1. 用指令安裝擴充功能前先關閉主程式。

2. 接著在`stable-diffusion-webui/extensions`資料夾開啟終端機，執行`git clone`指令，安裝擴充功能。例如要安裝正體中文翻譯的話就是把該儲存庫複製下來：
```bash
git clone https://github.com/benlisquare/stable-diffusion-webui-localization-zh_TW.git
```

3. 重新啟動SD WebUI，即會看到新安裝的擴充功能。

未來要一次更新全部擴充功能的話，在`stable-diffusion-webui/extensions`資料夾開啟終端機，執行以下指令：
```bash
# Linux
ls | xargs -I{} git -C {} pull

# Windows
Get-ChildItem | ForEach-Object { git -C $_.FullName pull }
```
