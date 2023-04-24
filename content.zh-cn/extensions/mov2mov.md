---
title: "AI绘图转视频 mov2mov"
weight: 7
---

- 扩展来源：[Scholar01/sd-webui-mov2mov](https://github.com/Scholar01/sd-webui-mov2mov)

＊需要先安装ControlNet才能使用这个扩展。

将视频逐一抽出帧，使用ControlNet生图，然后再自动合成新视频。可以设定输出的帧率，将人物单独处理。


1. 切换到mov2mov页面，输入提示词, 再上传视频。

![](../../../images/Screenshot_20230420_130951.webp)

2. 在下面设定输出视频的长宽。生图的长宽比例应与原始视频一致。

![](../../../images/Screenshot_20230420_131855.webp)

3. 最下面是单独用ControlNet处理人物的选项，可以改善动作侦测的精度。

![](../../../images/Screenshot_20230420_132520.webp)

4. 点选右上角Generate，即会开始生成。成品位于主程序下的`/outputs/mov2mov-images`目录。

![](../../../images/2023-04-20-14h30m36s877.webp)
