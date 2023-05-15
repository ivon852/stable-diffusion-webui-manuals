---
title: "自动从CivitAI下载模型和缩略图 Civitai Extension"
weight: 5
---

- 扩充功能来源：[butaixianran/Stable-Diffusion-Webui-Civitai-Helper](https://github.com/butaixianran/Stable-Diffusion-Webui-Civitai-Helper)

喜欢从[CivitAI](https://civitai.com/)下载模型的用户，装这个扩充功能就不用[手动下载模型](../installation/download-models)了！此扩充功能于Stable Diffusion WebUI的界面加入CivitAI模型下载页面，方便下载各种模型，还会自动比对数据抓取模型的缩略图。

安装方法：进入Extensions页面，点击Install from URL，输入`https://github.com/civitai/sd_civitai_extension.git`后按Install，关掉终端机，重启WebUI。

重开WebUI页面即会多出"Civitai Helper"。

![](../../../images/stable-diffusion-webui-civitai-helper-1.webp)


此页面有4个功能：


## 1. 自动下载缩略图 Scan Models for Civitai

点击橘色的Scan按钮，它就会自动比对本机模型(存盘点、嵌入、超网络、LoRA)的数据，从CivitAI下载模型缩略图。

![](../../../images/stable-diffusion-webui-civitai-helper-2.webp)


## 2. 从CivitAI取得模型信息 Get Model Info from Civitai by URL

此功能用于爬取本机模型的信息。

于`Civitai URL`的字段填入模型的网址(就是你用浏览器所看到的网址)，例如这里我选择Deliberate这个本机模型。

点击`Get Model Info from Civitai`即会下载模型的数据。

![](../../../images/stable-diffusion-webui-civitai-helper-3.webp)


## 3. 从CivitAI下载模型档

1. 于`Civitai URL`字段填入模型的网址(就是你用浏览器所看到的网址)，点击`1. Get Model Info by Civitai Url`取得该页面的数据。

![](../../../images/stable-diffusion-webui-civitai-helper-4.webp)

2. 它会自动抓取模型种类和信息，`Model Name`模型名称和`Model Version`模型版本可以自选。点击`3. Download Model`开始下载模型。至于下载进度条请看终端机。

![](../../../images/stable-diffusion-webui-civitai-helper-5.webp)


## 4. 检查模型有无更新

将Model Types全部打勾，点击`Check New Version from Civitai`，若有新版模型它就会自动下载。

![](../../../images/stable-diffusion-webui-civitai-helper-6.webp)

