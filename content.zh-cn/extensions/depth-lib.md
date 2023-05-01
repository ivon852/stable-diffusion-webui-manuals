---
title: "手部模型 Depth map library and poser"
weight: 7
---

- 扩充功能来源：[jexom/sd-webui-depth-lib](https://github.com/jexom/sd-webui-depth-lib)

此扩充功能加入手部模型，可配合PoseX的骨架使用，改善AI手部画不好的问题。

于Extensions页面的Install from URL输入以下网址安装： `https://github.com/jexom/sd-webui-depth-lib`，重启WebUI。

这里示范搭配PoseX画手的用法，请记得激活Multi ControlNet。

1. 于文生图页面点开PoseX，设置`Target ControlNet number`为1，摆好骨架，并设置。然后点击Save PNG，得到一张png图档

![](../../../images/depth-lib-1.webp)

2. 切换至Depth map library页面，点击Add Background Image，上传PoseX骨架的图档。

![](../../../images/depth-lib-2.webp)

3. 再点击左边各个手的模型，加到右边的图片，将二只手摆出来。再点Send to Img2img。

![](../../../images/depth-lib-3.webp)

4. 回到文生图页面，点开ControlNet，将0号ControlNet的preprocessor和model设置为Depth，Weights设置为0.5。

![](../../../images/depth-lib-4.webp)

5. 再点击1号ControlNet，将model设置为OpenPose，Weights设置为0.5。

![](../../../images/depth-lib-5.webp)

6. 点击Generate生成，可看到图片按照方才制作的手和骨架生成了。
