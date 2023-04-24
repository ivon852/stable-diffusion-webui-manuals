---
title: "手部模型 Depth map library and poser"
weight: 7
---

- 擴充功能來源：[jexom/sd-webui-depth-lib](https://github.com/jexom/sd-webui-depth-lib)

此擴充功能加入手部模型，可配合PoseX的骨架使用，改善AI手部畫不好的問題。

於Extensions頁面的Install from URL輸入以下網址安裝： `https://github.com/jexom/sd-webui-depth-lib`，重啟WebUI。

這裡示範搭配PoseX畫手的用法，請記得啟用Multi ControlNet。

1. 於文生圖頁面點開PoseX，設定`Target ControlNet number`為1，擺好骨架，並設定。然後點選Save PNG，得到一張png圖檔

![](../../images/cYQ21zT.webp)

2. 切換至Depth map library頁面，點選Add Background Image，上傳PoseX骨架的圖檔。

![](../../images/kI45Q4J.webp)

3. 再點選左邊各個手的模型，加到右邊的圖片，將二隻手擺出來。再點Send to Img2img。

![](../../images/80neOPH.webp)

4. 回到文生圖頁面，點開ControlNet，將0號ControlNet的preprocessor和model設定為Depth，Weights設定為0.5。

![](../../images/REgK9Gj.webp)

5. 再點選1號ControlNet，將model設定為OpenPose，Weights設定為0.5。

![](../../images/nvjQj43.webp)

6. 點選Generate生成，可看到圖片按照方才製作的手和骨架生成了。
