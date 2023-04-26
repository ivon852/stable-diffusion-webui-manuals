---
title: "训练HyperNetwork"
weight: 4
---

比起学习概念的embedding，HyperNetwork(超网路)更适合让AI学习图片整体画风。

HyperNetwork我是使用Anything当基础模型来训练。


# 1. 操作过程

1. 启动SD WebUI

2. 切换至Train页面，在`Create hypernetwork`输入名字。`Number of vectors per token`设定7以上。点选`Create hypernetwork`。

![](../../../images/hypernetwork-1.webp)

3. 切换至Train页面，选择刚刚建立的hypernetwork，于`Dataset directory`输入训练资料的路径。`Prompt template file`选hypernetwork.txt。

![](../../../images/hypernetwork-2.webp)

4. `Max Step`设定训练至10000步停止。

![](../../../images/hypernetwork-3.webp)

5. 最后点选`Train HyperNetwork`，开始训练。SD WebUI会显示剩余时间，HyperNetwork会比Embedding长一些。

6. 同样可以到SD WebUI根目录下的`texual_inversions/hypernetwork`查看训练结果。里面会有`images`目录存放第几步所训练的成果。

![](../../../images/hypernetwork-4.webp)

7. 待训练完成后，至SD WeBUI根目录下的`texual_Inversions/hypernetworks`，对照`images`目录下的图片挑选合适的成品。

![](../../../images/hypernetwork-5.webp)

8. 例如觉得9500步的不错，就将pt档放到SD WebUI根目录下的`models/hypernetwork`。

![](../../../images/hypernetwork-6.webp)


# 2. HyperNetwork模型使用方式

1. 于SD WebUI的生图界面，点选右上角`Show Extra Networks`

![](../../../images/hypernetwork-7.webp)

2. 接着选取要使用的Hypernetwork，点选将其加入提示词栏位

![](../../../images/hypernetwork-8.webp)

3. 接着再使用训练时候使用的提示词，这样算出来的图便会有该HyperNetwork的人物了，并且画风还原很佳。

![](../../../images/hypernetwork-9.webp)

