---
title: "2.2. 下載模型"
weight: 2
---

存檔點模型(checkpoint，勿跟LoRA搞混)是AI生圖的重要依據，算圖用的模型可以安裝很多個。

Stable Diffusion WebUI在初次啟動時，若放模型的資料夾(`models/Stable-diffusion`)為空，則會自動下載原始版的Stable Diffusion v1.5模型。

但是，不同人玩AI生圖有不同的需求，以寫實風格為主的Stable Diffusion模型可能無法滿足所有人。因此你可以先下載自己想要使用的模型。

這裡推薦一些不錯的模型。


# 1. 模型下載網站

目前找Stable Diffusion與其衍生模型的網站主要就二個。

第一個是[HuggingFace](https://huggingface.co/models?other=stable-diffusion)，中文俗稱抱臉笑，可以說是人工智慧界的Github。Stable Diffusion背後用到的很多AI工具，如Transformer、Tokenizers、Datasets都他們開發的，網站上也有豐富的教學文檔。

另一個是[Civitai](https://civitai.com/)，專門用來分享Stable Diffusion相關的資源，特色是模型都有示範縮圖，用戶也可以分享彼此使用的提示詞，以及分享作品。注意Civitai可能包含未成年不宜的圖像。


## 寫實風模型

說到萬模型之母，不得不提原始版的Stable Diffusion了，簡稱SD，是CompVis與合作團隊最初發表的模型，不斷更新中。

最初[Stable Diffusion v1](https://huggingface.co/runwayml/stable-diffusion-v1-5)是使用512x512像素的圖片訓練的，因此高於此尺寸的生圖品質會變差。後來[Stable Diffusion v2](https://huggingface.co/stabilityai/stable-diffusion-2-1)的訓練圖片寬高提昇到了768x768像素。

網路上很多模型都基於此模型訓練而來。適合畫真人、動物、自然、科技、建築的圖像，亦學習過歷史上許多畫家的畫風。

---

[Chilloutmix](https://civitai.com/models/6424/chilloutmix)：寫實風格的模型，適合畫出2.5次元，融合日韓真人與動漫風格的圖像。

[Deliberate](https://civitai.com/models/4823/deliberate)：基於SD-1.5模型，適合生成精緻寫實風格的人物、動物、自然風景。

[Realistic Vision v1.4](https://civitai.com/models/4201/realistic-vision-v13)：寫實風人物與動物模型。


## 動漫風模型

[Anything萬象熔爐 v4.5](https://huggingface.co/andite/anything-v4.0)適合畫動漫圖，作者宣稱不需要打一堆提示詞也能出漂亮的圖。

[Waifu Diffusion v1.4](https://huggingface.co/hakurei/waifu-diffusion-v1-4)是純粹使用Danbooru圖庫訓練而成，適合畫動漫圖。

[Hentai Diffusion](https://github.com/Delcos/Hentai-Diffusion)適合畫動漫圖，模型已使用大量負向提示詞訓練過以排除不良結果，另提供embeddings方便繪圖時使用。

[DreamShaper](https://civitai.com/models/4384/dreamshaper)是基於SD-1.5模型，生成精細動漫人物與油畫風格的模型。

[OrangeMix3](https://huggingface.co/WarriorMama777/OrangeMixs)，混合多種風格的動漫繪圖模型，偏寫實。


# 2. 如何下載模型

通常只需要下載模型檔即可。

HuggingFace為儲存庫 → Files and versions，選擇下載副檔名為`.ckpt`或`.safetensors`的模型。後者因不具備執行程式碼的能力因此較前者安全。至於`-pruned`代表模型有刪減過大小。

<img src=../../images/download-models-1.webp alt=""  width=500 loading="lazy">

Civitai則是點選Download按鈕下載模型。


如果要用指令下載，可以用wget或git，例如下載`Anything V4.5`的模型到`stable-diffusion-webui/models/Stable-diffusion`資料夾：
```bash
wget -nc -P stable-diffusion-webui/models/Stable-diffusion https://huggingface.co/andite/anything-v4.0/resolve/main/anything-v4.5-pruned.safetensors
```


## 3. 模型放置位置

不論是.ckpt還是.safetensors模型，都是在複製stable-diffusion-webui的儲存庫後，放到主程式資料夾下的`/models/Stable-diffusion`資料夾。
