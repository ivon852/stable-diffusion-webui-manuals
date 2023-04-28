---
title: "安装中文和双语界面"
weight: 2
---

- 正体中文扩充功能来源：[benlisquare/stable-diffusion-webui-localization-zh_TW](https://github.com/benlisquare/stable-diffusion-webui-localization-zh_TW)
- 简体中文扩充功能来源：[dtlnor/stable-diffusion-webui-localization-zh_CN](https://github.com/dtlnor/stable-diffusion-webui-localization-zh_CN)

Stable Diffusion WebUI可以透过扩充功能将界面变成中文。如果您想协助翻译，请点选以上的Github储存库连结，帮帮他们。

1. 进入Extensions页面，取消勾选`localization`，再点选`Load from:`，找到`zh_TW Localization`或`zh_CN Localization`，点选Install。

![](../../../images/localizations-1.webp)

2. 到Settings页面，找到左边的Localization，点选`zh-tw`或`zh-cn`，再点选`Apply Settings`。

![](../../../images/localizations-2.webp)

3. 之后重启WebUI，界面就会变成中文了。

由于SD WebUI的扩充功能发展太快，翻译可能跟不上，建议另外安装双语对照[sd-webui-bilingual-localization](https://github.com/journey-ad/sd-webui-bilingual-localization)，同时显示中文和英文的文字，这样看教学时就不会找无按钮了。

启用双语扩充功能前，要到Settings → User interface → Localization设为None再重启才会生效。

![](../../../images/localizations-3.webp)
