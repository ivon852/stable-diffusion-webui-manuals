---
title: "2.4. 内补绘制 InPaint"
weight: 4
---

内补绘制(inpaint)。这是用AI填充涂黑(遮罩)区域的技术，例如给图片的角色换衣服。或是反过来：让AI把图片空白的地方绘制完成(outpaint)。

此功能位于图生图的页面。


# 1. 参数解说

## Mask blur

图片上的笔刷毛边柔和程度。

## Mask mode

选择要让AI填满涂黑区域(Inpaint masked)，或是填满未涂黑区域(Inpaint not masked)。

## Masked content

要填充的内容。

- Fill：让AI参考涂黑附近的颜色填满区域。
- Original：在填满区域的时候参考原图底下的内容。
- latent noise：使用潜在空间填满，可能会生出跟原图完全不相关的内容。
- latent nothing：使用潜在空间填满，不加入噪声。


## Inpaint area

选择要填满整张图片(Whole picture)或是只填满涂黑的区域(Only masked)

`Only masked padding, pixels`是像素内距。

Only masked即外补绘制模式。


# 2. 实际操作

1. 上传图片，点选图片，用鼠标将要替换的部份涂黑。

![](../../../images/ZU9XkZU.webp)

或者也可以切换到Inpaint Upload页面，上传图片，再于下方Mask上传涂好遮罩的图片。

2. 假设要换成泳装，那么就在正向提示词加入`swimsuit`或`bikini`这类的提示词。

3. 左下角的`Masked content`有几个选项：`fill`即为填充新内容，`original`则是在填充内容的时候参考原图黑色底下的内容。

4. 点选Generate绘图。

![](../../../images/LIxlFVA.webp)

若要切换为外补绘制：点选左下角的Mask mode，将`Inpaint masked`改成`Inpaint not masked`，这样AI就会改为填满没有涂黑的地方。


# 3. 批量处理图片

切换到Batch页面

![](../../../images/Screenshot_20230420_143750.webp)

第一个栏位输入要处理的图片路径，例如桌面的`Input`文件夹

第二个则是输出路径

第三个栏位是预先涂好遮罩的图片的路径
