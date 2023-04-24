---
title: "(云服务) 部署至Paperspace"
weight: 7
---

Paperspace是一间位于美国的云机器学习服务供应商，提供免费GPU跑机器学习专案。

免费版本的储存空间5GB，只能使用有限制的执行个体，一次只能执行一个笔记本，6小时后机器自动关闭。有时候免费GPU需要排队。

值得一提的是Paperspace官方有维护专门跑Stable Diffusion WebUI的笔记本，点一下就可以使用，并且速度很快。代码清晰，可按照需求修改。


1. 至[Paperspace](https://www.paperspace.com/)注册帐号。注册需要提供电话号码。

2. 进入[gradient-ai/stable-diffusion](https://console.paperspace.com/github/gradient-ai/stable-diffusion?machine=Free-GPU&ref=blog.paperspace.com)页面，点选Start Machine

![](../../../images/Screenshot_20230421_205429.webp)

3. 这个面板就是笔记本的页面了。点选右上角的Run all后，笔记本会安装Stable Diffusion WebUI所需的依赖，并下载Stable Diffusion v2.1的模型。此阶段所下载的文件不会计入帐户的储存空间。

![](../../../images/Screenshot_20230421_210700.webp)


4. 之后点选Use the Stable Diffusion Web UI这个储存格终端机显示的Gradio网址

![](../../../images/Screenshot_20230421_202838.webp)


5. 即可使用WebUI。

![](../../../images/Screenshot_20230421_204541.webp)

6. 使用完毕后记得按左上角的Stop Machine关机。


此笔记本只有安装最小功能。扩展和额外模型要自行修正笔记本程序下载。

下载自订模型可以加在复制Stable Diffusion WebUI的仓库之后
```python
!git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui
!wget -nc -P stable-diffusion-webui/models/Stable-diffusion https://huggingface.co/andite/anything-v4.0/resolve/main/anything-v4.5-pruned.safetensors
```

参照[命令列引数](..installation/command-line-arguments-and-settings/)，找到启动WebUI这行，加入`--enable-insecure-extension-access`让你可从网页版的Extension页面下载扩充。
```python
!python launch.py --share --config ~/../datasets/stable-diffusion-classic-v2/768-v-ema.yaml --ckpt ~/../datasets/stable-diffusion-classic-v2/768-v-ema.ckpt --enable-insecure-extension-access
```
