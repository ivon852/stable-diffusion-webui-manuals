---
title: "2.4. 內補繪製 InPaint"
weight: 4
---

內補繪製(inpaint)。這是用AI填充塗黑(遮罩)區域的技術，例如給圖片的角色換衣服。或是反過來：讓AI把圖片空白的地方繪製完成(outpaint)。

此功能位於圖生圖的頁面。


# 實際操作

1. 上傳圖片，點選圖片，用滑鼠將要替換的部份塗黑。

<img src=/posts/stable-diffusion-webui-manuals/images/ZU9XkZU.webp alt=""  width=500 loading="lazy">

2. 假設要換成泳裝，那麼就在正向提示詞加入`swimsuit`或`bikini`這類的提示詞。

3. 左下角的`Masked content`有幾個選項：`fill`即為填充新內容，`original`則是在填充內容的時候參考原圖黑色底下的內容。

4. 點選Generate繪圖。

<img src=/posts/stable-diffusion-webui-manuals/images/LIxlFVA.webp alt=""  width=500 loading="lazy">


若要切換為外補繪製：點選左下角的Mask mode，將`Inpaint masked`改成`Inpaint not masked`，這樣AI就會改為填滿沒有塗黑的地方。
