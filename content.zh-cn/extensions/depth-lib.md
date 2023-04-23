---
title: "手部模型 Depth map library and poser"
weight: 7
---

- 扩充功能来源：[jexom/sd-webui-depth-lib](https://github.com/jexom/sd-webui-depth-lib)

此扩充功能加入手部模型，可配合PoseX的骨架使用，改善AI手部画不好的问题。

于Extensions页面的Install from URL输入以下网址安装： `https://github.com/jexom/sd-webui-depth-lib`，重启WebUI。

这里示范搭配PoseX画手的用法，请记得启用Multi ControlNet。

1. 于文生图页面点开PoseX，设定`Target ControlNet number`为1，摆好骨架，并设定。然后点选Save PNG，得到一张png图档

![](../../../images/cYQ21zT.webp)

2. 切换至Depth map library页面，点选Add Background Image，上传PoseX骨架的图档。

![](../../../images/kI45Q4J.webp)

3. 再点选左边各个手的模型，加到右边的图片，将二只手摆出来。再点Send to Img2img。

![](../../../images/80neOPH.webp)

4. 回到文生图页面，点开ControlNet，将0号ControlNet的preprocessor和model设定为Depth，Weights设定为0.5。

![](../../../images/REgK9Gj.webp)

5. 再点选1号ControlNet，将model设定为OpenPose，Weights设定为0.5。

![](../../../images/nvjQj43.webp)

6. 点选Generate绘制，可看到图片按照方才制作的手和骨架绘制了。
