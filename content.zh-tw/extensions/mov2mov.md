---
title: "AI繪圖轉影片 mov2mov"
weight: 7
---

- 擴充功能來源：[Scholar01/sd-webui-mov2mov](https://github.com/Scholar01/sd-webui-mov2mov)

＊需要先安裝ControlNet才能使用這個擴充功能。

將影片逐一抽出畫格，使用ControlNet生圖，然後再自動合成新影片。可以設定輸出的畫格率，將人物單獨處理。


1. 切換到mov2mov頁面，輸入提示詞, 再上傳影片。

![](../../images/Screenshot_20230420_130951.webp)

2. 在下面設定輸出影片的長寬。生圖的長寬比例應與原始影片一致。

![](../../images/Screenshot_20230420_131855.webp)

3. 最下面是單獨用ControlNet處理人物的選項，可以改善動作偵測的精度。

![](../../images/Screenshot_20230420_132520.webp)

4. 點選右上角Generate，即會開始生成。成品位於主程式下的`/outputs/mov2mov-images`目錄。

![](../../images/2023-04-20-14h30m36s877.webp)
