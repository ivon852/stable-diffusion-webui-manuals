---
title: "2.3. 圖生圖 Image to image"
weight: 3
---


圖生圖img2img是讓AI參照現有的圖片繪圖，例如：上傳一張真人照片，讓AI把他畫成動漫人物；上傳畫作線稿，讓AI自動上色。


# 實際操作

1. 點選框框上傳圖片。圖片比例需要跟設定繪製的長寬一致，例如512x512就得上傳長寬1:1比例的圖片。

<img src=/posts/stable-diffusion-webui-manuals/images/67W6nEb.webp alt=""  width=500 loading="lazy">

2. 同樣填入正負向提示詞，勾選Restore faces，再點選右上角Generate繪圖。

<img src=/posts/stable-diffusion-webui-manuals/images/ao8XZVX.webp alt=""  width=500 loading="lazy">

3. 圖生圖左下方有`CFG Scale`與`Denoising strength`這二個數值，決定與原圖的相似程度。`Denoising strength`越小與原圖越相似，可用來微調圖片。

<img src=/posts/stable-diffusion-webui-manuals/images/kB9eYuv.webp alt=""  width=500 loading="lazy">

4. 右上角的`Interrogate Deepboooru`則是上傳圖片後，用Danbooru圖庫資料判別圖片並自動填入提示詞。`Interrogate CLIP`也是類似用途，不過較適合判別真人圖片。

<img src=/posts/stable-diffusion-webui-manuals/images/LBQlhHn.webp alt=""  width=500 loading="lazy">
