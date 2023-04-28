# Stable Diffusion WebUI中文使用手冊

Stable Diffusion WebUI User Manuals in Chinese

Stable Diffusion WebUI中文使用手冊，針對AUTOMATIC1111開發的版本撰寫。

[線上閱讀](https://ivonblog.com/posts/stable-diffusion-webui-manuals/)，目前的語言有正體中文、简体中文(使用OpenCC轉換)、English(興建中)。


## 1. 動機

自2022年12月以來，敝人在部落格撰寫一系列有關Stable Diffusion的教學文章，內容涵蓋各大系統的安裝過程，AI生圖的操作說明，擴充功能介紹，模型訓練過程。有感於閱讀不便，易使人產生散亂之感，故做成類似手冊的樣式，方便閱讀。

這本手冊的文章以[姓名標示-相同方式分享 4.0 國際 (CC BY-SA 4.0)](https://creativecommons.org/licenses/by-sa/4.0/deed.zh_TW)釋出，這意味著你可以：以任何媒介或格式重製及散布本素材。重混、轉換本素材、及依本素材建立新素材，且為任何目的，包含商業性質之使用。但是你必須註明此Github儲存庫與文章的原作者姓名，並提供指向本授權條款的連結，以及指出（本作品的原始版本）是否已被變更。你可以任何合理方式為前述表彰，但不得以任何方式暗示授權人為你或你的使用方式背書。若你重混、轉換本素材，或依本素材建立新素材，你必須依本素材的授權條款來散布你的貢獻物。且你不能增設法律條款或科技措施，來限制別人依授權條款本已許可的作為。


## 2. 目錄架構

每個章節一個目錄，目錄下每個頁面一個markdown檔案。
```bash
.
├── content.zh-tw       --> 文章目錄 (正體中文)
├── content.zh-cn       --> 文章目錄 (简体中文)
├── content.en-us       --> 文章目錄 (English)
├── static
└── └── images          --> 圖片目錄
```

`_index.md`為該章封面與前言。Frontmatter裡面的`weight`為文章在左邊列表的順序。

不論何種語言，引用網址是一樣的，Hugo會自行判斷。

至於圖片引用，非正體中文的路徑一律是`../../../images/<圖片檔名>`，這樣不論前置域名為何皆能找到圖片。


## 3. 離線閱讀HTML檔案

此手冊使用[Hugo](https://gohugo.io/)與[hugo-paper](https://github.com/nanxiaobei/hugo-paper)主題製作而成。網頁可以在本機離線瀏覽。

1. 安裝[Git](https://git-scm.com/)和[Hugo](https://gohugo.io/)

2. fork或clone此儲存庫
```bash
git clone git@github.com:ivon852/stable-diffusion-webui-manuals.git
cd stable-diffusion-webui-manuals
```

3. 預覽網頁，伺服器IP位址為`http://localhost:1313`，按CTRL＋C終止。
```bash
hugo server -D --config config.toml
```

4. 執行`generate_static_html.sh`指令稿生成靜態網頁，成品位於`public`目錄，用瀏覽器開啟`index.html`即可閱讀。
```bash
bash generate_static_html.sh
```

＊`deploy_ivonblog.sh`和`config_ivonblog.toml`這二個檔案是我自用的，用於部署到我的部落格。


## 致謝

感謝原始AI繪圖工具的開發者CompVis、StabilityAI、RunwayAI、AUTOMATIC1111，以及全世界大大小小開發者的付出，才有了這本手冊。
