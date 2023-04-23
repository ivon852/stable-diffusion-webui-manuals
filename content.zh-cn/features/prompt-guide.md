---
title: "2.1. 提示词(Prompt)写法与示例"
weight: 1
---

这节Ivon将教学Stable Diffusion的提示词(prompt)写法，并附上示例。

![](../../../images/title-2.1.webp)

非ATOMATIC1111开发的Stable Diffusion也可以参考此教程，但要注意哪些是ATOMATIC1111版独有的语法。

我们来看提示词要怎么写，以文生图模式的提示词为主。若要边看边练习的话，可以搭配[文生图用法](../features/text-to-image)操作。

不论用哪个模式绘图，Stable Diffusion都是吃「正向」与「负向」提示词 (prompt，通俗的讲法叫关键字、咒语)，并且要用英文输入。

你会在Stable Diffusion WebUI看到以下框框：

![](../../../images/AAG54w1.webp)

第一个框框是提示词 (Prompt) 告诉AI要画哪些东西。第二个框框是负向提示词 (Negative prompt) 告诉AI不要画哪些东西。

首先要注意的是，AI绘图目前还没有涵盖全宇宙所有图片的模型，所以除了提示词外，使用的生图模型亦会大大的影响绘制结果。

譬如，用写实风格的`Stable Diffusion`模型画二次元人物，效果绝对会比使用`Anything`差的许多；又或者，想画出宛如真人coser的图，用`ChilloutMix`铁定比用只强调写实的`RealisticVision`要来的合适。因此在学会下提示词以前，要先按照用途挑选适合的模型。


# 1.  提示词 Prompts

这一节Ivon使用HD-v22的模型做示范，因此绘制出来都会是动漫风格。

1. 下提示词时，利用人事时地物的概念，写个英文句子描述图内场景，尽量将想看到的提示词排在前面。例如在正向提示词的栏位填入「一个亚洲女孩在沙滩上」，负向提示词留空
```lisp
an asian girl on the beach
```

结果如下

![](../../../images/example1.png)

2. 不过英文不好的人其实不用写整个句子，用单字加逗号将想看的特征点出来通常就有不错效果。且实务上我们会希望测试更多参数，例如加入画风、要模仿的艺术家风格、身体特征等，因此用逗号更方便调整。将图片特征拆成单字就会变成下面这样：
```lisp
; (绘图时请删除此行) 参考翻译：一个女孩，亚洲人，沙滩，海洋
1girl, asian, beach, ocean
```

再算一次，但是结果变了？没错，即使提示词相近，AI绘图每次算图结果都是随机的。要维持上一次的结果并微调，你得保留每次算图的种子码(Seed，SD WebUI界面左下角，亦会写在档名上)。

![](../../../images/example2.png)

3. 接着可以多指定一点细节：这个女孩眼睛是什么颜色的？发型是什么？有戴帽子吗？是站着还是坐着呢？身上穿的是什么衣服？天空是什么颜色的？
```lisp
; 参考翻译：一个女孩，亚洲人，蓝眼睛，短发，草帽，站着，蓝色比基尼，沙滩，海洋，橘色天空
1girl, asian, blue eyes, short hair, straw hat, standing, blue bikini, beach, ocean, orange sky
```

![](../../../images/example3.png)

呼，好像一口气加太多细节了呢，详述细节的好处是避免AI乱画，但也限制了其作画创意。所以下面的例子会缩短，有时候让AI随机抽奖也不坏呀～


4. 要改变风格，可以在提示词加入「风格」的提示词。这方面的提示词有：相片(photshop)、3D建模(3d model)、装饰艺术(art deco)、石像(stone sculpture)等风格。
```lisp
; 参考翻译：一个女孩的石像，亚洲人，蓝眼睛，沙滩，海洋
a stone sculpture of 1girl, asian, blue eyes, beach, ocean
```

![](../../../images/example4.png)

但我使用的模型已是专攻动漫风格的模型，所以不用特别指定要画出哪种风格，它一律都会是动漫风的图片，很难画出真人照片，所以说挑对模型很重要啊。


5. 风格是很难界定的东西呢，一般来说我们会图片像哪个艺术家的风格对吧？那么不如直接「召唤」他们吧！提示词可以包含某位画家的名字，AI会尝试模仿其风格。例如加上「慕夏的作品」，并加入「大师级作品」的风格提示词：
```lisp
; 参考翻译：慕夏的作品，大师级作品，一个女孩，亚洲人，蓝眼睛，沙滩，海洋
artwork by Alfons Maria Mucha, masterpiece, 1girl, asian, blue eyes, beach, ocean
```

