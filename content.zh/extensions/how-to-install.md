---
title: "3.1. 如何安裝擴充功能"
weight: 1
---

最簡單的就是點選Extensions → Available的`Load from:`，就會列出可下載安裝的擴充功能。

<img src=/posts/stable-diffusion-webui-manuals/images/FwlfcXi.webp alt=""  width=500 loading="lazy">

有些比較新的擴充功能則是要你複製Github儲存庫網址，並點選`Install from URL`，它會自動完成Git clone的操作。

<img src=/posts/stable-diffusion-webui-manuals/images/mrcehrU.webp alt=""  width=500 loading="lazy">

在安裝擴充功能後，都要點選Installed → Apply and restart WebU重新載入網頁界面。有些則是得關掉終端機，整個重新啟動。

<img src=/posts/stable-diffusion-webui-manuals/images/9QksXqM4.webp alt=""  width=500 loading="lazy">


如果未來要一次更新全部的擴充功能：於`stable-diffusion-webui\extensions`資料夾開啟終端機，執行以下指令：
```bash
# Windows
Get-ChildItem | ForEach-Object { git -C $_.FullName pull }

# Linux
ls | xargs -I{} git -C {} pull
```
