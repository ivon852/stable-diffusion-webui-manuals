---
title: "ControlNet 按照骨架動作繪圖"
weight: 3
---

- 擴充功能來源：[Mikubill/sd-webui-controlnet](https://github.com/Mikubill/sd-webui-controlnet)
- ControlNet的儲存庫：[lllyasviel/ControlNet](https://github.com/lllyasviel/ControlNet)

目前版本：ControlNet v1.1

ControlNet是通過加入額外條件來控制擴散模型的神經網路結構，它可以讓AI參考給定圖片的動作/線條/景深，更精準的生成圖片。

跟內建的「圖生圖」技術比起來，ControlNet的效果更好，能讓AI以指定動作生圖；再搭配3D建模作為輔助，能緩解單純用文生圖手腳、臉部表情畫不好的問題。

ControlNet的用法還有：上傳人體骨架線條，ControlNet就能按骨架的動作生成完稿的人物圖片。或是上傳素色的3D建模，讓ControlNet彩現成為室內佈置家具。

Lvmin Zhang是ControlNet原始程式的開發者，Mikubill則是開發擴充功能，讓我們可以在Stable Diffusion WebUI用ControlNet生圖。


# 1. 安裝ControlNet與下載模型

1. 切換至Extensions頁面，點選`Install From URL`，URL輸入`https://github.com/Mikubill/sd-webui-controlnet.git`，按下Install，接著從終端機按CTRL＋C，關閉Stable Diffusion WebUI。

2. 到[lllyasviel/ControlNet v1.1](https://huggingface.co/lllyasviel/ControlNet-v1-1/tree/main)下載以`.pth`結尾的模型檔，全部檔案加起來約18GB。`.yaml`檔不需要下載。目前v1.1是測試版，之後會合併回[主儲存庫](https://huggingface.co/lllyasviel/ControlNet)。

![](../../images/controlnet-1.webp)

3. 將這些模型檔放到`stable-diffusion-webui/extensions/sd-webui-controlnet/models`資料夾

4. 重新啟動Stable Diffusion WebUI。


# 2. 各個模型的用途

ControlNet現有以下模型。

## Anime Lineart

偵測線條，生成的圖片亦會保留原始的線條，適合處理動漫圖像

## Canny

偵測圖片邊緣，比較模糊，不如Scribbles完整。

## Depth

偵測輸入圖片的深度圖(depth map)。

## Illumination

偵測輸入圖片的光源與照明效果。

## Inpaint

功能類似「內補繪製」，使用50%隨機遮罩＋50%隨機光流遮罩訓練而成。

## Instruct Pix2Pix

模型檔名為`ip2p`，類似「圖生圖」，但是使用訓練50%的指示(instruction)提示詞和50%的敘述(description)提示詞訓練而成。因為是ControlNet，使用此模型時不需要調整CFG Scale。

根據原作者的說法，此模型在下「使其成為X」的提示詞所生成的圖，效果比「使Y成為X」要好。

> Also, it seems that instructions like "make it into X" works better than "make Y into X".

## Lineart

偵測線條，適合處理線稿，生成的圖片亦會保留原始的線條。

## M-LSD

偵測輸入圖片的直線。

## Normalbae

## Openpose

使用OpenPose技術偵測輸入圖片人物的動作，不一定會保留線條。

## Scribbles

偵測線條，偵測到的線條品質介於Soft Edge和Lineart之間。

## Segmentation

模型檔名為`seg`，將偵測的圖片物件切成一個一個色塊處理，例如房子一個色塊，後面的天空一個色塊。

## Shuffle

把輸入圖片的概念轉移到生成的圖片。

作者給的例子：輸入灰色裝甲圖片，生成的鋼鐵人盔甲也會是灰色的。

## Soft Edge

偵測圖片邊緣，效果較為柔和，像用炭筆塗過。

## Tile

輸入圖片，選取一個區域，使其變清晰的模型。


# 3. 參數解說

在安裝之後，WebUI的界面會多出"ControlNet"的按鈕。

![](../../images/controlnet-2.webp)

點開會看到以下選項：

## Single Image

上傳單張圖片。

## Batch

處理多張圖片。Input Directory填寫的是待處理的圖片所在路徑。

## Open New Canvas

清除圖片，開一張新畫布。

## 使用電腦鏡頭

在Open New Canvas的選項下面有四個按鈕。

![](../../images/controlnet-3.webp)

由左到右：新增畫布；使用電腦鏡頭拍照上傳；未知；還原上次算圖設定。

## Enable

在生圖時啟用ControlNet，必選。

## Low VRAM

生圖使用ControlNet會吃更多VRAM，此選項可降低VRAM使用量。

## Pixel Perfect

由ControlNet自動決定Preprocessor解析度。

## Allow Preview

允許預覽生圖結果，會顯示該模型偵測的線條或骨架。

## Preprocessor 預處理器

通常Preprocessor和Model二者要一致。

Preprocessor是先將上傳的圖片處理過一輪，例如`Scribbles`會將彩色圖片轉成線稿。若圖片的線條是白底黑線，且不是用WebUI畫布所繪製，則Preprocessor必須選取"Invert"。

如果你的圖片不需要處理，Preprocessor可留空。

## Model 模型

設定生圖的時候使用哪個ControlNet模型。

## Control Weight

ControlNet在生圖時的權重。

## Starting Control Step

要讓ControlNet開始參與生圖的步數。

## Ending Control Step

讓ControlNet結束參與生圖的步數。

## Preprocessor Resolution

預處理器的解析度。

如果不知道要設多少，請勾選"Pixel Perfect"讓ControlNet自動為您決定。

## Control Mode (Guess Mode)

控制生圖時，要AI平衡二者(Balanced)，或是偏重你的提示詞(My prompt is more important)，還是偏重ControlNet (ControlNet is more important)。

## [Loopback] Automatically send generated images to this ControlNet unit

自動將生成的圖片傳回此ControlNet運算單元(unit)。

是的，如果您的電腦VRAM夠大，您可以在Settings → ControlNet啟用多個ControlNet運算單元。

## Multi ControlNet

一個ControlNet效果不夠，您有沒有想過啟用第二、第三個ControlNet！？

預設安裝後只會使用一個ControlNet，但是疊加多個有助於生成更好的圖片。比方說同時使用Open Pose和Depth生成人體，並防止手畫歪。

要啟用Multi ControlNet，請進入Settings → ControlNet，拖動拉桿，設定要啟用的ControlNet數量。

<img src=../../images/controlnet-4.webp alt=""  width=500 loading="lazy">


# 4. 實際操作

此處以改繪一個人物姿勢為例子。

1. 在安裝之後，WebUI的界面會多出"ControlNet"的按鈕。

![](../../images/controlnet-5.webp)

2. 進入文生圖的頁面填入提示詞，接著點開下面ControlNet的界面，勾選`Enabled`啟用ControlNet，上傳圖片。勾選LowVRAM可降低VRAM佔用。

![](../../images/controlnet-6.webp)

3. 接著選取要使用的Preprocessor和Model，二者要一致。

Preprocessor是先將上傳的圖片處理過一輪，例如`Scribbles`會將彩色圖片轉成線稿。如果你的圖片不需要處理，則Preprocessor可留空。

![](../../images/controlnet-7.webp)

4. 以Scribbles為例，選取後點選右上角Generate即會生成出結果，並附上偵測到的線條。如下圖所示，右邊貞德的姿勢確實跟左邊的02十分類似。

![](../../images/controlnet-8.webp)

