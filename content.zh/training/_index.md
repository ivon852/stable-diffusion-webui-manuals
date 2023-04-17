---
title: "4. 訓練模型"
bookFlatSection: false
bookCollapseSection: true
---

本文Ivon將說明AI繪圖軟體Stable Diffusion WebUI模型的訓練方法(model training)，包含Textual Inversion (Embedding)、HyperNetwork、LoRA，並給出實際例子與操作步驟。

以下是一個具體例子，透過使用自行訓練的HyperNetwork，便改善單靠Anything模型無法繪製出Hara老師畫風的缺點。在不使用HyperNetwork的情況下，風格永遠是左邊那樣；一使用HyperNetwork，右邊的風格就能輕鬆繪製出來了。
![](/posts/stable-diffusion-webui-manuals/images/vPJsJB1.webp)

本文所討論的訓練模型僅為自用用途，若要分享訓練的模型也應遵照開源的原則分享。
