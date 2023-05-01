---
title: "介绍"
weight: 1
---

在开始安装Stable Diffusion WebUI前，先来了解一下背景知识吧。

Stable Diffusion (稳定扩散) 是一个扩散模型，2022年8月由德国CompVis协同Stability AI和Runway发表论文，并推出相关程序。

同年，AUTOMATIC1111开发了图形化界面：「Stable Diffusion WebUI」，这是能用AI技术生成图片的开源软件，只要给定一组描述文本，AI就会开始绘图(准确的说是「算图」或「生图」)；亦能模仿现有的图片，生成另一张图片。甚至给它一部分涂黑的图片，AI也能按照你的意愿将图片填上适当的内容。除此之外还支持自行训练模型加强生图效果。

以下是一些Stable Diffusion WebUI生成的图像，无后期处理。

![一些Stable Diffusion WebUI生成的图像，无后制。](../../../images/introduction-1.webp)

![一些Stable Diffusion WebUI生成的图像，无后制。](../../../images/introduction-2.webp)

![一些Stable Diffusion WebUI生成的图像，无后制。](../../../images/introduction-3.webp)

因Stable Diffusion WebUI支持多系统又有很好的扩充性，便成为最多人使用的图形化程序。其图形界面是通过网页访问的，上手无难度，还有社群制作的界面中文化扩充功能。

与其他云端AI绘图软件Midjoruney、NovelAI、DALL-E相比，Stable Diffusion WebUI最大优点是可以免费在自己的电脑或服务器跑，且只要遵照[Creative ML OpenRAIL-M授权条款](https://github.com/CompVis/stable-diffusion/blob/main/LICENSE)的话，几无使用限制。因其开放原代码的特性，任何人都可以贡献代码，参与改进项目。

一开始Stable Diffusion WebUI支持的是x86架构，配备独立显卡的Linux和Windows电脑。不过AI绘图热门到让Apple公司亲自下场优化，于是macOS也可以跑Stable Diffusion WebUI了。只是用笔电跑的要小心，AI绘图会占用大量GPU资源，小心散热。

至2023年，Stable Diffusion WebUI已支持Linux/Windows/MacOS系统，以及Nvidia/AMD/Apple Silicon M的GPU。
