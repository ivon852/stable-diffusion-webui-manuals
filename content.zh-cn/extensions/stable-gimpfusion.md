---
title: "修图软体GIMP整合 Stable-Gimpfusion"
weight: 9
---

- 扩充功能来源：[ArtBIT/stable-gimpfusion](https://github.com/ArtBIT/stable-gimpfusion)

ArtBIT开发的Stable-Gimpfusion能让你在GIMP修图时的图层调用Stable Diffusion填充内容，支援文生图、图生图、ControlNet。

类似的扩充功能有[blueturtleai/gimp-stable-diffusion](https://github.com/blueturtleai/gimp-stable-diffusion)，支援不规则选取区，还可以调用志愿者经营的stable-horde伺服器来绘图。但是它不支援SD WebUI。

1. 编辑SD WebUI的启动引数，加入`--api`引数，再启动SD WebUI。网页界面可以不用开启。

2. 安装自由软体[GIMP](https://www.gimp.org/)

3. 下载[stable_gimpfusion.py](https://raw.githubusercontent.com/ArtBIT/stable-gimpfusion/main/stable_gimpfusion.py)，放到GIMP的扩充功能资料夹 (Linux为`$HOME/.gimp-2.10/plug-ins/`并赋予执行权限，Windows为`C:\Users\{your_id}\AppData\Roaming\GIMP\2.10\plug-ins\`)

4. 开启GIMP，开启图片。

5. 点选右上角的Gimpfusion，点选要使用文生图(text to image)还是图生图(image to image)

![](../../../images/stable-gimpfusion-1.webp)

6. 输入提示词，Stable Diffusion就会开始生图

![](../../../images/stable-gimpfusion-2.webp)

7. 进度条可从终端机查看，之后结果会新增至GIMP的图层。目前此扩充功能只支援填充整个图层。

![](../../../images/Screenshot_20230330_151918.webp)
