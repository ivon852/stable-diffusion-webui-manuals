---
title: "提示詞快速入門"
weight: 1
---

這節教學Stable Diffusion的提示詞(prompt)寫法，並附上範例。

![](../../images/general-prompt-guide-1.webp)

非AUTOMATIC1111開發的Stable Diffusion也可以參考此教學，但要注意哪些是AUTOMATIC1111版獨有的語法。

我們來看提示詞要怎麼寫，以文生圖模式的提示詞為主。若要邊看邊練習的話，可以搭配[文生圖用法](../features/text-to-image)操作。

不論用哪個模式生圖，Stable Diffusion都是吃「正向」與「負向」提示詞 (prompt，通俗的講法叫關鍵字、咒語、指令)，並且要用英文輸入。

你會在Stable Diffusion WebUI看到以下框框：

![](../../images/general-prompt-guide-2.webp)

第一個框框是提示詞 (Prompt) 告訴AI要生成哪些東西。第二個框框是負向提示詞 (Negative prompt) 告訴AI不要生成哪些東西。

首先要注意的是，AI生圖目前還沒有涵蓋全宇宙所有圖片的模型，所以除了提示詞外，使用的生圖模型亦會大大的影響生成結果。

譬如，用寫實風格的`Stable Diffusion`模型畫動漫人物，效果絕對會比使用`Anything`差的許多；又或者，想畫出宛如真人coser的圖，用`ChilloutMix`鐵定比用只強調寫實的`RealisticVision`要來的合適。因此在學會下提示詞以前，要先按照用途挑選適合的模型。


# 1. 提示詞 Prompts

這一節使用HD-v22的模型做示範，因此生成出來都會是動漫風格。

1. 下提示詞時，利用人事時地物的概念，寫個英文句子描述圖內場景，盡量將想看到的提示詞排在前面。例如在提示詞的欄位填入「一個亞洲女孩在沙灘上」，負向提示詞留空
```lisp
an asian girl on the beach
```

結果如下

![](../../images/example1.png)

2. 不過英文不好的人其實不用寫整個句子，用單字加逗號將想看的特徵點出來通常就有不錯效果。且實務上我們會希望測試更多參數，例如加入畫風、要模仿的藝術家風格、身體特徵等，因此用逗號更方便調整。將圖片特徵拆成單字就會變成下面這樣：
```lisp
; (繪圖時請刪除此行) 參考翻譯：一個女孩，亞洲人，沙灘，海洋
1girl, asian, beach, ocean
```

再算一次，但是結果變了？沒錯，即使提示詞相近，AI繪圖每次生圖結果都是隨機的。要維持上一次的結果並微調，你得保留每次算圖的種子碼(Seed，SD WebUI界面左下角，亦會寫在檔名上)。

![](../../images/example2.png)

3. 接著可以多指定一點細節：這個女孩眼睛是什麼顏色的？髮型是什麼？有戴帽子嗎？是站著還是坐著呢？身上穿的是什麼衣服？天空是什麼顏色的？
```lisp
; 參考翻譯：一個女孩，亞洲人，藍眼睛，短髮，草帽，站著，藍色比基尼，沙灘，海洋，橘色天空
1girl, asian, blue eyes, short hair, straw hat, standing, blue bikini, beach, ocean, orange sky
```

![](../../images/example3.png)

呼，好像一口氣加太多細節了呢，詳述細節的好處是避免AI亂生成，但也限制了其作畫創意。所以下面的例子會縮短，有時候讓AI隨機抽獎也不壞呀～


4. 要改變風格，可以在提示詞加入「風格」的提示詞。這方面的提示詞有：相片(photoshop)、3D建模(3d model)、裝飾藝術(art deco)、石像(stone sculpture)等風格。
```lisp
; 參考翻譯：一個女孩的石像，亞洲人，藍眼睛，沙灘，海洋
a stone sculpture of 1girl, asian, blue eyes, beach, ocean
```

![](../../images/example4.png)

但我使用的模型已是專攻動漫風格的模型，所以不用特別指定要畫出哪種風格，它一律都會是動漫風的圖片，很難畫出真人照片，所以說挑對模型很重要啊。


5. 風格是很難界定的東西呢，一般來說我們會圖片像哪個藝術家的風格對吧？那麼不如直接「召喚」他們吧！提示詞可以包含某位畫家的名字，AI會嘗試模仿其風格。例如加上「慕夏的作品」，並加入「大師級作品」的風格提示詞：
```lisp
; 參考翻譯：慕夏的作品，大師級作品，一個女孩，亞洲人，藍眼睛，沙灘，海洋
artwork by Alfons Maria Mucha, masterpiece, 1girl, asian, blue eyes, beach, ocean
```