绘图的结果就会变得像是慕夏的作品。顺带一提`masterpiece`这个提示词还蛮万用的，可以让作品维持一定水准。

![](../../../images/example5.png)

6. 当然还可以画特定动漫人物的「二创」，只要将名字和作品名称打上去就可以了。有名的动漫角色只要出现名字，不用特别指定身体特征或就会画出原作风格了，例如指定《新世纪福音战士》的惣流·明日香·兰格雷：
```lisp
; 参考翻译：新世纪福音战士的明日香，大师级作品，一个女孩，沙滩，海洋
asuka_langley_souryuu from neon_genesis_evangelion, masterpiece, 1girl, beach, ocean
```

![](../../../images/example6.png)


再次提醒，在下提示词的时候，绘制图片使用的模型也需纳入考量。譬如想要绘制特定动漫人物，去Danbooru找到了英文姓名，加上提示词，但你却用画真人的Stable Diffusion去算，则AI可能根本就不会认得你说的角色是谁，反之亦然。 Danbooru的标签风格跟一般图片的描述还是有差距的。

除非日后有搜罗全部网路图片的超大模型出现，否则下提示词须配合模型种类来决定。

如果AI怎样都绘制不出你要的风格或人物，请考虑换个模型，或是[自行训练模型](../training/)。


# 2. 负向提示词 Negative Prompts

上面的例子，我们只有写提示词，但下面的负向提示词的栏位都是空白。但生图时常常还需要加入一些负向提示词，避免掉不好的结果。 AI绘图有时不会一次就算出好结果，所以还需要加上负向提示词来控制，尤其是大批算图的时候更为重要。

1. 负向提示词会加入一些常见的「不好」的图片特征，例如低画质、最糟品质、画家签名、模糊、浮水印
```lisp
deformed, lowres, bad anatomy, text, error, extra digit, fewer digits, cropped, worst quality, low quality, normal quality, jpeg artifacts, signature, watermark, username, blurry, artist name
```

2. 不想看到的东西也可以加进去。例如不想看到裸露、兵器、血、猎奇的元素出现，就加入`nsfw`、`weapon`、`blood`、`guro`至负向提示词
```lisp
nsfw, weapon, blood, guro, lowres, bad anatomy, text, error, extra digit, fewer digits, cropped, worst quality, low quality, normal quality, jpeg artifacts,signature, watermark, username, blurry, artist name
```

提示词并非越多越好，正向提示词以不超过150个词元(token)为原则；不过负向提示词可以尽量把不想看到的都塞进去。


# 3. Stable Diffusion WebUI独有语法

此节列出的语法为ATOMATIC1111制作的SD WebUI独有，使用其他人制作的Stable Diffusion程序不见得适用。


##  关注度括号 Attention/emphasis

控制关注度的符号，增加算图时对该提示词的关注度(attention)。简单来说，括号就是你想强调的重点元素，括号越多，绘制的结果越会符合括号里的提示词。

SD WebUI使用小括号控制关注度： `( )` 小括号层次越多权重越高(不加小括号为1倍，每加一层小括号乘以1.1倍)。例如，强调「蓝眼睛」，绘制的结果就更高机率是蓝眼睛人物
```lisp
asian, woman, ((blue eyes)), beach, ocean
```

亦可以直接写明要增强几倍关注度，但其实一般情况下不用设太强，用一二层的小括号就够了。
```lisp
asian, woman, (blue eyes:2.5), beach, ocean
```

SD WebUI还支持`[ ]`中括号，越多权重越弱(乘以1.1倍)，通常用在负向提示词栏位。

＊给用过NovelAI的使用者：SD WebUI的小括号`( )`效果等价于NovelAI的大括号`{ }`，都是增加对该提示词的关注度。


## 提示词编辑 Prompt editing

指定在到哪一步数的时候切换提示词。此处的中括号跟权重无关。

语法为`[提示词1:提示词2:要切换的步数]`

例如，算图时设定20步，一开始算橘子，设定算到15步时切换成苹果
```lisp
[orange : apple : 15] on table
```


## 切换单字 Alternating Words

使用` | `代表在每个步数切换提示词，例如我要在算图时于「蓝眼睛」或「红眼睛」或「黑眼睛」之间切换
```lisp
asian, woman, [blue eyes|red eyes|black eyes], beach, ocean
```


## 可组合性扩散 Composable Diffusion

此语法让AI依照权重绘制二个不同的物件。

