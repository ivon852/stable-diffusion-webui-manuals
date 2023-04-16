---
title: "2.2. 文生圖 Text to image"
weight: 2
---

文生圖txt2image即為讓AI按照文字敘述繪圖，流程為填入提示詞，勾選生成時的參數，再點選生成。其餘SD WebUI功能的設計大抵都按照此邏輯設計。

Stable Diffusion WebUI正上方可看到現在使用的是哪個模型。切換模型約需要等30秒。
<img src=/posts/stable-diffusion-webui-manuals/images/Iew050C.webp alt=""  width=500 loading="lazy">

1. 在頁面上方填入正向與負向提示詞。右邊有存檔按鈕。
<img src=/posts/stable-diffusion-webui-manuals/images/kG3Bn21.webp alt=""  width=500 loading="lazy">

2. 取樣方法 (Sampling Methods) 各種方法得出的結果都不一樣，建議先試試最快的Euler a和UniPC。並試著調整取樣步數 (Sampling Steps) 的值至30以上。`Width`x`Height`則是輸出圖片的尺寸，尺寸越大品質越好，但越吃效能。可用的長寬比請參考[此表](https://github.com/AUTOMATIC1111/stable-diffusion-webui/discussions/1025#discussioncomment-3727588)
<img src=/posts/stable-diffusion-webui-manuals/images/vUevujL.webp alt=""  width=500 loading="lazy">

3. 建議勾選左下角的臉部修復 (Restore faces)，改善臉部繪製效果。
<img src=/posts/stable-diffusion-webui-manuals/images/4tYozfF.webp alt=""  width=500 loading="lazy">

4. 點右上角的Generate開始繪圖。
<img src=/posts/stable-diffusion-webui-manuals/images/qu1BW4g.webp alt=""  width=500 loading="lazy">

5. 視顯卡性能而定，約一分鐘圖片就會算出來了，點選放大存檔。
<img src=/posts/stable-diffusion-webui-manuals/images/X2jMeJx.webp alt=""  width=500 loading="lazy">

6. 左下角有`Batch count`的數值可設定一次算多張圖。
<img src=/posts/stable-diffusion-webui-manuals/images/mX8jX9s.webp alt=""  width=500 loading="lazy">

7. 如果對此次結果滿意，不妨將種子碼 (Seed) 保存下來供日後利用，這樣可以一定程度保留風格。點選骰子設定成-1即為重置Seed，回收符號則是叫出上一次繪圖所使用的Seed。
<img src=/posts/stable-diffusion-webui-manuals/images/DFIZZfA.webp alt=""  width=500 loading="lazy">

雜項：

`Tiling`是算出類似地板花紋一樣可連續的圖片。

`Hires_fix`可以提昇圖片的畫質，但是會耗費更多VRAM。

`CFG_Scale`代表的是繪圖與你給的提示詞的相關度，數值越高越會按照你說的內容下去繪圖。

Restore faces的臉部修復模型預設是用CoderFormer，欲換成GFPGAN請按上方Settings → Face restoration切換，再按Apply Settings套用。

不論圖片有無儲存，Stable Diffusion WebUI算好的圖都會自動儲存在程式資料夾下的`outputs`資料夾。

