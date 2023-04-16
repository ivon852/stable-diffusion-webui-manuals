---
title: "4. 訓練模型"
bookFlatSection: false
bookCollapseSection: true
---

本文Ivon將說明AI繪圖軟體Stable Diffusion WebUI模型的訓練方法(model training)，包含Textual Inversion (Embedding)、HyperNetwork、LoRA，並給出實際例子與操作步驟。

以下是一個具體例子，透過使用自行訓練的HyperNetwork，便改善單靠Anything模型無法繪製出Hara老師畫風的缺點。在不使用HyperNetwork的情況下，風格永遠是左邊那樣；一使用HyperNetwork，右邊的風格就能輕鬆繪製出來了。
![](/posts/stable-diffusion-webui-manuals/images/vPJsJB1.webp)

本文所討論的訓練模型僅為自用用途，若要分享訓練的模型也應遵照開源的原則分享。

本章節參考資料

訓練過程類

- [Stable Diffusion web UI Wiki - GitHub](https://github.com/AUTOMATIC1111/stable-diffusion-webui/wiki)
- [Hypernetwork training for dummies - Rentry.co](https://rentry.co/hypernetwork4dumdums)
- [【Novel AI】手把手教你Textual Inversion神经网络训练详细操作](https://www.bilibili.com/read/cv19088146)
- [NovelAI hypernetwork 自训练教程 - 知乎专栏](https://zhuanlan.zhihu.com/p/576041621)
- [Basic Dreambooth Guide - Github](https://github.com/nitrosocke/dreambooth-training-guide)
- [LoRA Training Guide - Rentry.co](https://rentry.org/lora_train)
- [Using LoRA for Efficient Stable Diffusion Fine-Tuning - HuggingFace](https://huggingface.co/blog/lora)

理論類

- [曾飞飞 - 零基础读懂Stable Diffusion](https://zhuanlan.zhihu.com/p/597247221)
- [Well-Researched Comparison of Training Techniques Lora, Inversion, Dreambooth, Hypernetworks](https://www.reddit.com/r/StableDiffusion/comments/10cgxrx/wellresearched_comparison_of_training_techniques/)
- [【AI绘画】当我们在训练AI的时候，究竟在训练什么？AI训练前置知识（一）](https://www.bilibili.com/read/cv19249573)
- [【笔记】Stable Diffusion模型优化入门级介绍 - LoRA vs Dreambooth vs Textural Inversion vs Hypernetworks](https://zhuanlan.zhihu.com/p/612992813)
- [Hu, E. J., Shen, Y., Wallis, P., Allen-Zhu, Z., Li, Y., Wang, S., ... & Chen, W. (2021). Lora: Low-rank adaptation of large language models. arXiv preprint arXiv:2106.09685.](https://arxiv.org/abs/2106.09685)

