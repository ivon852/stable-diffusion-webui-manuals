# Stable Diffusion WebUI中文使用手冊

Stable Diffusion WebUI User Manuals in Chinese

[線上閱讀](https://ivonblog.com/posts/stable-diffusion-webui-manuals/)，目前的語言有正體中文(歡迎PR)、简体中文(欢迎PR)、English(興建中)。


## 1. 動機

自2022年12月以來，敝人在部落格撰寫一系列有關Stable Diffusion的教學文章，內容涵蓋各大系統的安裝過程，AI生圖的操作說明，擴充功能介紹，模型訓練過程。有感於閱讀不便，易使人產生散亂之感，故做成類似手冊的樣式，方便閱讀。


## 2. 目錄架構

每個章節一個目錄，目錄下每個頁面一個markdown檔案。
```bash
.
├── archetypes
├── assets
├── config.toml
├── config_ivonblog.toml
├── content.zh-tw       --> 文章目錄 (正體中文)
├── content.zh-cn       --> 文章目錄 (简体中文)
├── content.en-us       --> 文章目錄 (English)
├── deploy_ivonblog.sh
├── LICENSE
├── README.md
├── static
│   ├── favicon.png
│   ├── favicon.svg
│   ├── images          --> 圖片目錄
│   └── logo.png
└── themes
```

`_index.md`為該章封面與前言。Frontmatter裡面的`weight`為文章在左邊列表的順序。

不論何種語言，引用網址是一樣的，Hugo會自行判斷。

至於圖片引用，非正體中文的路徑一律是`../../../images/<圖片檔名>`，這樣不論前置域名為何皆能找到圖片。


## 3. 離線預覽

此手冊使用[Hugo](https://gohugo.io/)與[hugo-paper](https://github.com/nanxiaobei/hugo-paper)主題製作而成。網頁可以在本機離線瀏覽。

1. 安裝[Git](https://git-scm.com/)和[Hugo](https://gohugo.io/)

2. fork或clone此儲存庫
```bash
git clone git@github.com:ivon852/stable-diffusion-webui-manuals.git
```

3. 按需編輯`config.toml`。

4. 預覽網頁，伺服器IP位址為`http://localhost:1313`，按CTRL＋C終止。
```bash
hugo server -D --config config.toml
```

＊`deploy_ivonblog.sh`和`config_ivonblog.toml`這二個檔案是我自用的，用於部署到我的部落格。


## 致謝

感謝原始AI繪圖工具的開發者CompVis、StabilityAI、RunwayAI、ATOMATIC1111，以及全世界大大小小開發者的付出，才有了這本手冊。
