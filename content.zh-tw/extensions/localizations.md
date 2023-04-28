---
title: "安裝中文和雙語界面"
weight: 2
---

- 正體中文擴充功能來源：[benlisquare/stable-diffusion-webui-localization-zh_TW](https://github.com/benlisquare/stable-diffusion-webui-localization-zh_TW)
- 簡體中文擴充功能來源：[dtlnor/stable-diffusion-webui-localization-zh_CN](https://github.com/dtlnor/stable-diffusion-webui-localization-zh_CN)

Stable Diffusion WebUI可以透過擴充功能將界面變成中文。如果您想協助翻譯，請點選以上的Github儲存庫連結，幫幫他們。

1. 進入Extensions頁面，取消勾選`localization`，再點選`Load from:`，找到`zh_TW Localization`或`zh_CN Localization`，點選Install。

![](../../images/localizations-1.webp)

2. 到Settings頁面，找到左邊的Localization，點選`zh-tw`或`zh-cn`，再點選`Apply Settings`。

![](../../images/localizations-2.webp)

3. 之後重啟WebUI，界面就會變成中文了。

由於SD WebUI的擴充功能發展太快，翻譯可能跟不上，建議另外安裝雙語對照[sd-webui-bilingual-localization](https://github.com/journey-ad/sd-webui-bilingual-localization)，同時顯示中文和英文的文字，這樣看教學時就不會找無按鈕了。

啟用雙語擴充功能前，要到Settings → User interface → Localization設為None再重啟才會生效。

![](../../images/localizations-3.webp)
