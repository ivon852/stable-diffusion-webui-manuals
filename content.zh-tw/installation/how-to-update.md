---
title: "❓ 如何更新程式"
weight: 20
---

AUTOMATIC1111的Stable Diffusion WebUI專案原始碼託管在Github，目前「更新」是以`git pull`指令來操作。

版本號碼和更新日誌可以到[Github Releases](https://github.com/AUTOMATIC1111/stable-diffusion-webui/releases)查看。

1. 進入`stable-diffusion-webui`資料夾，在裡面開啟終端機

Windows請於空白處按右鍵＋SHIFT → 開啟終端機

Linux和macOS請用cd指令，切換到`stable-diffusion-webui`資料夾：
```bash
cd ~/stable-diffusion-webui
```

2. 如果您已經很久沒更新，或是AUTOMATIC1111發布了大版本更新，則建議您刪除`venv`資料夾，讓它啟動後重裝依賴套件。

3. 拉取最新分支，更新到最新版檔案。
```bash
git reset --hard main
git pull
```

4. 檢查啟動指令稿(用文字編輯器開啟`webui-user.bat`或`webui-user.sh`)，查看[命令列引數](https://ivonblog.com/posts/stable-diffusion-webui-manuals/installation/command-line-arguments-and-settings/)有無變更。

5. 啟動WebUI
