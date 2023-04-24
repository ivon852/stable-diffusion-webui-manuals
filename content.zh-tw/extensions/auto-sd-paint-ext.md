---
title: "繪圖軟體Krita整合 auto-sd-paint-ext"
weight: 10
---

- 擴充功能來源：[Interpause/auto-sd-paint-ext](https://github.com/Interpause/auto-sd-paint-ext)

這是將Stable Diffusion的Inpainti整合至繪圖軟體Krita的擴充功能，可在選取圖層範圍後調用Stable Diffusion填充內容，支援不規則選取。

1. 進入Extension頁面，點選Install from URL：`https://github.com/Interpause/auto-sd-paint-ext.git`，關閉SD WebUI。

2. 編輯SD WebUI的啟動引數，加入`--api`啟動SD WebUI。進入網頁界面會看到多了`auto-sd-paint-ext Guide/Panel`頁面

![](../../images/Screenshot_20230330_155902.webp)

3. 安裝自由軟體[Krita](https://krita.org/)

4. 啟動Krita，點選上方的設定 → 管理資源，點選「開啟資源資料夾」

![](../../images/Screenshot_20230330_155918.webp)

5. 複製`pykrita`資料夾的路徑

![](../../images/Screenshot_20230330_160000.webp)

6. 回到SD WebUI，貼上pykrita資料夾的路徑，下面即會產生建立符號連結的指令。開啟終端機，按照你的作業系統執行指令。

![](../../images/Screenshot_20230330_160110.webp)

7. 重新啟動Krita。點選設定 → 設定Krita，點選左邊的「Python外掛程式管理器」，再勾選右邊的Stable Diffusion Plugin

![](../../images/Screenshot_20230330_160327.webp)

8. 重新啟動Krita，編輯圖片時左邊即會多出一堆面板。這些面板可從設定 → 工具面板叫出來

![](../../images/Screenshot_20230330_160657.webp)

9. 以Inpaint的功能為例子，讓我們先把無關的面板都關掉，只留下"Inpaint"

![](../../images/Screenshot_20230330_164146.webp)

10. 點選右下角新增顏料圖層

![](../../images/Screenshot_20230330_164250.webp)

11. 在此圖層用鉛筆工具，將要填充的地方塗黑

![](../../images/Screenshot_20230330_164338.webp)

12. 於左邊的面板填入提示詞，點選Start Inpaint，開始繪圖。進度條可從終端機查看。

![](../../images/Screenshot_20230330_164558.webp)

13. SD WebUI運算完成後結果即會顯示在Krita的圖層上。

![](../../images/Screenshot_20230330_164849.webp)
