---
title: "2.5. 額外網路 Extra Networks"
weight: 5
---

除了根據需求切換ckpt模型外，也可以額外疊幾層網路(Extra networks)小模型來改善畫風，並改善生成特定物件、角色的準確度。

例如使用Anything模型生圖，再搭配"Taiwan-doll-likeness LoRA"就能轉成真人風格而不用依賴許多提示詞，並且可以一次疊很多個，就像套多層濾鏡一般。

![](../../images/GJ7CJT5.webp)

跟ckpt大模型比起來，這類模型檔案都很小，主要用來微調現有的模型。小模型有嵌入(Embedding)、超網路(HyperNetwork)、LoRA三種，副檔名以`.pt`或`.safetensors`結尾，目前最熱門的為"LoRA"。更棒的是因為檔案小，自行[訓練喜歡的人物模型](../training/)成本並不高。


# 安裝小模型

[Civitai](https://civitai.com/tag/lora)有很多小模型可以下載。下載時需注意模型是哪一種。

Embedding請放`stable-diffusion-webui`資料夾下的`embeddings`

HyperNetwork放到`stable-diffusion-webui\models\hypernetworks`。

LoRA放到`stable-diffusion-webui\models\Lora`。

如果要顯示小模型縮圖，將圖片取跟該模型一樣的檔名，並放到該模型的資料夾。例如在`Taiwan-doll-likeness.safetensors`所在的資料夾放一張`Taiwan-doll-likeness.png`。


# 小模型使用方法

1. 進入WebUI，點選右上角Show extra networks

![](../../images/MaaUngp.webp)

2. 這樣就會出現選單。以LoRA為例，點選小模型的卡片便會將其加到提示詞欄位，提示詞欄位會出現`< >`，表示要在繪圖時使用LoRA。

![](../../images/GCgN6JA.webp)

3. 接著再加上其他提示詞，生圖即會有使用LoRA的風格。

![](../../images/vKKJAST.webp)

4. 如果生出來的圖片太詭異，調整提示詞欄位每個LoRA後面的數字，控制權重。

![](../../images/F371fSN.webp)

5. 嗯，這樣看起來好些了 (並沒有)

![](../../images/VLBuSMp.webp)


# 使用VAE

VAE (variational autoencoder)可以讓算出來的圖片色彩更漂亮。有些存檔點模型內建VAE，SD WebUI在生圖時會自動偵測。

如果要使用VAE，下載模型後，將其放到`stable-diffusion-webui\models\VAE`資料夾。

接著點選Settings → Stabe Diffusion → SD VAE，選取要使用的VAE，再點選Apply Settings，此後生圖就會一律使用指定的VAE。


