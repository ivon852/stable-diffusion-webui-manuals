---
title: "2.7. 放大圖片解析度 Upscalers"
weight: 7
---

Stable Difussion WebUI內建AI放大技術，像是ESRGAN，比Waifu2x更強。

如果用預設的512x512解析度就生出不錯的圖，可以將圖片直接丟到Extras放大。


# 1. 參數解說

## Scale by

按照此數字的倍數放大

## Scale to

放大至指定寬高

## Upscaler 1 & Upscaler 2

放大圖片的時候可以只用一種放大器，也可以混合使用二種放大器。


## Upscaler 2 visibility

第二個放大器的權重。

## GFPGAN visibility

GFPGAN臉部修復模型的權重

## CodeFormer visibility

CodeFormer臉部修復模型的權重


# 2. Upscaler效果比較

目前Stable Diffusion WebUI的放大器包含LDSR、BSRGAN、ESRGAN_4x、R-ESRGAN-General-4xV3、R-ESRGAN-General-WDN-4xV3、R-ESRGAN-AnimeVideo、R-ESRGAN-4x+、R-ESRGAN-4x+-Anime6B、ScuNET-GAN、ScuNET-PSNR、SwinIR_4x...看的讓人頭昏眼花。

根據Reddit網友在[The DEFINITIVE Comparison to Upscalers](https://www.reddit.com/r/StableDiffusion/comments/y2mrc2/the_definitive_comparison_to_upscalers/)一文的比較，總結如下：

- ESRGAN_4x適合用於處理真人照片
- ESRGAN_4x適合用於繪畫
- Anime6B適合用於動漫圖片，它也可以用來將真人圖片轉動漫風格


# 3. 實際操作

切換至Extras頁面，上傳圖片，選取放大2倍，點選下面的`Upscaler 1`中挑一個看起來順眼的，其餘維持預設，按`Generate`即會得到放大過的圖片。

![](../../images/6s3J611.webp)

旁邊的Batch Process可以一次處理大量圖片；Batch from Directory則是從特定資料夾輸入放大圖片。
