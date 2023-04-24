---
title: "按照骨架动作绘图 ControlNet"
weight: 3
---

- 扩展来源：[Mikubill/sd-webui-controlnet](https://github.com/Mikubill/sd-webui-controlnet)

ControlNet是通过加入额外条件来控制扩散模型的神经网络结构。它可以让AI参考给定图片的动作/线条/景深，精准的生成图片。例如，上传一张人体骨架，ControlNet就能按照骨架的动作生成完稿的人物图片。

跟内建的「图生图」技术比起来，ControlNet的效果更好，能让AI以指定动作下去生图；再搭配3D建模作为辅助，能缓解单纯用文生图功能下手脚、脸部表情画不好的问题。


# 各个模型的用途

ControlNet会用到各种模型，每个模型有对应的用途，不需要全部下载。

`Canny`侦测图片边缘

`Scribbles`侦测线条

`Openpose`侦测动作

`Depth`侦测法线深度


# 安装ControlNet与下载模型

1. 切换至Extensions页面，点选`Install From URL`，URL输入`https://github.com/Mikubill/sd-webui-controlnet.git`，按下Install，接着重启WebUI。

2. 到[lllyasviel/ControlNet](https://huggingface.co/lllyasviel/ControlNet/tree/main/models)下载需要的模型，或者全部下载。将模型文件放到Stable Diffusion WebUI文件夹下的`stable-diffusion-webui/extensions/sd-webui-controlnet/models`

![](../../../images/Bicm7hz.webp)


<!--#参数解说-->


# 实际操作

1. 在安装之后，WebUI的界面会多出ControlNet的按钮。

![](../../../images/c84PFJJ.webp)

2. 进入图生图的页面填入提示词，并上传图片。接着点开下面ControlNet的界面，勾选`Enabled`启用ControlNet，然后再次上传图片。勾选LowVRAM可降低VRAM占用。

![](../../../images/QP2mKW6.webp)

3. 接着选取要使用的Preprocessor和Model，二者要一致。

Preprocessor是先将上传的图片处理过一轮，例如`Scribbles`会将彩色图片转成线稿。如果你的图片不需要处理，则Preprocessor可留空。

`Canny`侦测图片边缘，`Scribbles`侦测线条，`Openpose`侦测动作，`Depth`侦测法线深度。

![](../../../images/lSOMjfP.webp)

4. 以Scribbles为例，选取后点选右上角Generate即会生成出结果，并附上侦测到的线条。

![](../../../images/A3pecmu.webp)


# 启用Multi ControlNet

预设是使用一个ControlNet，但是叠加多个有助于生成更好的图片。比方说同时使用Open Pose和Depth生成人体，并防止手画歪。

要启用Multi ControlNet，请进入Settings页面设定要启用的ControlNet数量。

<img src=../../../images/F9joNvd.webp alt=""  width=500 loading="lazy">
