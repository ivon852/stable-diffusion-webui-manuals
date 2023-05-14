---
title: "ControlNet 按照骨架动作绘图"
weight: 3
---

- 扩充功能来源：[Mikubill/sd-webui-controlnet](https://github.com/Mikubill/sd-webui-controlnet)
- ControlNet的保存库：[lllyasviel/ControlNet](https://github.com/lllyasviel/ControlNet)

目前版本：ControlNet v1.1

ControlNet是通过加入额外条件来控制扩散模型的神经网络结构，它可以让AI参考给定图片的动作/线条/景深，更精准的生成图片。

跟内置的「图生图」技术比起来，ControlNet的效果更好，能让AI以指定动作生图；再搭配3D建模作为辅助，能缓解单纯用文生图手脚、脸部表情画不好的问题。

ControlNet的用法还有：上传人体骨架线条，ControlNet就能按骨架的动作生成完稿的人物图片。或是上传素色的3D建模，让ControlNet彩现成为室内布置家具。

Lvmin Zhang是ControlNet原始程序的开发者，Mikubill则是开发扩充功能，让我们可以在Stable Diffusion WebUI用ControlNet生图。


# 1. 安装ControlNet与下载模型

1. 切换至Extensions页面，点击`Install From URL`，URL输入`https://github.com/Mikubill/sd-webui-controlnet.git`，按下Install，接着从终端机按CTRL＋C，关闭Stable Diffusion WebUI。

2. 到[lllyasviel/ControlNet v1.1](https://huggingface.co/lllyasviel/ControlNet-v1-1/tree/main)下载以`.pth`结尾的模型档，全部文件加起来约18GB。`.yaml`档不需要下载。目前v1.1是测试版，之后会合并回[主保存库](https://huggingface.co/lllyasviel/ControlNet)。

![](../../../images/controlnet-1.webp)

3. 将这些模型档放到`stable-diffusion-webui/extensions/sd-webui-controlnet/models`文件夹

4. 重新启动Stable Diffusion WebUI。


# 2. 各个模型的用途

ControlNet现有以下模型，您可以按照需求只下载需要的模型。

## Anime Lineart

侦测线条，生成的图片亦会保留原始的线条，适合处理动漫图像

## Canny

侦测图片边缘，比较模糊，不如Scribbles完整。

## Depth

侦测输入图片的深度图(depth map)。

## Illumination

侦测输入图片的光源与照明效果。

## Inpaint

功能类似「内补绘制」，使用50%随机遮罩＋50%随机光流遮罩训练而成。

## Instruct Pix2Pix

模型文件名为`ip2p`，类似「图生图」，但是使用训练50%的指示(instruction)提示词和50%的叙述(description)提示词训练而成。因为是ControlNet，使用此模型时不需要调整CFG Scale。

根据原作者的说法，此模型在下「使其成为X」的提示词所生成的图，效果比「使Y成为X」要好。

> Also, it seems that instructions like "make it into X" works better than "make Y into X".

## Lineart

侦测线条，适合处理线稿，生成的图片亦会保留原始的线条。

## M-LSD

侦测输入图片的直线。

## Normalbae

## Openpose

使用OpenPose技术侦测输入图片人物的动作，不一定会保留线条。

## Scribbles

侦测线条，侦测到的线条品质介于Soft Edge和Lineart之间。

## Segmentation

模型文件名为`seg`，将侦测的图片对象切成一个一个色块处理，例如房子一个色块，后面的天空一个色块。

## Shuffle

把输入图片的概念转移到生成的图片。

作者给的例子：输入灰色装甲图片，生成的钢铁人盔甲也会是灰色的。

## Soft Edge

侦测图片边缘，效果较为柔和，像用炭笔涂过。

## Tile

输入图片，选取一个区域，使其变清晰的模型。


# 3. 参数解说

在安装之后，WebUI的界面会多出"ControlNet"的按钮。

![](../../../images/controlnet-2.webp)

点开会看到以下选项：

## Single Image

上传单张图片。

## Batch

处理多张图片。Input Directory填写的是待处理的图片所在路径。

## Open New Canvas

清除图片，开一张新画布。

## 使用电脑镜头

在Open New Canvas的选项下面有四个按钮。

![](../../../images/controlnet-3.webp)

由左到右：添加画布；使用电脑镜头拍照上传；未知；还原上次算图设置。

## Enable

在生图时激活ControlNet，必选。

## Low VRAM

生图使用ControlNet会吃更多VRAM，此选项可降低VRAM使用量。

## Pixel Perfect

由ControlNet自动决定Preprocessor分辨率。

## Allow Preview

允许预览生图结果，会显示该模型侦测的线条或骨架。

## Preprocessor 预处理器

通常Preprocessor和Model二者要一致。

Preprocessor是先将上传的图片处理过一轮，例如`Scribbles`会将彩色图片转成线稿。若图片的线条是白底黑线，且不是用WebUI画布所绘制，则Preprocessor必须选取"Invert"。

如果你的图片不需要处理，Preprocessor可留空。

## Run Preprocessor (爆炸图标)

运行预处理器，预先处理图片。


## Model 模型

设置生图的时候使用哪个ControlNet模型。

## Control Weight

ControlNet在生图时的权重。

## Starting Control Step

要让ControlNet开始参与生图的步数。

## Ending Control Step

让ControlNet结束参与生图的步数。

## Preprocessor Resolution

预处理器的分辨率。

如果不知道要设多少，请勾选"Pixel Perfect"让ControlNet自动为您决定。

## Control Mode (Guess Mode)

控制生图时，要AI平衡二者(Balanced)，或是偏重你的提示词(My prompt is more important)，还是偏重ControlNet (ControlNet is more important)。

## [Loopback] Automatically send generated images to this ControlNet unit

自动将生成的图片传回此ControlNet运算单元(unit)。

是的，如果您的电脑VRAM够大，您可以在Settings → ControlNet激活多个ControlNet运算单元。

## Multi ControlNet

一个ControlNet效果不够，您有没有想过激活第二、第三个ControlNet！？

缺省安装后只会使用一个ControlNet，但是叠加多个有助于生成更好的图片。比方说同时使用Open Pose和Depth生成人体，并防止手画歪。

要激活Multi ControlNet，请进入Settings → ControlNet，拖动拉杆，设置要激活的ControlNet数量。

<img src=../../../images/controlnet-4.webp alt=""  width=500 loading="lazy">


# 4. 实际操作

此处以改绘一个人物姿势为例子。

1. 在安装之后，WebUI的界面会多出"ControlNet"的按钮。

![](../../../images/controlnet-5.webp)

2. 进入文生图的页面填入提示词，接着点开下面ControlNet的界面，勾选`Enabled`激活ControlNet，上传图片。勾选LowVRAM可降低VRAM占用。

![](../../../images/controlnet-6.webp)

3. 接着选取要使用的Preprocessor和Model，二者要一致。

Preprocessor是先将上传的图片处理过一轮，例如`Scribbles`会将彩色图片转成线稿。如果你的图片不需要处理，则Preprocessor可留空。

![](../../../images/controlnet-7.webp)

4. 以Scribbles为例，选取后点击右上角Generate即会生成出结果，并附上侦测到的线条。如下图所示，右边贞德的姿势确实跟左边的02十分类似。

![](../../../images/controlnet-8.webp)

