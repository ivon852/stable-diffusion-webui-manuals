---
title: "训练Embedding"
weight: 3
---

Textual Inversion(文本倒置)，又称Embedding(嵌入)，适合让AI学习一个新的概念/物体。画风相较于HyperNetwork学习能力较差。

Anything这类基于NovelAI制作的模型不适合拿来练Embedding，成品会很诡异。从头开始训练的Waifu Diffusion或Stable Diffusion比较适合训练Embedding，因此这里使用的基础模型为Waifu Diffusion 1.4。


# 1. 操作过程

1. 启动SD WebUI

2. 切换至Train页面，在`Create embedding`输入名字。`Number of vectors per token`设置7以上。点击`Create embedding`。

![](../../../images/embedding-1.webp)

3. 切换至Train页面，选择刚刚创建的embedding，于`Dataset directory`输入训练数据的路径

![](../../../images/embedding-2.webp)

4. `Prompt template file`选style_filewords.txt。`Mx Step`设置训练至10000步停止。当然你也可以调高一点，并看预览图决定品质差不多之后才按Interrupt中止训练，究竟要多少步数不得而知。

![](../../../images/embedding-3.webp)

5. 点击`Train Embedding`，开始训练。

6. SD WebUI应会显示剩余时间，通常是一小时起跳，每500步会在右边显示训练该步数的成果。

7. 你也可以到SD WenUI根目录下的`texual_inversions`查看训练成果。里面`image_embeddings`目录会存放第几步所训练的成果。

![](../../../images/embedding-4.webp)

8. 待训练完成后，至SD WenUI根目录下的`texual_inversions/embeddings`，对照`image_embeddings`目录的图片挑选合适的成品。

![](../../../images/embedding-5.webp)

9. 例如觉得9500步的不错，那就将该pt档从里面挑出，将其放到SD WebUI程序目录下的`embeddings`。

![](../../../images/embedding-6.webp)


# 2. Embedding模型使用方式

1. 于SD WebUI的生图界面，点击右上角`Show Extra Networks`

![](../../../images/embedding-7.webp)

2. 接着选取要使用的embedding，点击将其加入提示词字段。Embedding只能配合训练时使用的模型来算图。

![](../../../images/embedding-8.webp)

3. 然后按照Embedding训练时使用的提示词下提示词，这样算出来的图便会有该Embedding的人物了。

![](../../../images/embedding-9.webp)
