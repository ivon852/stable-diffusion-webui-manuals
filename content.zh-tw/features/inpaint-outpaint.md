---
title: "4.3. 內補繪製 InPaint"
weight: 4
---

內補繪製(inpaint)。這是用AI填充塗黑(遮罩)區域的技術，例如給圖片的角色換衣服。或是反過來：讓AI把圖片空白的地方繪製完成(outpaint)。

此功能位於Img2img下的Inpaint頁面。

![](../../images/inpaint-outpaint-1.webp)


# 1. 參數解說

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


# 2. 實際操作

1. 上傳圖片，點選圖片，用滑鼠將要替換的部份塗黑。

![](../../images/inpaint-outpaint-2.webp)

或者也可以切換到Inpaint Upload頁面，上傳圖片，再於下方Mask上傳塗好遮罩的圖片。

2. 假設要換成泳裝，那麼就在正向提示詞加入`swimsuit`或`bikini`這類的提示詞。

3. 左下角的`Masked content`有幾個選項：`fill`即為填充新內容，`original`則是在填充內容的時候參考原圖黑色底下的內容。

4. 點選Generate生圖。

![](../../images/inpaint-outpaint-3.webp)

若要切換為外補繪製：點選左下角的Mask mode，將`Inpaint masked`改成`Inpaint not masked`，這樣AI就會改為填滿沒有塗黑的地方。


# 3. 批次處理圖片

切換到Batch頁面

![](../../images/inpaint-outpaint-4.webp)

第一個欄位輸入要處理的圖片路徑，例如桌面的`Input`資料夾

第二個則是輸出路徑

第三個欄位是預先塗好遮罩的圖片的路徑
