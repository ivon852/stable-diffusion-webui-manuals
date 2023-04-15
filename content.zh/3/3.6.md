---
title: "骨架人偶 PoseX"
weight: 6
---

- 擴充功能來源：[hnmr293/posex](https://github.com/hnmr293/posex)

PoseX是可以在Stable Diffuison WebUI直接拉人物骨架，再配合ControlNet畫出姿勢的擴充功能。

類似的擴充功能為[OpenPose Editor](https://github.com/fkunn1326/openpose-editor)，差別在於PoseX可以旋轉放大。

＊需要先安裝ControlNet才能使用這個擴充功能。

1. 切換至Extensions頁面，點選Install From URL，URL輸入`https://github.com/hnmr293/posex.git`，按下Install。接著重啟WebUI。

<img src=/posts/stable-diffusion-webui-manuals/images/JO86Lmt.webp alt=""  width=500 loading="lazy">

2. 開啟文生圖的頁面，點選右下角PoseX，點選Send this image to ControlNet

<img src=/posts/stable-diffusion-webui-manuals/images/S9hRG7F.webp alt=""  width=500 loading="lazy">

3. 在下面的ControlNet，點選Enabled，preprocessor選取`none`，model選`openpose`，不需要上傳圖片。

<img src=/posts/stable-diffusion-webui-manuals/images/8xBVj5e.webp alt=""  width=500 loading="lazy">

4. 回到上面的PoseX，調整人物姿勢。左鍵點選移動，滾輪放大縮小，對模型左鍵點二下即可用右鍵移動單個骨架。

<img src=/posts/stable-diffusion-webui-manuals/images/Dy2Xpac.webp alt=""  width=500 loading="lazy">

5. 填入正負向提示詞，即會按照PoseX的姿勢來繪製圖片。

<img src=/posts/stable-diffusion-webui-manuals/images/iCILLPO.webp alt=""  width=500 loading="lazy">
