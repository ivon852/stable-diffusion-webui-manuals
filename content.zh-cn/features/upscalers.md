---
title: "4.6. 放大图片分辨率 Upscalers"
weight: 7
---

Stable Difussion WebUI内置AI放大技术，像是ESRGAN，比Waifu2x更强。

如果用缺省的512x512分辨率就生出不错的图，可以将图片直接丢到Extras放大。


# 1. 参数解说

## Scale by

按照此数字的倍数放大

## Scale to

放大至指定宽高

## Upscaler 1 & Upscaler 2

放大图片的时候可以只用一种放大器，也可以混合使用二种放大器。


## Upscaler 2 visibility

第二个放大器的权重。

## GFPGAN visibility

GFPGAN脸部修复模型的权重

## CodeFormer visibility

CodeFormer脸部修复模型的权重


# 2. Upscaler效果比较

目前Stable Diffusion WebUI的放大器包含LDSR、BSRGAN、ESRGAN_4x、R-ESRGAN-General-4xV3、R-ESRGAN-General-WDN-4xV3、R-ESRGAN-AnimeVideo、R-ESRGAN-4x+、R-ESRGAN-4x+-Anime6B、ScuNET-GAN、ScuNET-PSNR、SwinIR_4x...看的让人头昏眼花。

根据Reddit网友在[The DEFINITIVE Comparison to Upscalers](https://www.reddit.com/r/StableDiffusion/comments/y2mrc2/the_definitive_comparison_to_upscalers/)一文的比较，总结如下：

- ESRGAN_4x适合用于处理真人照片
- ESRGAN_4x适合用于绘画
- Anime6B适合用于动漫图片，它也可以用来将真人图片转动漫风格


# 3. 实际操作

切换至Extras页面，上传图片，选取放大2倍，点击下面的`Upscaler 1`中挑一个看起来顺眼的，其余维持缺省，按`Generate`即会得到放大过的图片。

![](../../../images/upscalers-1.webp)

旁边的Batch Process可以一次处理大量图片；Batch from Directory则是从特定文件夹输入放大图片。
