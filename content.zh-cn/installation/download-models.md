---
title: "2.2. 下载模型"
weight: 2
---

存盘点模型(checkpoint，勿跟LoRA搞混)是AI生图的重要依据，算图用的模型可以安装很多个。

Stable Diffusion WebUI在初次启动时，若放模型的文件夹(`models/Stable-diffusion`)为空，则会自动下载原始版的Stable Diffusion v1.5模型。

但是，不同人玩AI生图有不同的需求，以写实风格为主的Stable Diffusion模型可能无法满足所有人。因此你可以先下载自己想要使用的模型。

这里推荐一些不错的模型。


# 1. 模型下载网站

目前找Stable Diffusion与其衍生模型的网站主要就二个。

第一个是[HuggingFace](https://huggingface.co/models?other=stable-diffusion)，中文俗称抱脸笑，可以说是人工智能界的Github。Stable Diffusion背后用到的很多AI工具，如Transformer、Tokenizers、Datasets都他们开发的，网站上也有丰富的教学文档。

另一个是[Civitai](https://civitai.com/)，专门用来分享Stable Diffusion相关的资源，特色是模型都有示范缩略图，用户也可以分享彼此使用的提示词，以及分享作品。注意Civitai可能包含未成年不宜的图像。


## 写实风模型

说到万模型之母，不得不提原始版的Stable Diffusion了，简称SD，是CompVis与合作团队最初发表的模型，不断更新中。

最初[Stable Diffusion v1](https://huggingface.co/runwayml/stable-diffusion-v1-5)是使用512x512像素的图片训练的，因此高于此尺寸的生图品质会变差。后来[Stable Diffusion v2](https://huggingface.co/stabilityai/stable-diffusion-2-1)的训练图片宽高提升到了768x768像素。

网络上很多模型都基于此模型训练而来。适合画真人、动物、自然、科技、建筑的图像，亦学习过历史上许多画家的画风。

---

[Chilloutmix](https://civitai.com/models/6424/chilloutmix)：写实风格的模型，适合画出2.5次元，融合日韩真人与动漫风格的图像。

[Deliberate](https://civitai.com/models/4823/deliberate)：基于SD-1.5模型，适合生成精致写实风格的人物、动物、自然风景。

[Realistic Vision v1.4](https://civitai.com/models/4201/realistic-vision-v13)：写实风人物与动物模型。


## 动漫风模型

[Anything万象熔炉 v4.5](https://huggingface.co/andite/anything-v4.0)适合画动漫图，作者宣称不需要打一堆提示词也能出漂亮的图。

[Waifu Diffusion v1.4](https://huggingface.co/hakurei/waifu-diffusion-v1-4)是纯粹使用Danbooru图库训练而成，适合画动漫图。

[Hentai Diffusion](https://github.com/Delcos/Hentai-Diffusion)适合画动漫图，模型已使用大量负向提示词训练过以排除不良结果，另提供embeddings方便绘图时使用。

[DreamShaper](https://civitai.com/models/4384/dreamshaper)是基于SD-1.5模型，生成精细动漫人物与油画风格的模型。

[OrangeMix3](https://huggingface.co/WarriorMama777/OrangeMixs)，混合多种风格的动漫绘图模型，偏写实。


# 2. 如何下载模型

通常只需要下载模型档即可。

HuggingFace为保存库 → Files and versions，选择下载扩展名为`.ckpt`或`.safetensors`的模型。后者因不具备运行代码的能力因此较前者安全。至于`-pruned`代表模型有删减过大小。

<img src=../../../images/download-models-1.webp alt=""  width=500 loading="lazy">

Civitai则是点击Download按钮下载模型。


如果要用指令下载，可以用wget或git，例如下载`Anything V4.5`的模型到`stable-diffusion-webui/models/Stable-diffusion`文件夹：
```bash
wget -nc -P stable-diffusion-webui/models/Stable-diffusion https://huggingface.co/andite/anything-v4.0/resolve/main/anything-v4.5-pruned.safetensors
```


## 3. 模型放置位置

不论是.ckpt还是.safetensors模型，都是在拷贝stable-diffusion-webui的保存库后，放到主程序文件夹下的`/models/Stable-diffusion`文件夹。
