---
title: "用文生圖 ＋ ControlNet ＋ Latent Couple繪製指定位置的多個人物"
weight: 8
---

請先閱讀[文生圖用法](/posts/stable-diffusion-webui-manuals/features/text-to-image/)，並安裝[ControlNet](/posts/stable-diffusion-webui-manuals/extensions/controlnet/)、[Latent Couple](/posts/stable-diffusion-webui-manuals/extensions/latent-couple/)、[PoseX](/posts/stable-diffusion-webui-manuals/extensions/posex/)擴充功能。

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