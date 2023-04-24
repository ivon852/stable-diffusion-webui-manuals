---
title: "如何更新程式"
weight: 20
---

Stable Diffusion WebUI的專案原始碼託管在Github，目前「更新」是以`git pull`指令來操作。

1. 在`stable-diffusion-webui`這個資料夾裡面開啟終端機

Windows請按右鍵＋SHIFT → 開啟終端機

Linux/MacOS請用cd指令，切換到`stable-diffusion-webui`目錄：
```bash
cd ~/stable-diffusion-webui
```

2. 保險起見，先用`git rev-parse`指令取得目前分支，會印出一組五位數分支代碼
```bash
git rev-parse --short HEAD
```

3. 接著拉取最新分支，更新到最新版檔案。
```bash
git pull
```

4. 如果檔案無法拉取，請使用`git reset`：
```bash
git reset --hard main
git pull
```

5. 如果出現`Merge branch 'master' of`的訊息，請按`Esc`鍵，輸入`:q!`退出即可。


前面用到的`git rev-parse`這個指令，是用來切出分支，降級用的指令。

若是在更新程式後有功能壞掉，那就用`git checkout`降回之前的版本。
```bash
git checkout "分支代碼"
```
