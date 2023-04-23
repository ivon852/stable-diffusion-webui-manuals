---
title: "繪製多個人物 Latent Couple"
weight: 8
---

- 擴充功能來源：[ashen-sensored/stable-diffusion-webui-two-shot](https://github.com/ashen-sensored/stable-diffusion-webui-two-shot)

Latent Couple會分割繪圖時的提示詞，這樣就可以繪製多重人物/物件，並精確指定位置顏色了。

像是先用PoseX拉好骨架，再使用Latent Couple標出人物的概略位置。

於Extensions頁面的Install from URL輸入以下網址安裝： `https://github.com/ashen-sensored/stable-diffusion-webui-two-shot.git`，再點選Reload WebUI。

1. 於文生圖的界面會看到Latent Couple

![](/posts/stable-diffusion-webui-manuals/images/o0hDolt.webp)

2. 勾選Enabled啟用，設定長寬，再點選最下面的`Create blank canvas`建立空白畫布

![](/posts/stable-diffusion-webui-manuals/images/MxZcaDu.webp)

3. 用滑鼠繪製色塊。例如用紅筆繪製一個人物，藍筆繪製另一個人物。

![](/posts/stable-diffusion-webui-manuals/images/1AeIBQm.webp)

4. 點選`I've finished my sketch`，下面就會顯示各個色塊的分割狀況。依序填入提示詞：在`General Prompt`填入畫風和背景的提示詞，藍筆部份填入貞德`Jeanne d'Arc`相關的提示詞，紅筆部份填入艾比蓋兒`Abigail Williams`的相關提示詞

![](/posts/stable-diffusion-webui-manuals/images/7Mp06u7.webp)

5. 點選`Prompt Info Update`，提示詞即會自動跑到上面的框框，再自行補上負向提示詞。

![](/posts/stable-diffusion-webui-manuals/images/4w0YBc8.webp)

6. 搭配事先用PoseX拉好的骨架，再點選Generate開始繪圖。

![](/posts/stable-diffusion-webui-manuals/images/bm9qPcV.png)
