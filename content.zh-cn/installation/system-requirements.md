---
title: "2.1. 系统需求"
weight: 1
---

本页面是跑Stable Diffusion WebUI，用于AI绘图的硬件以及系统需求。


# 1. 电脑硬件需求

<table>
<thead>
  <tr>
    <th></th>
    <th>最低配备</th>
    <th>建议配备</th>
    <th>注解</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>显卡(GPU)</td>
    <td>GTX1050Ti</td>
    <td>RTX3060Ti</td>
    <td>支持的显卡芯片有Nvidia/AMD/Intel Arc/Apple M。</td>
  </tr>
  <tr>
    <td>显卡显存(VRAM)</td>
    <td>4GB</td>
    <td>8GB</td>
    <td>显卡的VRAM最低要4GB才不会算到一半内存不足，若要训练模型就得8GB以上了。</td>
  </tr>
  <tr>
    <td>内存(RAM)</td>
    <td>8GB</td>
    <td>16GB</td>
    <td>您可以激活分页档或挂载SWAP增加系统内存。</td>
  </tr>
  <tr>
    <td>保存空间</td>
    <td colspan="3" style="text-align: center">20GB，最好是SSD</td>
  </tr>
  <tr>
    <td>处理器(CPU)</td>
    <td colspan="3" style="text-align: center">x86架构的Intel或AMD处理器皆可。若为Mac电脑建议使用搭载M系列芯片的机型</td>
  </tr>
  <tr>
    <td>网络连接</td>
    <td colspan="3" style="text-align: center">可以正常连接到Github和Youtube的网络</td>
  </tr>
</tbody>
</table>

- 要生成513x512的图，显卡VRAM在4GB以下的很容易遇到内存不足的问题，并且生图速度很慢。

- 尽管可以[用纯CPU跑Stable Diffusion WebUI](https://ivonblog.com/posts/stable-diffusion-running-on-cpu/)，但是速度会非常慢。一张显卡30秒就能算好的图，CPU要算10分钟。因此用独立显卡跑Stable Diffsuion仍是比较好的选择。

- 硬件不够力的话，用云端服务跑也是可以，例如Google Colab。


# 2. 操作系统需求

## GNU/Linux

测试可以跑的Linux发行版：

- Debian 12
- Ubuntu 22.04 LTS
- Fedora 38
- openSUSE Tumbleweed
- Arch Linux
- Manjaro
- Gentoo (使用glibc的profile)


## Windows

最低要求为Windows 10 64比特，请确保系统已更新至最新版本。

Windows 7不行。


## macOS

最低要求为macOS Monterey (12.5)，可以的话请使用最新版macOS。

建议使用搭载Apple Silicon M芯片 (M1、M2) 的Mac机型。

旧款Mac需配备AMD独立显卡，只有Intel内显的不行。
