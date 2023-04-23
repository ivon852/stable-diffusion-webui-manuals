---
title: "2.3. 圖生圖 Image to image"
weight: 3
---


圖生圖(img2img)是讓AI參照現有的圖片生圖，源自InstructPix2Pix技術。

例如：上傳一張真人照片，讓AI把他畫成動漫人物；上傳畫作線稿，讓AI自動上色。


# 參數解說

部份參數與文生圖的參數重疊，這裡不贅述。


## Resize mode 裁切模式

決定要對上傳的圖片做何種操作。

上傳的圖片最好與生圖設定的一致。

- Just resize：調整圖片為生圖設定的寬高。若上傳圖片的寬高與生成設定的寬高不一致，則該圖片會被壓扁
- Crop and resize：裁切圖片以符合生圖的寬高
- Resize and fill：裁切並調整圖片寬高，若上傳圖片的寬高與生成設定的寬高不一致，則多出來的區域會自動填滿。
- Just resize (latent upscale)：調整圖片大小為生圖設定的寬高，並使用潛在空間放大。


## Denoising strength 降噪強度

數值越小，生成的圖與原圖越相似，可用來微調圖片。

## Interrogate Deepboooru

上傳圖片後，用Danbooru圖庫資料判別圖片並自動填入提示詞。需要注意Deepboooru訓練的圖像數量有限，它頂多只能用來認圖片的場景和人物tag，無法準確標出最新的動漫角色。

![](/posts/stable-diffusion-webui-manuals/images/LBQlhHn.webp)

初次使用的時候，Stable Diffusion WebUI會自動下載模型。

## Interrogate CLIP

類似Deepbooru用途，不過較適合判別真人照片內容。

# 實際操作

1. 點選框框上傳圖片。圖片比例需要跟設定繪製的寬高一致，例如512x512就得上傳寬高1:1比例的圖片。

![](/posts/stable-diffusion-webui-manuals/images/67W6nEb.webp)

2. 同樣填入正負向提示詞，就是你希望AI將圖片改繪成什麼，勾選Restore faces，再點選右上角Generate生圖。

![](/posts/stable-diffusion-webui-manuals/images/ao8XZVX.webp)

3. 圖生圖左下方有`CFG Scale`與`Denoising strength`這二個數值，決定與原圖的相似程度。如下圖所示，`Denoising strength`調低的情況下可以用來微調原圖。

![](/posts/stable-diffusion-webui-manuals/images/kB9eYuv.webp)
