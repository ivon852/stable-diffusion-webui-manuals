---
title: "4.4. 訓練HyperNetwork"
weight: 4
---

比起學習概念的embedding，HyperNetwork(超網路)更適合讓AI學習圖片整體畫風。

HyperNetwork我是使用Anything當基礎模型來訓練。


# 1. 操作過程

1. 啟動SD WebUI

2. 切換至Train頁面，在`Create hypernetwork`輸入名字。`Number of vectors per token`設定7以上。點選`Create hypernetwork`。

![](/posts/stable-diffusion-webui-manuals/images/tnshVE0.avif)

3. 切換至Train頁面，選擇剛剛建立的hypernetwork，於`Dataset directory`輸入訓練資料的路徑。`Prompt template file`選hypernetwork.txt。

![](/posts/stable-diffusion-webui-manuals/images/mCq34WG.avif)

4. `Max Step`設定訓練至10000步停止。

![](/posts/stable-diffusion-webui-manuals/images/yst6sdF.avif)

5. 最後點選`Train HyperNetwork`，開始訓練。SD WebUI會顯示剩餘時間，HyperNetwork會比Embedding長一些。

6. 同樣可以到SD WebUI根目錄下的`texual_inversions/hypernetwork`查看訓練結果。裡面會有`images`目錄存放第幾步所訓練的成果。

![](/posts/stable-diffusion-webui-manuals/images/hb3WWs4.avif)

7. 待訓練完成後，至SD WeBUI根目錄下的`texual_Inversions/hypernetworks`，對照`images`目錄下的圖片挑選合適的成品。

<img src=/posts/stable-diffusion-webui-manuals/images/HPCNRlD.avif alt="" width=300>

8. 例如覺得9500步的不錯，就將pt檔放到SD WebUI根目錄下的`models/hypernetwork`。

![](/posts/stable-diffusion-webui-manuals/images/rmkIxpG.avif)


# 2. HyperNetwork模型使用方式

1. 於SD WebUI的繪圖界面，點選右上角`Show Extra Networks`

![](/posts/stable-diffusion-webui-manuals/images/lLGiqZ6.avif)

2. 接著選取要使用的Hypernetwork，點選將其加入提示詞欄位

![](/posts/stable-diffusion-webui-manuals/images/Cx5qWKp.avif)

3. 接著再使用訓練時候使用的提示詞，這樣算出來的圖便會有該HyperNetwork的人物了，並且畫風還原很佳。

![](/posts/stable-diffusion-webui-manuals/images/gERLA6M.avif)

