---
title: "介紹"
weight: 1
---

在開始安裝Stable Diffusion WebUI前，先來了解一下背景知識吧。

Stable Diffusion (穩定擴散) 是一個擴散模型，2022年8月由德國CompVis協同Stability AI和Runway發表論文，並推出相關程式。

同年，AUTOMATIC1111開發了圖形化界面：「Stable Diffusion WebUI」，這是能用AI技術生成圖片的開源軟體，只要給定一組描述文字，AI就會開始繪圖(準確的說是「算圖」或「生圖」)；亦能模仿現有的圖片，生成另一張圖片。甚至給它一部分塗黑的圖片，AI也能按照你的意願將圖片填上適當的內容。除此之外還支援自行訓練模型加強生圖效果。

以下是一些Stable Diffusion WebUI生成的圖像，無後期處理。

![](../../images/introduction-1.webp)

![](../../images/introduction-2.webp)

![](../../images/introduction-3.webp)


Stable Diffusion WebUI整合了許多程式，因其跨平台又有很好的擴充性，便成為最多人使用的圖形化程式。圖形界面是透過網頁存取的，上手無難度，還有社群製作的界面中文化擴充功能。

與其他雲端AI繪圖軟體Midjoruney、NovelAI、DALL-E相比，Stable Diffusion WebUI最大優點是可以免費在自己的電腦或伺服器跑，且只要遵照[Creative ML OpenRAIL-M授權條款](https://github.com/CompVis/stable-diffusion/blob/main/LICENSE)的話，幾無使用限制。

因其開放原始碼的特性，任何人都可以貢獻程式碼，參與改進專案。

一開始Stable Diffusion WebUI支援的是x86架構，配備獨立顯示卡的Linux和Windows電腦。不過AI繪圖熱門到讓Apple公司親自下場優化，於是macOS也可以跑Stable Diffusion WebUI了。只是用筆電跑的要小心，AI繪圖會佔用大量GPU資源，小心散熱。

至2023年，Stable Diffusion WebUI已支援Linux/Windows/MacOS系統，以及Nvidia/AMD/Intel Arc/Apple Silicon M的GPU。
