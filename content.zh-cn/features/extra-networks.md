---
title: "4.4. 额外网络 Extra Networks"
weight: 5
---

除了根据需求切换ckpt模型外，也可以额外叠几层网络(Extra networks)小模型来改善画风，并改善生成特定对象、角色的准确度。

例如使用Anything模型生图，再搭配"Taiwan-doll-likeness LoRA"就能转成真人风格而不用依赖许多提示词，并且可以一次叠很多个，就像套多层滤镜一般。

![](../../../images/extra-networks-1.webp)

跟ckpt大模型比起来，这类模型文件都很小，主要用来微调现有的模型。小模型有嵌入(Embedding)、超网络(HyperNetwork)、LoRA三种，扩展名以`.pt`或`.safetensors`结尾，目前最热门的为"LoRA"。更棒的是因为文件小，自行[训练喜欢的人物模型](../training/)成本并不高。


# 1. 安装小模型

[Civitai](https://civitai.com/tag/lora)有很多小模型可以下载。下载时需注意模型是哪一种。

Embedding请放`stable-diffusion-webui`文件夹下的`embeddings`

HyperNetwork放到`stable-diffusion-webui/models/hypernetworks`。

LoRA放到`stable-diffusion-webui/models/Lora`。

如果要显示小模型缩略图，将图片取跟该模型一样的文件名，并放到该模型的文件夹。例如在`Taiwan-doll-likeness.safetensors`所在的文件夹放一张`Taiwan-doll-likeness.png`。


# 2. 小模型使用方法

1. 进入WebUI，点击右上角Show extra networks

![](../../../images/extra-networks-2.webp)

2. 这样就会出现菜单。以LoRA为例，点击小模型的卡片便会将其加到提示词字段，提示词字段会出现`< >`，表示要在绘图时使用LoRA。

![](../../../images/extra-networks-3.webp)

3. 接着再加上其他提示词，生图即会有使用LoRA的风格。

![](../../../images/extra-networks-4.webp)

4. 如果生出来的图片太诡异，调整提示词字段每个LoRA后面的数字，控制权重。

![](../../../images/extra-networks-5.webp)

5. 嗯，这样看起来好些了 (并没有)

![](../../../images/extra-networks-6.webp)


# 3. 安装与使用VAE

VAE (variational autoencoder)可以让算出来的图片色彩更漂亮，改善图片颜色灰灰暗暗的问题。

Hentai Diffusion这类模型内置VAE，SD WebUI在生图时会自动侦测并套用；Anything这类的模型要另外下载VAE；VAE的下载点通常跟模型下载页面放在一起。

如果要使用VAE，下载VAE模型后，将其放到`stable-diffusion-webui/models/VAE`文件夹。

接着点击Settings → Stable Diffusion → SD VAE，选取要使用的VAE，再点击Apply Settings，此后生图就会一律使用指定的VAE。


