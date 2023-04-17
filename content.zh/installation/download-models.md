---
title: "1.2. 下載模型"
weight: 2
---

存檔點模型(checkpoint，勿跟LoRA搞混)是AI算圖的重要依據，算圖用的模型可以安裝很多個。

Stable Diffusion WebUI在初次啟動時，若模型資料夾(`models`)為空，則會自動下載原始版的Stable Diffuson V2模型(`sd-v2-768-v-ema.ckpt`)。

但是，不同人玩AI繪圖有不同的需求，下載以寫實風格為主的Stable Diffusion模型可能無法滿足所有人。因此你可以先下載自己想要使用的模型。

這裡推薦一些Ivon綜合個人以及網路上的意見覺得不錯的模型。


# 模型下載網站

[HuggingFace](https://huggingface.co/)和[Civitai](https://civitai.com/tag/lora)有很多類別可以下載，看要畫真人還是動漫風格，至少需要下載一個模型。

通常只需要下載模型即可。點進下載模型的連結，選擇下載副檔名為`.ckpt`或`.safetensors`的模型。後者因不具備執行程式碼的能力因此較前者安全。

<img src=/posts/stable-diffusion-webui-manuals/images/RvclOoa.webp alt=""  width=500 loading="lazy">


# 寫實風模型

[Stable Diffusion v2.1](https://huggingface.co/stabilityai/stable-diffusion-2-1)，簡稱SD，是CompVis與合作團隊最初發表的模型，不斷更新中。網路上很多模型都基於此模型訓練而來。適合畫真人、動物、自然、科技、建築的圖像，亦學習過歷史上許多畫家的畫風。

[Chilloutmix](https://civitai.com/models/6424/chilloutmix)寫實風格的模型，適合畫出2.5次元，融合日韓真人與動漫風格的圖像。

[Deliberate](https://civitai.com/models/4823/deliberate)基於SD-1.5模型，適合繪製精緻寫實風格的人物、動物、自然風景。

[Realistic Vision v1.4](https://civitai.com/models/4201/realistic-vision-v13)，寫實風人物與動物模型。


# 動漫風模型

[Anything v4.5](https://huggingface.co/andite/anything-v4.0)適合畫動漫圖，作者宣稱不需要打一堆提示詞也能出漂亮的圖。

[Waifu Diffusion v1.4](https://huggingface.co/hakurei/waifu-diffusion-v1-4)是純粹使用Danbooru圖庫訓練而成，適合畫動漫圖。

[Hentai Diffusion](https://github.com/Delcos/Hentai-Diffusion)適合畫動漫圖，模型已使用大量負向提示詞訓練過以排除不良結果，另提供embeddings方便繪圖時使用。

[DreamShaper](https://civitai.com/models/4384/dreamshaper)是基於SD-1.5模型，繪製精細動漫人物與油畫風格的模型。

[OrangeMix3](https://huggingface.co/WarriorMama777/OrangeMixs)，混合多種風格的動漫繪圖模型，偏寫實。


