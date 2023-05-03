---
title: "提示词自动补完 Booru tag autocompletion"
weight: 5
---

- 扩充功能来源：[DominikDoom/a1111-sd-webui-tagcomplete](https://github.com/DominikDoom/a1111-sd-webui-tagcomplete)

输入提示词的时候提示相关Danbooru上的标签，画动漫图的时候很有用，还可以安装中文标签翻译。

![](../../../images/a1111-sd-webui-tagcomplete-1.webp)

进入Extensions页面，点击`Install from URL`，输入网址`https://github.com/DominikDoom/a1111-sd-webui-tagcomplete.git`，按`Install`，之后重启WebUI。

如何安装标签中文翻译：到[byzod/a1111-sd-webui-tagcomplete-CN](https://github.com/byzod/a1111-sd-webui-tagcomplete-CN)保存库，点击绿色的Code → Download ZIP，解压缩，得到tags文件夹，下面有`Tags-zh-full-pack.csv`和`config.json`这二个文件。将这二个文件移动到`stable-diffusion-webui/extensions/a1111-sd-webui-tagcomplete/tags`文件夹。