生圖的結果就會變得像是慕夏的作品。順帶一提`masterpiece`這個提示詞還蠻萬用的，可以讓作品維持一定水準。

![](../../images/example5.png)

6. 當然還可以畫特定動漫人物的「二創」，只要將名字和作品名稱打上去就可以了。有名的動漫角色只要出現名字，不用特別指定身體特徵就會生成原作風格了，例如指定《新世紀福音戰士》的惣流·明日香·蘭格雷：
```lisp
; 參考翻譯：新世紀福音戰士的明日香，大師級作品，一個女孩，沙灘，海洋
asuka_langley_souryuu from neon_genesis_evangelion, masterpiece, 1girl, beach, ocean
```

![](../../images/example6.png)


再次提醒，在下提示詞的時候，生成圖片使用的模型也需納入考量。譬如想要生成特定動漫人物，去Danbooru找到了英文姓名，加上提示詞，但你卻用畫真人的Stable Diffusion去算，則AI可能根本就不會認得你說的角色是誰，反之亦然。Danbooru的標籤風格跟一般圖片的描述還是有差距的。

除非日後有蒐羅全部網路圖片的超大模型出現，否則下提示詞須配合模型種類來決定。

如果AI怎樣都生成不出你要的風格或人物，請考慮換個模型，或是[自行訓練模型](../training/)。


# 2. 負向提示詞 Negative Prompts

上面的例子，我們只有寫提示詞，但下面的負向提示詞的欄位都是空白。但生圖時常常還需要加入一些負向提示詞，避免掉不好的結果。AI繪圖有時不會一次就算出好結果，所以還需要加上負向提示詞來控制，尤其是大批算圖的時候更為重要。

1. 負向提示詞會加入一些常見的「不好」的圖片特徵，例如低畫質、最糟品質、畫家簽名、模糊、浮水印
```lisp
deformed, lowres, bad anatomy, text, error, extra digit, fewer digits, cropped, worst quality, low quality, normal quality, jpeg artifacts, signature, watermark, username, blurry, artist name
```

2. 不想看到的東西也可以加進去。例如不想看到裸露、兵器、血、獵奇的元素出現，就加入`nsfw`、`weapon`、`blood`、`guro`至負向提示詞
```lisp
nsfw, weapon, blood, guro, lowres, bad anatomy, text, error, extra digit, fewer digits, cropped, worst quality, low quality, normal quality, jpeg artifacts,signature, watermark, username, blurry, artist name
```

提示詞並非越多越好，正向提示詞以不超過150個詞元(token)為原則；不過負向提示詞可以盡量把不想看到的都塞進去。


# 3. Stable Diffusion WebUI獨有語法

此節列出的語法為AUTOMATIC1111製作的SD WebUI獨有，使用其他人製作的Stable Diffusion程式不見得適用。


##  關注度括號 Attention/emphasis

控制關注度的符號，增加算圖時對該提示詞的關注度(attention)。簡單來說，括號就是你想強調的重點元素，括號越多，生成的結果越會符合括號裡的提示詞。

SD WebUI使用小括號控制關注度： `( )` 小括號層次越多權重越高(不加小括號為1倍，每加一層小括號乘以1.1倍)。例如，強調「藍眼睛」，生成的結果就更高機率是藍眼睛人物
```lisp
asian, woman, ((blue eyes)), beach, ocean
```

亦可以直接寫明要增強幾倍關注度，但其實一般情況下不用設太強，用一二層的小括號就夠了。
```lisp
asian, woman, (blue eyes:2.5), beach, ocean
```

SD WebUI還支援`[ ]`中括號，越多權重越弱(乘以1.1倍)，通常用在負向提示詞欄位。

＊給用過NovelAI的使用者：SD WebUI的小括號`( )`效果等價於NovelAI的大括號`{ }`，都是增加對該提示詞的關注度。


## 提示詞編輯 Prompt editing

指定在到哪一步數的時候切換提示詞。此處的中括號跟權重無關。

語法為`[提示詞1:提示詞2:要切換的步數]`

例如，算圖時設定20步，一開始算橘子，設定算到15步時切換成蘋果
```lisp
[orange : apple : 15] on table
```


## 切換單字 Alternating Words

使用` | `代表在每個步數切換提示詞，例如我要在算圖時於「藍眼睛」或「紅眼睛」或「黑眼睛」之間切換
```lisp
asian, woman, [blue eyes|red eyes|black eyes], beach, ocean
```


## 可組合性擴散 Composable Diffusion

此語法讓AI依照權重生成二個不同的物件。

