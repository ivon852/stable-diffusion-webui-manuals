---
title: "2.2. 文生图 Text to image"
weight: 2
---

文生图(txt2image)即为让AI按照文字叙述生图。

开启Stable Diffusion WebUI网页后，会看到以下画面。流程为在左上角填入提示词，勾选左下角的生图参数，再点选右上角生成图片。

![](/posts/stable-diffusion-webui-manuals/images/Screenshot_20230417_181020.webp)

其余SD WebUI的功能用法大抵都按照此逻辑设计，有些参数是通用的。

需要中文界面的可以先装[中文/双语扩充功能](/posts/stable-diffusion-webui-manuals/extensions/localization-zh_tw/)。


# 2.2.1. 参数解说

不想看参数原理的请直接跳下面的「实际操作」小节，进行教学演练。

## Stable Diffusion checkpoint

目前使用的存档点模型。


## Prompts 提示词

这是填入正向与负向提示词的栏位。


## Sampling Methods 采样方法

Sampling Methods即为采样方法，各种方法得出的结果不太一样。

UniPC是2023年发表的采样方法。

DDIM和PLMS是2021年随Stable Diffusion v1发表的采样方法。

若要兼顾品质与速度，请优先试试这三种采样方法：UniPC、DPM++ 2M Karras、Euler a。


## Sampling Steps 采样步数

采样步数建议值至少为20，在使用Euler a和UniPC采样方法的时候就有很好效果。

相对的和DDIM需要80以上的采样步数才会有好结果。


## Restore faces 脸部修复

使用脸部修复模型改善脸部绘制效果。预设使用CodeFormer，可在Settings切换为GFPGAN。


## Tiling 平铺

生成类似地板花纹一样可连续的图片。


## Hires_fix 高画质修复

可以提升图片的画质，但是会耗费更多VRAM。


## Width x Height 图片宽高

生成图片的宽高，尺寸越大品质越好，但越会吃掉更多VRAM。

预设宽高为512x512，新版的建议可以试试768x768。

其余可用的宽高比(ratio)请参考下表。 [图片来源](https://github.com/AUTOMATIC1111/stable-diffusion-webui/discussions/1025#discussioncomment-3727588)

![](/posts/stable-diffusion-webui-manuals/images/192161440-325bfde9-b398-4622-b833-01a6c9cd3b99.webp)


## CFG Scale

CFG Scale即Classifier-free guidance scale

AI生图与你给的提示词的相关度，数值越高越会按照你说的内容下去生图。


## Batch count

设定按左上角的Generate后要生成多少次的图片。


## Batch size

设定按左上角的Generate后，一次生成内要算多少图片。通常要一次算多张图，调整Batch count就够了，Batch size的值维持为1。


## Seed 种子码

生成图片的种子码。将种子码保存下来有助于保留生图的风格。

点选骰子图示，设定成`-1`即为重置种子码；回收符号则是叫出上一次生图所使用的种子码。


## Scripts

载入使用者撰写的脚本。内建的有：

- Prompt Matrix：会生出一个表格图片，用于比对不同提示词生图的效果
- Prompts from files or textbox：从写好提示词的文件生成图片。
- X/Y/Z plot：用于比对不同提示词、取样方法、CFG Scale、种子码的组合所生图的效果。


## 储存提示词

右上角可以储存与载入生图提示词。

5个按钮由左至依序为：1. 叫出上次生图使用的设定值 2. 清空提示词 3. 启用[额外网络](/posts/stable-diffusion-webui-manuals/features/extra-networks/) 4. 套用选中的风格 5. 储存目前的提示词

![](/posts/stable-diffusion-webui-manuals/images/Screenshot_20230417_183512.webp)


储存的提示词此处称为风格(styles)

下方的Styles列表即为储存的提示词。点选储存的提示词(可多选)，再点选上面的剪贴板图示，即会将该提示词组合加到左边的提示词栏位。


# 2.2.2. 实际操作

Stable Diffusion WebUI正上方可看到现在使用的是哪个模型。切换模型约需要等30秒。

![](/posts/stable-diffusion-webui-manuals/images/Iew050C.webp)

1. 在页面上方填入正向与负向提示词。右边有存档按钮。

![](/posts/stable-diffusion-webui-manuals/images/kG3Bn21.webp)

2. Sampling Methods建议先试试最快的「UniPC」，其次是「Euler a」、「DPM++ 2M Karras」。 ，Sampling Steps设20，`Width`x`Height`设定为512x512。

![](/posts/stable-diffusion-webui-manuals/images/vUevujL.webp)

3. 勾选左下角的脸部修复 (Restore faces)，改善脸部绘制效果。

![](/posts/stable-diffusion-webui-manuals/images/4tYozfF.webp)

4. 点右上角的Generate开始生图。

![](/posts/stable-diffusion-webui-manuals/images/qu1BW4g.webp)

5. 视显卡性能而定，约一分钟图片就会算出来了，点选放大右键储存。

![](/posts/stable-diffusion-webui-manuals/images/X2jMeJx.webp)

6. 左下角有`Batch count`的数值可设定一次算多张图。

![](/posts/stable-diffusion-webui-manuals/images/mX8jX9s.webp)

7. 如果对此次结果满意，不妨将种子码 (Seed) 保存下来供日后利用，这样可以一定程度保留风格。

![](/posts/stable-diffusion-webui-manuals/images/DFIZZfA.webp)

不论图片有无右键储存，Stable Diffusion WebUI生成的图都会自动储存到软件文件夹下的`outputs`文件夹。
