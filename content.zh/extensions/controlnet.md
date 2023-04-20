---
title: "按照骨架動作繪圖 ControlNet"
weight: 5
---

- 擴充功能來源：[Mikubill/sd-webui-controlnet](https://github.com/Mikubill/sd-webui-controlnet)

ControlNet可以讓AI參考給定圖片的動作/線條/景深，再將圖片畫出來。跟內建的「圖生圖」技術比起來，ControlNet更能讓AI以你想要的動作下去繪圖；配合3D建模或骨架，也能緩解手腳、表情畫不好的問題。

# 安裝ControlNet與下載模型

1. 切換至Extensions頁面，點選`Install From URL`，URL輸入`https://github.com/Mikubill/sd-webui-controlnet.git`，按下Install，接著重啟WebUI。

2. 到[lllyasviel/ControlNet](https://huggingface.co/lllyasviel/ControlNet/tree/main/models)下載全部模型，將模型檔案放到Stable Diffusion WebUI資料夾下的`stable-diffusion-webui\extensions\sd-webui-controlnet\models`

![](/posts/stable-diffusion-webui-manuals/images/Bicm7hz.webp)


# 使用方式

1. WebUI的界面會多出ControlNet的按鈕。

![](/posts/stable-diffusion-webui-manuals/images/c84PFJJ.webp)

2. 進入圖生圖的頁面填入提示詞，並上傳圖片。接著點開下面ControlNet的界面，勾選`Enabled`啟用ControlNet，然後再次上傳圖片。勾選LowVRAM可降低VRAM佔用。

![](/posts/stable-diffusion-webui-manuals/images/QP2mKW6.webp)

3. 接著選取要使用的Preprocessor和Model，二者要一致。

Preprocessor是先將上傳的圖片處理過一輪，例如`Scribbles`會將彩色圖片轉成線稿。如果你的圖片不需要處理，則Preprocessor可留空。

`Canny`偵測圖片邊緣，`Scribbles`偵測線條，`Openpose`偵測動作，`Depth`偵測法線深度。

![](/posts/stable-diffusion-webui-manuals/images/lSOMjfP.webp)

4. 以Scribbles為例，選取後點選右上角Generate即會繪製出結果，並附上偵測到的線條。

![](/posts/stable-diffusion-webui-manuals/images/A3pecmu.webp)


## 啟用Multi ControlNet

預設是使用一個ControlNet，但是疊加多個有助於繪製更好的圖片。比方說同時使用Open Pose和Depth繪製人體，並防止手畫歪。

要啟用Multi ControlNet，請進入Settings設定數量。

<img src=/posts/stable-diffusion-webui-manuals/images/F9joNvd.webp alt=""  width=500 loading="lazy">