例如生成橘子與蘋果，中間用大寫的`AND`連接
```lisp
orange AND apple
```

後面加上數字控制權重，初始值為1，數值低於0.1則無效。
```lisp
orange :1.5 AND apple :2.5
```

此語法適合搭配[ControlNet和Latent Couple](../extensions/latent-couple/)，可以準確控制圖中物件的位置。


# 4. 提示詞範例

這裡提供一些懶人包。負向提示詞有些是通用的。


## 生成可愛的狗勾

讓我們試著畫幾隻柯基犬在草地上奔跑。

建議使用模型：Stable Diffusion、Realistic Vision

提示詞
```lisp
3 corgi dogs running on grass field
```

負向提示詞
```lisp
lowres, bad anatomy, text, error, extra digit, fewer digits, cropped, worst quality, low quality, normal quality, jpeg artifacts,signature, watermark, username, blurry, artist name
```

![](../../images/example-dog.png)


## 生成高科技未來城市

建議使用模型：Stable Diffusion、Realistic Vision

提示詞
```lisp
city future, 8k, exploration, cinematic, realistic, unreal engine, hyper detailed, volumetric light, moody cinematic epic concept art, realistic matte painting, hyper photorealistic
```

負向提示詞
```lisp
lowres, bad anatomy, text, error, extra digit, fewer digits, cropped, worst quality, low quality, normal quality, jpeg artifacts,signature, watermark, username, blurry, artist name
```

![](../../images/example-city.png)


## 生成一台特斯拉車子

建議使用模型：Stable Diffusion、Realistic Vision

提示詞
```lisp
concept art,tesla car, aerodynamic, future
```

負向提示詞
```lisp
lowres, bad anatomy, text, error, extra digit, fewer digits, cropped, worst quality, low quality, normal quality, jpeg artifacts,signature, watermark, username, blurry, artist name
```

![](../../images/example-car.png)


## 生成動漫美少女

建議使用模型：Anything、Hentai Diffusion

隨機畫一個Fate/Grand Order的貞德

提示詞
```lisp
jeanne d'arc from fate grand order, 1girl, (best quality), (masterpiece), (high detail), ((full face)), sharp, ((looking at viewer)), ((detailed pupils)), (thick thighs), (((full body))), (large breasts)
```

負向提示詞
```lisp
lowres, bad anatomy, bad hands, text, error, missing fingers, extra digit, fewer digits, cropped, worst quality, low quality, normal quality, jpeg artifacts,signature, watermark, username, blurry, artist name
```

![](../../images/example-anime.png)


## 生成日韓風真人女孩

建議使用模型：ChilloutMix、Perfect World，並適時使用Japanese Doll的LoRA。

隨機畫一個日本女孩，不要色色

提示詞
```lisp
(a japanese woman), shiny skin, (ultra high res,photorealistic,realistic,best quality,photo-realistic), (((high detailed skin,visible pores))),(real person,photograph), (8k, raw photo, best quality, masterpiece),(1girl),photon mapping, radiosity, physically-based rendering,automatic white balance,(haunting smile,moist lips),watery eyes, (blush|cute and playful|adorable|thick bangs|beauty),((irises and pupils are rounded,the pupil reflects the surroundings,eyes are not the same size))
```

負向提示詞
```lisp
nude, lowres,blurry,simple background,jpeg artifacts,bad-artist,bad shadow,compressed image,low pixel,light spot, paintings,sketches,((monochrome)),((grayscale)),noise point,semi-realistic, 3d,render,cg,drawing,cartoon,anime,comic,username,watermark,signature,cropped,error,censored,text,stain, deformed iris,deformed pupils,deformed nail,deformed ear,deformed eye,deformed eyelid,collapsed eyeshadow, [excessive skin spots,excessive skin imperfections,skin blemishes,skin fold,rough skinstain skin],goosebumps,skin layering,axillary fold,facial contortion, (flawless face),trimming
```

![](../../images/example-girl.png)


# 5. 值得參考的提示詞網站


若使用的是SD模型，想生成真人，請看[Voldy](https://rentry.org/artists_sd-v1-4)整理的歷史上有名的藝術家。

若使用動漫風的模型請看[Danbooru](https://danbooru.donmai.us)圖庫的標籤決定要下哪些提示詞。

[Prompt Generator](https://promptomania.com/stable-diffusion-prompt-builder/)和[NovelAI魔导书](https://thereisnospon.github.io/NovelAiTag/)可以協助你組合提示詞。

[Civitai](https://civitai.com)除了下載模型外，還有很多現成的提示詞搭配模型的範例可以照抄。

