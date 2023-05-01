---
title: "☁️ 部署至Paperspace"
weight: 12
---

Paperspace是一间位于美国的云端机器学习服务供应商，提供免费GPU跑机器学习项目。

免费版本的保存空间5GB，只能使用有限制的运行个体，一次只能运行一个笔记本，6小时后机器自动关闭。有时候免费GPU需要排队。

值得一提的是Paperspace官方有维护专门跑Stable Diffusion WebUI的笔记本，点一下就可以使用，并且速度很快。代码很清晰，可按照需求修改。


1. 至[Paperspace](https://www.paperspace.com/)注册帐号。注册需要提供电话号码。

2. 进入[gradient-ai/stable-diffusion](https://console.paperspace.com/github/gradient-ai/stable-diffusion?machine=Free-GPU&ref=blog.paperspace.com)页面，点击Start Machine

![](../../../images/deploy-to-paperspace-1.webp)

3. 这个面板就是笔记本的页面了。点击右上角的Run all后，笔记本会安装Stable Diffusion WebUI所需的依赖，并下载Stable Diffusion v2.1的模型。此阶段所下载的文件不会计入帐户的保存空间。

![](../../../images/deploy-to-paperspace-2.webp)


4. 之后点击Use the Stable Diffusion Web UI这个保存格终端机显示的Gradio网址

![](../../../images/deploy-to-paperspace-3.webp)


5. 即可使用WebUI。

![](../../../images/deploy-to-paperspace-4.webp)

6. 使用完毕后记得按左上角的Stop Machine关机。


此笔记本只有安装最小功能。扩充功能和额外模型要自行修正笔记本程序下载。

下载自订模型可以加在拷贝Stable Diffusion WebUI的保存库之后
```python
!git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui
!wget -nc -P stable-diffusion-webui/models/Stable-diffusion https://huggingface.co/andite/anything-v4.0/resolve/main/anything-v4.5-pruned.safetensors
```

参照[命令行参数](../installation/command-line-arguments-and-settings/)，找到启动WebUI这行，加入`--enable-insecure-extension-access`让你可从网页版的Extension页面下载扩充。
```python
!python launch.py --share --config ~/../datasets/stable-diffusion-classic-v2/768-v-ema.yaml --ckpt ~/../datasets/stable-diffusion-classic-v2/768-v-ema.ckpt --enable-insecure-extension-access
```
