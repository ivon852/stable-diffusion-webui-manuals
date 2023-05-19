---
title: "❓ 如何更新程式"
weight: 20
---

AUTOMATIC1111的Stable Diffusion WebUI專案原始碼託管在Github，目前「更新」是以`git pull`指令來操作。

最新版本號碼和更新日誌可以到[Github Releases](https://github.com/AUTOMATIC1111/stable-diffusion-webui/releases)查看。

## 1. 檢查本機程式版本

這節步驟是用於檢查本機程式的版本，非必要。如果未來要降版才執行這些步驟。

1. 進入`stable-diffusion-webui`資料夾，在裡面開啟終端機

Windows請於空白處按右鍵＋SHIFT → 開啟終端機

Linux和macOS請用cd指令，切換到`stable-diffusion-webui`資料夾：
```bash
cd ~/stable-diffusion-webui
```

2. 輸入以下指令，會印出一組長長的英數代碼，
```bash
git rev-parse HEAD
# 範例輸出：89f9faa63388756314e8a1d96cf86bf5e0663045
```

3. 這串英數就是本機程式的版本(分支代碼)。更新後要降版的話，務必記下此代碼。


## 2. 更新程式到最新版本

1. 進入`stable-diffusion-webui`資料夾，在裡面開啟終端機

Windows請於空白處按右鍵＋SHIFT → 開啟終端機

Linux和macOS請用cd指令，切換到`stable-diffusion-webui`資料夾：
```bash
cd ~/stable-diffusion-webui
```

2. 如果您已經很久沒更新，或是AUTOMATIC1111發布了大版本更新，則建議您刪除`venv`資料夾，讓它啟動後重裝依賴套件。

3. 如果您想要在更新後降版，請先執行上面提及的`git rev-parse HEAD`指令取得本機的分支代碼。

4. 拉取最新分支，更新到最新版檔案。
```bash
git reset --hard main
git pull
```

5. 檢查啟動指令稿(用文字編輯器開啟`webui-user.bat`或`webui-user.sh`)，查看[命令列引數](https://ivonblog.com/posts/stable-diffusion-webui-manuals/installation/command-line-arguments-and-settings/)有無變更。

6. 啟動WebUI，看能否正常啟動，以及查看有哪些新變化。

7. 如果您發現某個功能壞掉，想要降版回之前的版本，則在終端機按CTRL+C終止程式，然後輸入`git checkout`指令，退回之前的版本：
```bash
git checkout "分支代碼"
```
