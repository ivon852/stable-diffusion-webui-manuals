---
title: "2.3. 图生图 Image to image"
weight: 3
---


图生图(img2img)是让AI参照现有的图片生图，源自InstructPix2Pix技术。

例如：上传一张真人照片，让AI把他画成二次元人物；上传画作线稿，让AI自动上色。


# 参数解说

部份参数与文生图的参数重叠，这里不赘述。


## Resize mode 裁切模式

决定要对上传的图片做何种操作。

上传的图片最好与生图设定的一致。

- Just resize：调整图片为生图设定的宽高。若上传图片的宽高与生成设定的宽高不一致，则该图片会被压扁
- Crop and resize：裁切图片以符合生图的宽高
- Resize and fill：裁切并调整图片宽高，若上传图片的宽高与生成设定的宽高不一致，则多出来的区域会自动填满。
- Just resize (latent upscale)：调整图片大小为生图设定的宽高，并使用潜在空间放大。


## Denoising strength 降噪强度

数值越小，生成的图与原图越相似，可用来微调图片。

## Interrogate Deepboooru

上传图片后，用Danbooru图库资料判别图片并自动填入提示词。需要注意Deepboooru训练的图像数量有限，它顶多只能用来认图片的场景和人物tag，无法准确标出最新的二次元角色。

![](../../../images/LBQlhHn.webp)

初次使用的时候，Stable Diffusion WebUI会自动下载模型。

## Interrogate CLIP

类似Deepbooru用途，不过较适合判别真人照片内容。


# 实际操作

1. 点选框框上传图片。图片比例需要跟设定生成的宽高一致，例如512x512就得上传宽高1:1比例的图片。

![](../../../images/67W6nEb.webp)

2. 同样填入正负向提示词，就是你希望AI将图片改绘成什么，勾选Restore faces，再点选右上角Generate生图。

![](../../../images/ao8XZVX.webp)

3. 图生图左下方有`CFG Scale`与`Denoising strength`这二个数值，决定与原图的相似程度。如下图所示，`Denoising strength`调低的情况下可以用来微调原图。

![](../../../images/kB9eYuv.webp)
