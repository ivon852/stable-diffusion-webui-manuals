---
title: "如何更新程式"
weight: 7
---

SD WebUI專案原始碼是託管在Github，開發迭代速度很快，建議每週適時更新程式。

但更新頻繁也代表功能容易損壞，因此安全的更新方式如下：

1. 在`stable-diffusion-webui`這個資料夾裡面按右鍵＋SHIFT開啟終端機，取得目前分支，會印出一組五位數代碼
```bash
git rev-parse --short HEAD
```

2. 接著拉取最新分支，更新到最新版檔案。
```bash
git pull
```

3. 如果更新後出現`Merge branch 'master' of`的訊息，請按`Esc`鍵，輸入`:q!`退出即可。

4. 更新後如果有功能壞掉就退回之前的分支版本。
```bash
git checkout "分支代碼"
```
