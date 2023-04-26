---
title: "简易负向提示词 EasyNegative"
weight: 4
---

- 扩充功能来源：[gsdf/EasyNegative](https://huggingface.co/datasets/gsdf/EasyNegative)

用这个取代冗长的负向提示词吧，反过来利用Embedding的特性，告诉AI不要画什么。

到[作者的储存库](https://huggingface.co/datasets/gsdf/EasyNegative)下载`EasyNegative.safetensors`，将它放到`stable-diffuison-webui`资料夹下的`embeddings`，重启WebUI。

之后在WebUI的负向提示词栏位填入`EasyNegative`即会生效，可有效替代冗长的负向提示词。不过单独使用效果可能还是不好，你还是需要额外准备一些负向提示词。

![](../../../images/easynegative-1.webp)
