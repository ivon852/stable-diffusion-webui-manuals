# Ivon的Stable Diffusion WebUI使用手冊

Ivon's Stable Diffusion WebUI User Manuals

[線上閱讀](https://ivonblog.com/posts/stable-diffusion-webui-manuals/)


## 1. 動機

自2022年12月以來，敝人在部落格撰寫一系列有關Stable Diffusion的教學文章，內容涵蓋各大系統的安裝過程，AI生圖的操作說明，擴充功能介紹，模型訓練過程。有感於閱讀不便，易使人產生散亂之感，故做成類似手冊的樣式，方便閱讀。


## 2. 目錄架構

每個章節一個目錄，目錄下每個頁面一個markdown檔案。`_index.md`為該章封面與前言。Frontmatter裡面的`weight`為文章在左邊列表的順序。
```bash
.
├── archetypes
├── assets
├── config.toml
├── content.zh     --> 文章目錄
├── deploy_n.sh
├── LICENSE
├── README.md
├── static
│   ├── favicon.png
│   ├── favicon.svg
│   ├── images     --> 圖片目錄
│   └── logo.png
└── themes
```


## 3. 生成網頁

此手冊使用[Hugo](https://gohugo.io/)與[hugo-paper](https://github.com/nanxiaobei/hugo-paper)主題製作而成。網頁可以在本機離線瀏覽。

1. 安裝[Git](https://git-scm.com/)和[Hugo](https://gohugo.io/)

2. fork或clone此儲存庫
```bash
git clone git@github.com:ivon852/stable-diffusion-webui-manuals.git
```

3. 修改`config.toml`，將`bashURL`後面的網址改成`/`。

4. 預覽網頁
```bash
hugo server -D
```

5. 生成靜態HTML，成品位於`public`目錄。
```bash
hugo --gc --minify
```
