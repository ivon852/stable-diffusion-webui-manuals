---
title: "訓練Embedding"
weight: 3
---

Textual Inversion(文本倒置)，又稱Embedding(嵌入)，適合讓AI學習一個新的概念/物體。畫風相較於HyperNetwork學習能力較差。

Anything這類基於NovelAI製作的模型不適合拿來練Embedding，成品會很詭異。從頭開始訓練的Waifu Diffusion或Stable Diffusion比較適合訓練Embedding，因此這裡使用的基礎模型為Waifu Diffusion 1.4。


# 1. 操作過程

1. 啟動SD WebUI

2. 切換至Train頁面，在`Create embedding`輸入名字。`Number of vectors per token`設定7以上。點選`Create embedding`。

![](../../images/embedding-1.webp)

3. 切換至Train頁面，選擇剛剛建立的embedding，於`Dataset directory`輸入訓練資料的路徑

![](../../images/embedding-2.webp)

4. `Prompt template file`選style_filewords.txt。`Mx Step`設定訓練至10000步停止。當然你也可以調高一點，並看預覽圖決定品質差不多之後才按Interrupt中止訓練，究竟要多少步數不得而知。

![](../../images/embedding-3.webp)

5. 點選`Train Embedding`，開始訓練。

6. SD WebUI應會顯示剩餘時間，通常是一小時起跳，每500步會在右邊顯示訓練該步數的成果。

7. 你也可以到SD WenUI根目錄下的`texual_inversions`查看訓練成果。裡面`image_embeddings`目錄會存放第幾步所訓練的成果。

![](../../images/embedding-4.webp)

8. 待訓練完成後，至SD WenUI根目錄下的`texual_inversions/embeddings`，對照`image_embeddings`目錄的圖片挑選合適的成品。

![](../../images/embedding-5.webp)

9. 例如覺得9500步的不錯，那就將該pt檔從裡面挑出，將其放到SD WebUI程式目錄下的`embeddings`。

![](../../images/embedding-6.webp)


# 2. Embedding模型使用方式

1. 於SD WebUI的生圖界面，點選右上角`Show Extra Networks`

![](../../images/embedding-7.webp)

2. 接著選取要使用的embedding，點選將其加入提示詞欄位。Embedding只能配合訓練時使用的模型來算圖。

![](../../images/embedding-8.webp)

3. 然後按照Embedding訓練時使用的提示詞下提示詞，這樣算出來的圖便會有該Embedding的人物了。

![](../../images/embedding-9.webp)
