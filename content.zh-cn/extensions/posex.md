---
title: "骨架人偶 PoseX"
weight: 6
---

- 扩充功能来源：[hnmr293/posex](https://github.com/hnmr293/posex)

＊需要先安装ControlNet才能使用这个扩充功能。

PoseX是可以在Stable Diffuison WebUI直接拉人物骨架，再配合ControlNet画出姿势的扩充功能。

类似的扩充功能为[OpenPose Editor](https://github.com/fkunn1326/openpose-editor)，差别在于PoseX可以旋转放大。

1. 切换至Extensions页面，点选Install From URL，URL输入`https://github.com/hnmr293/posex.git`，按下Install。接着重启WebUI。

![](../../../images/JO86Lmt.webp)

2. 开启文生图的页面，点选右下角PoseX，点选Send this image to ControlNet

![](../../../images/S9hRG7F.webp)

3. 在下面的ControlNet，点选Enabled，preprocessor选取`none`，model选`openpose`，不需要上传图片。

![](../../../images/8xBVj5e.webp)

4. 回到上面的PoseX，调整人物姿势。左键点选移动，滚轮放大缩小，对模型左键点二下即可用右键移动单个骨架。

![](../../../images/Dy2Xpac.webp)

5. 填入正负向提示词，即会按照PoseX的姿势来绘制图片。

![](../../../images/iCILLPO.webp)
