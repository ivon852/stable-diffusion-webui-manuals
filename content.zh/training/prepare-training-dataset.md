---
title: "4.2. 準備訓練資料"
weight: 2
---


# 1. 取得高品質圖片

訓練用的圖片最少最少要準備10張。重質不重量。因為我要訓練的是單一人物且風格固定，圖片不宜有複雜背景以及其他無關人物。

網路圖片一張一張右鍵下載當然可以，不過要大量下載圖片的話我會使用[Imgrd Grabber](https://ivonblog.com/posts/imgbrd-grabber-usage/)或[Hydrus Network](https://ivonblog.com/posts/setup-hydrus-network/)。

這裡我準備了33張Hara繪製的斯卡薩哈

![](/posts/stable-diffusion-webui-manuals/images/bqSn4Xp.avif)


# 2. 裁切圖片

下載圖片後，要將訓練圖片裁切成512x512像素。儘管SD WebUI可以自動批次裁切，但我們還是手動把圖片轉成512x512吧，免得重要的部分被裁掉。

1. 安裝自由軟體[GIMP](https://www.gimp.org/)，點選檔案→新增512x512像素的專案

![](/posts/stable-diffusion-webui-manuals/images/C2ScvyP.avif)

2. 點油漆桶將其漆成白色

![](/posts/stable-diffusion-webui-manuals/images/DsUDEu9.avif)

3. 將圖片拖曳進畫面，成為新的圖層

![](/posts/stable-diffusion-webui-manuals/images/cLqIlXa.avif)

4. 點選工具→變形工具→縮放，縮放圖片使其符合目前畫布大小，再按Enter。

![](/posts/stable-diffusion-webui-manuals/images/TAoINha.avif)

5. 點選檔案→Export，匯出成png。

![](/posts/stable-diffusion-webui-manuals/images/Lx95khX.avif)

6. 為加快後面圖片的處理速度，按右下角刪除目前圖層，再拖新的圖片進來，重複操作。

![](/posts/stable-diffusion-webui-manuals/images/fZ3D4Vb.avif)

7. 將33張Hara繪製的斯卡薩哈裁切後，統一放到名為`raw`的目錄。

![](/posts/stable-diffusion-webui-manuals/images/O5Tpz0f.avif)


# 3. 預先給圖片上提示詞

接著要給圖片預先上提示詞，這樣AI才知道要學習哪些提示詞。

1. 啟動SD WebUI，進入Train頁面。

2. 進入Preprocess，`Source`輸入裁切圖片的路徑，`Destination`填處理後圖片的路徑。

![](/posts/stable-diffusion-webui-manuals/images/YB1dJqc.avif)

3. 接著勾選`Create Flipped Copies`，建立翻轉圖片提升訓練數量。然後用Stable Diffusion訓練真實圖片的勾選`Use BLIP for caption`；訓練動漫人物改勾選`Use DeepBooru for caption`。

4. 點選Preprocess，約幾分鐘後便會處理完成。輸出的目錄裡面會含有每張圖片對應的提示詞txt檔。至此訓練資料準備完成。

![](/posts/stable-diffusion-webui-manuals/images/wNTq9uV.avif)

