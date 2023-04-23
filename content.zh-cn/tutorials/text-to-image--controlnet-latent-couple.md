---
title: "用文生图 ＋ ControlNet ＋ Latent Couple绘制指定位置的多个人物"
weight: 8
---

请先阅读[文生图用法](../features/text-to-image/)，并安装[ControlNet](../extensions/controlnet/)、[Latent Couple](../extensions/latent-couple/)、[PoseX](../extensions/posex/)扩充功能。

1. 于文生图的界面会看到Latent Couple

![](../../../images/o0hDolt.webp)

2. 勾选Enabled启用，设定长宽，再点选最下面的`Create blank canvas`建立空白画布

![](../../../images/MxZcaDu.webp)

3. 用鼠标绘制色块。例如用红笔绘制一个人物，蓝笔绘制另一个人物。

![](../../../images/1AeIBQm.webp)

4. 点选`I've finished my sketch`，下面就会显示各个色块的分割状况。依序填入提示词：在`General Prompt`填入画风和背景的提示词，蓝笔部份填入贞德`Jeanne d'Arc`相关的提示词，红笔部份填入阿比盖儿`Abigail Williams`的相关提示词

![](../../../images/7Mp06u7.webp)

5. 点选`Prompt Info Update`，提示词即会自动跑到上面的框框，再自行补上负向提示词。

![](../../../images/4w0YBc8.webp)

6. 搭配事先用PoseX拉好的骨架，再点选Generate开始绘图。

![](../../../images/bm9qPcV.png)
