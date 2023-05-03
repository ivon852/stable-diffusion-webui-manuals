---
title: "低VRAM也能生大图 Tiled Diffusion"
weight: 5
---

- 扩充功能来源：[pkuliyi2015/multidiffusion-upscaler-for-automatic1111](https://github.com/pkuliyi2015/multidiffusion-upscaler-for-automatic1111)

这个扩充功能让VRAM偏低(< 6GB)的电脑也能生成1080x1080以上分辨率的大型图片，甚至不需要用`--lowvram`和`--medvram`参数来启动Stable Diffusion WebUI了。

安装方法：进入Extensions页面，点击Install from URL，输入`https://github.com/pkuliyi2015/multidiffusion-upscaler-for-automatic1111.git`后按Install，重启WebUI。

在文生图的页面左下角会看到Tiled Diffusion和Tiled VAE，将二者的Enabled勾选即为激活，生图时维持默认值即可。

![](../../../images/multidiffusion-upscaler-for-automatic1111-1.webp)

另提供Region Prompt Control，可以控制每个tile的提示词。
