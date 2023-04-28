---
title: "提示詞自動補完 Booru tag autocompletion"
weight: 5
---

- 擴充功能來源：[DominikDoom/a1111-sd-webui-tagcomplete](https://github.com/DominikDoom/a1111-sd-webui-tagcomplete)

輸入提示詞的時候提示相關Danbooru上的標籤，畫動漫圖的時候很有用，還可以安裝中文標籤翻譯。

![](../../images/ZWKtuRV.webp)

進入Extensions頁面，點選`Install from URL`，輸入網址`https://github.com/DominikDoom/a1111-sd-webui-tagcomplete.git`，按`Install`，之後重啟WebUI。

如何安裝標籤中文翻譯：到[byzod/a1111-sd-webui-tagcomplete-CN](https://github.com/byzod/a1111-sd-webui-tagcomplete-CN)儲存庫，點選綠色的Code → Download ZIP，解壓縮，得到tags資料夾，下面有`Tags-zh-full-pack.csv`和`config.json`這二個檔案。將這二個檔案移動到`stable-diffusion-webui/extensions/a1111-sd-webui-tagcomplete/tags`資料夾。