例如绘制橘子与苹果，中间用大写的`AND`连接
```lisp
orange AND apple
```

后面加上数字控制权重，初始值为1，数值低于0.1则无效。
```lisp
orange :1.5 AND apple :2.5
```

此语法适合搭配[ControlNet和Latent Couple](../extensions/latent-couple/)，可以准确控制图中物件的位置。


# 4. 提示词范例

这里提供一些懒人包。负向提示词有些是通用的。


## 绘制可爱的狗子

让我们试着画几只柯基犬在草地上奔跑。

建议使用模型：Stable Diffusion、Realistic Vision

提示词
```lisp
3 corgi dogs running on grass field
```

负向提示词
```lisp
lowres, bad anatomy, text, error, extra digit, fewer digits, cropped, worst quality, low quality, normal quality, jpeg artifacts,signature, watermark, username, blurry, artist name
```

![](../../../images/example-dog.png)


## 绘制高科技未来城市

建议使用模型：Stable Diffusion、Realistic Vision

提示词
```lisp
city future, 8k, exploration, cinematic, realistic, unreal engine, hyper detailed, volumetric light, moody cinematic epic concept art, realistic matte painting, hyper photorealistic
```

负向提示词
```lisp
lowres, bad anatomy, text, error, extra digit, fewer digits, cropped, worst quality, low quality, normal quality, jpeg artifacts,signature, watermark, username, blurry, artist name
```

![](../../../images/example-city.png)


## 绘制一台特斯拉车子

建议使用模型：Stable Diffusion、Realistic Vision

提示词
```lisp
concept art,tesla car, aerodynamic, future
```

负向提示词
```lisp
lowres, bad anatomy, text, error, extra digit, fewer digits, cropped, worst quality, low quality, normal quality, jpeg artifacts,signature, watermark, username, blurry, artist name
```

![](../../../images/example-car.png)


## 绘制二次元美少女

建议使用模型：Anything、Hentai Diffusion

随机画一个Fate/Grand Order的贞德

提示词
```lisp
jeanne d'arc from fate grand order, 1girl, (best quality), (masterpiece), (high detail), ((full face)), sharp, ((looking at viewer)), ((detailed pupils)), (thick thighs), (((full body))), (large breasts)
```

负向提示词
```lisp
lowres, bad anatomy, bad hands, text, error, missing fingers, extra digit, fewer digits, cropped, worst quality, low quality, normal quality, jpeg artifacts,signature, watermark, username, blurry, artist name
```

![](../../../images/example-anime.png)


## 绘制日韩风真人女孩

建议使用模型：ChilloutMix、Perfect World，并适时使用Japanese Doll的LoRA。

随机画一个日本女孩，不要涩图

提示词
```lisp
(a japanese woman), shiny skin, (ultra high res,photorealistic,realistic,best quality,photo-realistic), (((high detailed skin,visible pores))),(real person,photograph), (8k, raw photo, best quality, masterpiece),(1girl),photon mapping, radiosity, physically-based rendering,automatic white balance,(haunting smile,moist lips),watery eyes, (blush|cute and playful|adorable|thick bangs|beauty),((irises and pupils are rounded,the pupil reflects the surroundings,eyes are not the same size))
```

负向提示词
```lisp
nude, lowres,blurry,simple background,jpeg artifacts,bad-artist,bad shadow,compressed image,low pixel,light spot, paintings,sketches,((monochrome)),((grayscale)),noise point,semi-realistic, 3d,render,cg,drawing,cartoon,anime,comic,username,watermark,signature,cropped,error,censored,text,stain, deformed iris,deformed pupils,deformed nail,deformed ear,deformed eye,deformed eyelid,collapsed eyeshadow, [excessive skin spots,excessive skin imperfections,skin blemishes,skin fold,rough skinstain skin],goosebumps,skin layering,axillary fold,facial contortion, (flawless face),trimming
```

![](../../../images/example-girl.png)


# 5. 值得参考的提示词网站


若使用的是SD模型，想绘制真人，请看[Voldy](https://rentry.org/artists_sd-v1-4)整理的历史上有名的艺术家。

若使用动漫风的模型请看[Danbooru](https://danbooru.donmai.us)图库的标签决定要下哪些提示词。

[Prompt Generator](https://promptomania.com/stable-diffusion-prompt-builder/)和[NovelAI魔导书](https://thereisnospon.github.io/NovelAiTag/)可以协助你组合提示词。

[Civitai](https://civitai.com)除了下载模型外，还有很多现成的提示词搭配模型的例子可以照抄。
