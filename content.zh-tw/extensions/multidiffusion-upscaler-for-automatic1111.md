---
title: "低VRAM也能生大圖 Tiled Diffusion"
weight: 5
---

- 擴充功能來源：[pkuliyi2015/multidiffusion-upscaler-for-automatic1111](https://github.com/pkuliyi2015/multidiffusion-upscaler-for-automatic1111)

這個擴充功能讓VRAM偏低(< 6GB)的電腦也能生成1080x1080以上解析度的大型圖片，甚至不需要用`--lowvram`和`--medvram`引數來啟動Stable Diffusion WebUI了。

安裝方法：進入Extensions頁面，點選Install from URL，輸入`https://github.com/pkuliyi2015/multidiffusion-upscaler-for-automatic1111.git`後按Install，重啟WebUI。

在文生圖的頁面左下角會看到Tiled Diffusion和Tiled VAE，將二者的Enabled勾選即為啟用，生圖時維持預設值即可。

![](../../images/multidiffusion-upscaler-for-automatic1111-1.webp)

另提供Region Prompt Control，可以控制每個tile的提示詞。
