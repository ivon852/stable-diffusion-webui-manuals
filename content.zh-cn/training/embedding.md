---
title: "4.3. 训练Embedding"
weight: 3
---

Textual Inversion(文本倒置)，又称Embedding(嵌入)，适合让AI学习一个新的概念/物体。画风相较于HyperNetwork学习能力较差。

Anything这类基于NovelAI制作的模型不适合拿来练Embedding，成品会很诡异。从头开始训练的Waifu Diffusion或Stable Diffusion比较适合训练Embedding，因此这里使用的基础模型为Waifu Diffusion 1.4。


# 1. 操作过程

1. 启动SD WebUI

2. 切换至Train页面，在`Create embedding`输入名字。`Number of vectors per token`设定7以上。点选`Create embedding`。

![](/posts/stable-diffusion-webui-manuals/images/AJGhKGD.avif)

3. 切换至Train页面，选择刚刚建立的embedding，于`Dataset directory`输入训练资料的路径

![](/posts/stable-diffusion-webui-manuals/images/L72fSWj.avif)

4. `Prompt template file`选style_filewords.txt。`Mx Step`设定训练至10000步停止。当然你也可以调高一点，并看预览图决定品质差不多之后才按Interrupt中止训练，究竟要多少步数不得而知。

![](/posts/stable-diffusion-webui-manuals/images/acSmZHm.avif)

5. 点选`Train Embedding`，开始训练。

6. SD WebUI应会显示剩余时间，通常是一小时起跳，每500步会在右边显示训练该步数的成果。

7. 你也可以到SD WenUI根目录下的`texual_inversions`查看训练成果。里面`image_embeddings`目录会存放第几步所训练的成果。

![](/posts/stable-diffusion-webui-manuals/images/IZZLOD1.avif)

8. 待训练完成后，至SD WenUI根目录下的`texual_inversions/embeddings`，对照`image_embeddings`目录的图片挑选合适的成品。
<img src=/posts/stable-diffusion-webui-manuals/images/7mBAcYm.avif width=300>

9. 例如觉得9500步的不错，那就将该pt档从里面挑出，将其放到SD WebUI程式目录下的`embeddings`。

![](/posts/stable-diffusion-webui-manuals/images/ts3gqY7.avif)


# 2. Embedding模型使用方式

1. 于SD WebUI的绘图界面，点选右上角`Show Extra Networks`

![](/posts/stable-diffusion-webui-manuals/images/wgXGW1a.avif)

2. 接著选取要使用的embedding，点选将其加入提示词栏位。Embedding只能配合训练时使用的模型来算图。

![](/posts/stable-diffusion-webui-manuals/images/vRqzVQp.avif)

3. 然后按照Embedding训练时使用的提示词下提示词，这样算出来的图便会有该Embedding的人物了。

![](/posts/stable-diffusion-webui-manuals/images/4Vch9zC.avif)
