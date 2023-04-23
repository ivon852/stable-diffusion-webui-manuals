---
title: "簡易負向提示詞 EasyNegative"
weight: 4
---

- 擴充功能來源：[gsdf/EasyNegative](https://huggingface.co/datasets/gsdf/EasyNegative)

用這個取代冗長的負向提示詞吧，反過來利用Embedding的特性，告訴AI不要畫什麼。

到[作者的儲存庫](https://huggingface.co/datasets/gsdf/EasyNegative)下載`EasyNegative.safetensors`，將它放到`stable-diffuison-webui`資料夾下的`embeddings`，重啟WebUI。

之後在WebUI的負向提示詞欄位填入`EasyNegative`即會生效，可有效替代冗長的負向提示詞。不過單獨使用效果可能還是不好，你還是需要額外準備一些負向提示詞。

![](../../images/QQQ7O3N.webp)
