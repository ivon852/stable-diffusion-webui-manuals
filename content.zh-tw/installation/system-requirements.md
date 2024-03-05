---
title: "2.1. 系統需求"
weight: 1
---

本頁面是跑Stable Diffusion WebUI，用於AI繪圖的硬體以及系統需求。


# 1. 電腦硬體需求

<table>
<thead>
  <tr>
    <th></th>
    <th>最低配備</th>
    <th>建議配備</th>
    <th>註解</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>顯示卡(GPU)</td>
    <td>GTX1050Ti</td>
    <td>RTX3060Ti</td>
    <td>支援的顯示卡晶片有Nvidia/AMD/Intel Arc/Apple M。</td>
  </tr>
  <tr>
    <td>顯示卡視訊記憶體(VRAM)</td>
    <td>4GB</td>
    <td>8GB</td>
    <td>顯示卡的VRAM最低要4GB才不會算到一半記憶體不足，若要訓練模型就得8GB以上了。</td>
  </tr>
  <tr>
    <td>記憶體(RAM)</td>
    <td>8GB</td>
    <td>16GB</td>
    <td>您可以啟用分頁檔或掛載SWAP增加系統記憶體。</td>
  </tr>
  <tr>
    <td>儲存空間</td>
    <td colspan="3" style="text-align: center">20GB，最好是SSD</td>
  </tr>
  <tr>
    <td>處理器(CPU)</td>
    <td colspan="3" style="text-align: center">x86架構的Intel或AMD處理器皆可。若為Mac電腦建議使用搭載M系列晶片的機型</td>
  </tr>
  <tr>
    <td>網路連線</td>
    <td colspan="3" style="text-align: center">可以正常連線到Github和Youtube的網路</td>
  </tr>
</tbody>
</table>

- 要生成513x512的圖，顯示卡VRAM在4GB以下的很容易遇到記憶體不足的問題，並且生圖速度很慢。

- 儘管可以[用純CPU跑Stable Diffusion WebUI](https://ivonblog.com/posts/stable-diffusion-running-on-cpu/)，但是速度會非常慢。一張顯示卡30秒就能算好的圖，CPU要算10分鐘。因此用獨立顯示卡跑Stable Diffusion仍是比較好的選擇。

- 硬體不夠力的話，用雲端服務跑也是可以，例如Google Colab。


# 2. 作業系統需求

測試可以跑的Linux發行版：

- Debian 12
- Ubuntu 22.04 LTS
- Fedora 38
- openSUSE Tumbleweed
- Arch Linux
- Manjaro
- Gentoo (使用glibc的profile)


## Windows

最低要求為Windows 10 64位元，請確保系統已更新至最新版本。

Windows 7不行。


## macOS

最低要求為macOS Monterey (12.5)，可以的話請使用最新版macOS。

建議使用搭載Apple Silicon M晶片 (M1、M2) 的Mac機型。

舊款Mac需配備AMD獨立顯示卡，只有Intel內顯的不行。
