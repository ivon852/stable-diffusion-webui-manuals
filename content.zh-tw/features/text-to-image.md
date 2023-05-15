---
title: "4.1. 文生圖 Text to image"
weight: 2
---

文生圖(txt2image)即為讓AI按照文字敘述生圖。

開啟Stable Diffusion WebUI網頁後，第一個看到的是以下畫面，這就是文生圖的頁面。

![](../../images/text-to-image-1.webp)

生圖流程為在左上角填入提示詞，勾選左下角的生圖參數，再點選右上角生成圖片。其餘SD WebUI的功能用法大抵都按照此邏輯設計，有些參數是通用的。

需要中文界面的可以先裝[正體中文/雙語擴充功能](../extensions/localizations/)。


# 1. 參數解說

## Stable Diffusion checkpoint

目前使用的存檔點模型。


## Prompts 提示詞

這是填入正向與負向提示詞的欄位。


## Sampling Methods 取樣方法

Sampling Methods即為取樣方法，各種方法得出的結果不太一樣。

UniPC是2023年發表的取樣方法。

DDIM和PLMS是2022年隨Stable Diffusion v1發表的取樣方法。

若要兼顧品質與速度，請優先試試這三種取樣方法：UniPC、DPM++ 2M Karras、Euler a。


## Sampling Steps 取樣步數

取樣步數建議值至少為20，在使用Euler a和UniPC取樣方法的時候就有很好效果。

相對的DDIM需要80以上的取樣步數才會有好結果。


## Restore faces 臉部修復

使用臉部修復模型改善臉部生成效果。預設使用CodeFormer，可在Settings切換為GFPGAN。


## Tiling 平鋪

生成類似地板花紋一樣可連續的圖片。


## Hires_fix 高畫質修復

可以提昇圖片的畫質，但是會耗費更多VRAM。

### Upscaler

要使用的放大器。

### Hires steps

高畫質修復步數。

### Denoising strength

降噪強度。

### Upscale by

縮放係數。

## Width x Height 圖片寬高

生成圖片的寬高，尺寸越大品質越好，但越會吃掉更多VRAM。

預設寬高為512x512，新版的建議可以試試768x768。

其餘可用的寬高比(ratio)請參考下表。[圖片來源](https://github.com/AUTOMATIC1111/stable-diffusion-webui/discussions/1025#discussioncomment-3727588)

![](../../images/text-to-image-2.webp)


## CFG Scale

CFG Scale即Classifier-free guidance scale

AI生圖與你給的提示詞的相關度，數值越高越會按照你說的內容下去生圖。


## Batch count

設定按左上角的Generate後要生成多少次的圖片。


## Batch size

設定按左上角的Generate後，一次生成內要算多少圖片。通常要一次算多張圖，調整Batch count就夠了，Batch size的值維持為1。


## Seed 種子碼

生成圖片的種子碼。將種子碼保存下來有助於保留生圖的風格。

點選骰子圖示，設定成`-1`即為重置種子碼；回收符號則是叫出上一次生圖所使用的種子碼。

## Seeds Extra

測試更多種子碼變化之用。

### Variation seed

### Variation strength

變化強度，此值越高，生圖結果越不可預料。

### Resize seed from width

### Resize seed from height


## Scripts

載入使用者撰寫的指令稿。內建的有：

- Prompt Matrix：會生出一個表格圖片，用於比對不同提示詞生圖的效果
- Prompts from files or textbox：從寫好提示詞的檔案生成圖片。
- X/Y/Z plot：用於比對不同提示詞、取樣方法、CFG Scale、種子碼的組合所生圖的效果。


## 儲存提示詞

右上角可以儲存與載入生圖提示詞。

5個按鈕由左至依序為：1. 叫出上次生圖使用的設定值 2. 清空提示詞 3. 啟用[額外網路](../features/extra-networks/) 4. 套用選中的風格 5. 儲存目前的提示詞

![](../../images/text-to-image-3.webp)


儲存的提示詞此處稱為風格(styles)

下方的Styles列表即為儲存的提示詞。點選儲存的提示詞(可多選)，再點選上面的剪貼板圖示，即會將該提示詞組合加到左邊的提示詞欄位。


## 傳送結果到其他頁面

生圖後可以點選右下角的`Send to image to image`，將生圖結果傳送到圖生圖的頁面做進一步處理。

![](../../images/text-to-image-13.webp)


# 2. 實際操作

1. Stable Diffusion WebUI正上方可看到現在使用的是哪個存檔點模型。切換模型約需要等30秒。

![](../../images/text-to-image-4.webp)

2. 您也可以按右上角的紅色圖示，以圖形界面選取要使用的存檔點模型。

![](../../images/text-to-image-12.webp)

3. 在頁面左上方填入正向與負向提示詞。

![](../../images/text-to-image-5.webp)

4. Sampling Methods建議先試試最快的「UniPC」，其次是「Euler a」、「DPM++ 2M Karras」。Sampling Steps設20，`Width`x`Height`設定為512x512。

![](../../images/text-to-image-6.webp)

5. 勾選左下角的臉部修復 (Restore faces)，改善臉部生成效果。

![](../../images/text-to-image-7.webp)

6. 點右上角的Generate開始生圖。

![](../../images/text-to-image-8.webp)

7. 視顯卡性能而定，約一分鐘圖片就會算出來了，點選放大右鍵儲存。您也可以點選右下角的Zip按鈕，將圖片打包下載為壓縮檔。

![](../../images/text-to-image-9.webp)

8. 左下角有`Batch count`的數值可設定一次算多張圖。

![](../../images/text-to-image-10.webp)

9. 如果對此次結果滿意，不妨將種子碼 (Seed) 保存下來供日後利用，這樣可以一定程度保留風格。

![](../../images/text-to-image-11.webp)

不論圖片有無右鍵儲存，Stable Diffusion WebUI生成的圖都會自動儲存到主程式資料夾下的`outputs`資料夾。
