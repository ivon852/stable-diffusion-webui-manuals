---
title: "4.1. 文生图 Text to image"
weight: 2
---

文生图(txt2image)即为让AI按照文本叙述生图。

打开Stable Diffusion WebUI网页后，第一个看到的是以下画面，这就是文生图的页面。

![](../../../images/text-to-image-1.webp)

生图流程为在左上角填入提示词，勾选左下角的生图参数，再点击右上角生成图片。其余SD WebUI的功能用法大抵都按照此逻辑设计，有些参数是通用的。

需要中文界面的可以先装[正体中文/双语扩充功能](../extensions/localizations/)。


# 1. 参数解说

## Stable Diffusion checkpoint

目前使用的存盘点模型。


## Prompts 提示词

这是填入正向与负向提示词的字段。


## Sampling Methods 采样方法

Sampling Methods即为采样方法，各种方法得出的结果不太一样。

UniPC是2023年发表的采样方法。

DDIM和PLMS是2022年随Stable Diffusion v1发表的采样方法。

若要兼顾品质与速度，请优先试试这三种采样方法：UniPC、DPM++ 2M Karras、Euler a。


## Sampling Steps 采样步数

采样步数建议值至少为20，在使用Euler a和UniPC采样方法的时候就有很好效果。

相对的和DDIM需要80以上的采样步数才会有好结果。


## Restore faces 脸部修复

使用脸部修复模型改善脸部生成效果。缺省使用CodeFormer，可在Settings切换为GFPGAN。


## Tiling 平铺

生成类似地板花纹一样可连续的图片。


## Hires_fix 高清修复

可以提升图片的画质，但是会耗费更多VRAM。


## Width x Height 图片宽高

生成图片的宽高，尺寸越大品质越好，但越会吃掉更多VRAM。

缺省宽高为512x512，新版的建议可以试试768x768。

其余可用的宽高比(ratio)请参考下表。[图片来源](https://github.com/AUTOMATIC1111/stable-diffusion-webui/discussions/1025#discussioncomment-3727588)

![](../../../images/text-to-image-2.webp)


## CFG Scale

CFG Scale即Classifier-free guidance scale

AI生图与你给的提示词的相关度，数值越高越会按照你说的内容下去生图。


## Batch count

设置按左上角的Generate后要生成多少次的图片。


## Batch size

设置按左上角的Generate后，一次生成内要算多少图片。通常要一次算多张图，调整Batch count就够了，Batch size的值维持为1。


## Seed 种子码

生成图片的种子码。将种子码保存下来有助于保留生图的风格。

点击骰子图标，设置成`-1`即为重置种子码；回收符号则是叫出上一次生图所使用的种子码。


## Scripts

加载用户撰写的指令稿。内置的有：

- Prompt Matrix：会生出一个表格图片，用于比对不同提示词生图的效果
- Prompts from files or textbox：从写好提示词的文件生成图片。
- X/Y/Z plot：用于比对不同提示词、采样方法、CFG Scale、种子码的组合所生图的效果。


## 保存提示词

右上角可以保存与加载生图提示词。

5个按钮由左至依序为：1. 叫出上次生图使用的设置值 2. 清空提示词 3. 激活[额外网络](../features/extra-networks/) 4. 套用选中的风格 5. 保存目前的提示词

![](../../../images/text-to-image-3.webp)


保存的提示词此处称为风格(styles)

下方的Styles列表即为保存的提示词。点击保存的提示词(可多选)，再点击上面的剪贴板图标，即会将该提示词组合加到左边的提示词字段。


# 2. 实际操作

Stable Diffusion WebUI正上方可看到现在使用的是哪个模型。切换模型约需要等30秒。

![](../../../images/text-to-image-4.webp)

1. 在页面上方填入正向与负向提示词。右边有存盘按钮。

![](../../../images/text-to-image-5.webp)

2. Sampling Methods建议先试试最快的「UniPC」，其次是「Euler a」、「DPM++ 2M Karras」。，Sampling Steps设20，`Width`x`Height`设置为512x512。

![](../../../images/text-to-image-6.webp)

3. 勾选左下角的脸部修复 (Restore faces)，改善脸部生成效果。

![](../../../images/text-to-image-7.webp)

4. 点右上角的Generate开始生图。

![](../../../images/text-to-image-8.webp)

5. 视显卡性能而定，约一分钟图片就会算出来了，点击放大右键保存。

![](../../../images/text-to-image-9.webp)

6. 左下角有`Batch count`的数值可设置一次算多张图。

![](../../../images/text-to-image-10.webp)

7. 如果对此次结果满意，不妨将种子码 (Seed) 保存下来供日后利用，这样可以一定程度保留风格。

![](../../../images/text-to-image-11.webp)

不论图片有无右键保存，Stable Diffusion WebUI生成的图都会自动保存到主程序文件夹下的`outputs`文件夹。
