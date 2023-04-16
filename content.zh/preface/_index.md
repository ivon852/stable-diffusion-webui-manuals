---
title: "0. 前言"
bookFlatSection: false
bookCollapseSection: true
weight: 1
---

Stable Diffusion (穩定擴散) 是一個擴散模型，最早由德國CompVis發表並推出相關程式。後來AUTOMATIC1111開發了圖形化界面：「Stable Diffusion WebUI」，成為最多人使用的版本。下面簡稱SD WebUI。

SD WebUI是能用AI技術生成圖片的開源軟體，只要給定一組描述文字，AI就會開始繪圖(準確的說是「算圖」或「生成」圖像)；亦能模仿現有的圖片，繪製另一張圖片。甚至給它一部分塗黑的圖片，AI也能按照你的意願將圖片填上適當的內容。除此之外還支援自行訓練模型加強算圖效果。

以下是一些Stable Diffusion WebUI生成的圖像，無後期處理。

![一些Stable Diffusion WebUI的繪圖，無後製。](/posts/stable-diffusion-webui-manuals/images/title-1.4.webp)

![一些Stable Diffusion WebUI的繪圖，無後製。](/posts/stable-diffusion-webui-manuals/images/title-1.3.webp)

![一些Stable Diffusion WebUI的繪圖，無後製。](/posts/stable-diffusion-webui-manuals/images/title-1.5.webp)

與其他雲端AI繪圖軟體Midjoruney、NovelAI、DALL-E相比，SD WebUI最大優點是可以免費在自己的電腦或伺服器跑，且只要遵照[Creative ML OpenRAIL-M授權條款](https://github.com/CompVis/stable-diffusion/blob/main/LICENSE)的話，幾無使用限制。因其開放原始碼的特性，任何人都可以貢獻程式碼，參與改進專案。

AI繪圖熱門到Apple公司親自下場優化，有了Apple Silicon的強悍GPU性能，再加上Apple CoreML對Stable Diffusion程式的優化，要在macOS跑Stable Diffusion WebUI也是有可能的。不過用筆電跑的要小心，AI繪圖會佔用大量GPU資源，小心散熱。

SD WebUI支援Linux/Windows/MacOS系統，以及Nvidia/AMD/Apple Silicon M的GPU。其圖形界面是透過網頁存取的，上手無難度，還有社群製作的界面中文化擴充功能。

