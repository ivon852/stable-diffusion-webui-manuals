---
title: "骨架人偶 PoseX"
weight: 6
---

- 擴充功能來源：[hnmr293/posex](https://github.com/hnmr293/posex)

＊需要先安裝ControlNet才能使用這個擴充功能。

PoseX是可以在Stable Diffuison WebUI直接拉人物骨架，再配合ControlNet生成姿勢的擴充功能。

類似的擴充功能為[OpenPose Editor](https://github.com/fkunn1326/openpose-editor)，差別在於PoseX可以旋轉放大。

1. 切換至Extensions頁面，點選Install From URL，URL輸入`https://github.com/hnmr293/posex.git`，按下Install。接著重啟WebUI。

![](../../images/posex-1.webp)

2. 開啟文生圖的頁面，點選右下角PoseX，點選Send this image to ControlNet

![](../../images/posex-2.webp)

3. 在下面的ControlNet，點選Enabled，preprocessor選取`none`，model選`openpose`，不需要上傳圖片。

![](../../images/posex-3.webp)

4. 回到上面的PoseX，調整人物姿勢。左鍵點選移動，滾輪放大縮小，對模型左鍵點二下即可用右鍵移動單個骨架。

![](../../images/posex-4.webp)

5. 填入正負向提示詞，即會按照PoseX的姿勢來生成圖片。

![](../../images/posex-5.webp)
