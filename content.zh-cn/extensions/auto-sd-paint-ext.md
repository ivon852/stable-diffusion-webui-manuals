---
title: "绘图软件Krita整合 auto-sd-paint-ext"
weight: 10
---

- 扩展来源：[Interpause/auto-sd-paint-ext](https://github.com/Interpause/auto-sd-paint-ext)

这是将Stable Diffusion的Inpainti整合至绘图软件Krita的扩展，可在选取图层范围后调用Stable Diffusion填充内容，支持不规则选取。

1. 进入Extension页面，点选Install from URL：`https://github.com/Interpause/auto-sd-paint-ext.git`，关闭SD WebUI。

2. 编辑SD WebUI的启动引数，加入`--api`启动SD WebUI。进入网页界面会看到多了`auto-sd-paint-ext Guide/Panel`页面

![](../../../images/Screenshot_20230330_155902.webp)

3. 安装自由软件[Krita](https://krita.org/)

4. 启动Krita，点选上方的设定 → 管理资源，点选「开启资源文件夹」

![](../../../images/Screenshot_20230330_155918.webp)

5. 复制`pykrita`文件夹的路径

![](../../../images/Screenshot_20230330_160000.webp)

6. 回到SD WebUI，贴上pykrita文件夹的路径，下面即会产生建立符号连结的指令。开启终端机，按照你的系统执行指令。

![](../../../images/Screenshot_20230330_160110.webp)

7. 重新启动Krita。点选设定 → 设定Krita，点选左边的「Python外挂管理器」，再勾选右边的Stable Diffusion Plugin

![](../../../images/Screenshot_20230330_160327.webp)

8. 重新启动Krita，编辑图片时左边即会多出一堆面板。这些面板可从设定 → 工具面板叫出来

![](../../../images/Screenshot_20230330_160657.webp)

9. 以Inpaint的功能为例子，让我们先把无关的面板都关掉，只留下"Inpaint"

![](../../../images/Screenshot_20230330_164146.webp)

10. 点选右下角新增颜料图层

![](../../../images/Screenshot_20230330_164250.webp)

11. 在此图层用铅笔工具，将要填充的地方涂黑

![](../../../images/Screenshot_20230330_164338.webp)

12. 于左边的面板填入提示词，点选Start Inpaint，开始绘图。进度条可从终端机查看。

![](../../../images/Screenshot_20230330_164558.webp)

13. SD WebUI运算完成后结果即会显示在Krita的图层上。

![](../../../images/Screenshot_20230330_164849.webp)
