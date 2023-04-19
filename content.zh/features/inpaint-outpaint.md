---
title: "2.4. 內補繪製 InPaint"
weight: 4
---

內補繪製(inpaint)。這是用AI填充塗黑(遮罩)區域的技術，例如給圖片的角色換衣服。或是反過來：讓AI把圖片空白的地方繪製完成(outpaint)。

此功能位於圖生圖的頁面。


# 2.4.1. 參數解說

## Mask blur

圖片上的筆刷毛邊柔和程度。

## Mask mode

選擇要讓AI填滿塗黑區域(Inpaint masked)，或是填滿未塗黑區域(Inpaint not masked)。

## Masked content

要填充的內容。

- Fill：讓AI參考塗黑附近的顏色填滿區域。
- Original：在填滿區域的時候參考原圖底下的內容。
- latent noise：使用潛在空間填滿，可能會生出跟原圖完全不相關的內容。
- latent nothing：使用潛在空間填滿，不加入噪聲。


## Inpaint area

選擇要填滿整張圖片(Whole picture)或是只填滿塗黑的區域(Only masked)

`Only masked padding, pixels`是像素內距。

Only masked即外補繪製模式。


# 2.4.2. 實際操作

1. 上傳圖片，點選圖片，用滑鼠將要替換的部份塗黑。

<img src=/posts/stable-diffusion-webui-manuals/images/ZU9XkZU.webp alt=""  width=500 loading="lazy">

2. 假設要換成泳裝，那麼就在正向提示詞加入`swimsuit`或`bikini`這類的提示詞。

3. 左下角的`Masked content`有幾個選項：`fill`即為填充新內容，`original`則是在填充內容的時候參考原圖黑色底下的內容。

4. 點選Generate繪圖。

<img src=/posts/stable-diffusion-webui-manuals/images/LIxlFVA.webp alt=""  width=500 loading="lazy">


若要切換為外補繪製：點選左下角的Mask mode，將`Inpaint masked`改成`Inpaint not masked`，這樣AI就會改為填滿沒有塗黑的地方。
