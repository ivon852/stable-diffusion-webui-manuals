---
title: "自動從CivitAI下載模型和縮圖 Civitai Extension"
weight: 5
---

- 擴充功能來源：[butaixianran/Stable-Diffusion-Webui-Civitai-Helper](https://github.com/butaixianran/Stable-Diffusion-Webui-Civitai-Helper)

喜歡從[CivitAI](https://civitai.com/)下載模型的用戶，裝這個擴充功能就不用[手動下載模型](../installation/download-models)了！此擴充功能於Stable Diffusion WebUI的界面加入CivitAI模型下載頁面，方便下載各種模型，還會自動比對資料抓取模型的縮圖。

安裝方法：進入Extensions頁面，點選Install from URL，輸入`https://github.com/civitai/sd_civitai_extension.git`後按Install，關掉終端機，重啟WebUI。

重開WebUI頁面即會多出"Civitai Helper"。

![](../../images/stable-diffusion-webui-civitai-helper-1.webp)


此頁面有4個功能：


## 1. 自動下載縮圖

點選橘色的Scan按鈕，它就會自動比對本機模型(存檔點、嵌入、超網路、LoRA)的資料，從CivitAI下載模型縮圖。

![](../../images/stable-diffusion-webui-civitai-helper-2.webp)


## 2. 從CivitAI取得模型資訊

此功能用於爬取本機模型的資訊。

於`Civitai URL`的欄位填入模型的網址(就是你用瀏覽器所看到的網址)，例如這裡我選擇Deliberate這個本機模型。

點選`Get Model Info from Civitai`即會下載模型的資料。

![](../../images/stable-diffusion-webui-civitai-helper-3.webp)


## 3. 從CivitAI下載模型檔

1. 於`Civitai URL`欄位填入模型的網址(就是你用瀏覽器所看到的網址)，點選`1. Get Model Info by Civitai Url`取得該頁面的資料。

![](../../images/stable-diffusion-webui-civitai-helper-4.webp)

2. 它會自動抓取模型種類和資訊，`Model Name`模型名稱和`Model Version`模型版本可以自選。點選`3. Download Model`開始下載模型。至於下載進度條請看終端機。

![](../../images/stable-diffusion-webui-civitai-helper-5.webp)


## 4. 檢查模型有無更新

將Model Types全部打勾，點選`Check New Version from Civitai`，若有新版模型它就會自動下載。

![](../../images/stable-diffusion-webui-civitai-helper-6.webp)

