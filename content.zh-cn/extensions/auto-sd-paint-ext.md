---
title: "绘图软件Krita集成 auto-sd-paint-ext"
weight: 10
---

- 扩充功能来源：[Interpause/auto-sd-paint-ext](https://github.com/Interpause/auto-sd-paint-ext)

这是将Stable Diffusion的Inpainti集成至绘图软件Krita的扩充功能，可在选取图层范围后调用Stable Diffusion填充内容，支持不规则选取。

1. 进入Extension页面，点击Install from URL：`https://github.com/Interpause/auto-sd-paint-ext.git`，关闭SD WebUI。

2. 编辑SD WebUI的启动参数，加入`--api`启动SD WebUI。进入网页界面会看到多了`auto-sd-paint-ext Guide/Panel`页面

![](../../../images/auto-sd-paint-ext-1.webp)

3. 安装自由软件[Krita](https://krita.org/)

4. 启动Krita，点击上方的设置 → 管理资源，点击「打开资源文件夹」

![](../../../images/auto-sd-paint-ext-2.webp)

5. 拷贝`pykrita`文件夹的路径

![](../../../images/auto-sd-paint-ext-3.webp)

6. 回到SD WebUI，粘贴pykrita文件夹的路径，下面即会产生创建符号链接的指令。打开终端机，按照你的操作系统运行指令。

![](../../../images/auto-sd-paint-ext-4.webp)

7. 重新启动Krita。点击设置 → 设置Krita，点击左边的「Python插件程序管理器」，再勾选右边的Stable Diffusion Plugin

![](../../../images/auto-sd-paint-ext-5.webp)

8. 重新启动Krita，编辑图片时左边即会多出一堆皮肤。这些皮肤可从设置 → 工具皮肤叫出来

![](../../../images/auto-sd-paint-ext-6.webp)

9. 以Inpaint的功能为例子，让我们先把无关的皮肤都关掉，只留下"Inpaint"

![](../../../images/auto-sd-paint-ext-7.webp)

10. 点击右下角添加颜料图层

![](../../../images/auto-sd-paint-ext-8.webp)

11. 在此图层用铅笔工具，将要填充的地方涂黑

![](../../../images/auto-sd-paint-ext-9.webp)

12. 于左边的皮肤填入提示词，点击Start Inpaint，开始绘图。进度条可从终端机查看。

![](../../../images/auto-sd-paint-ext-10.webp)

13. SD WebUI运算完成后结果即会显示在Krita的图层上。

![](../../../images/auto-sd-paint-ext-11.webp)
