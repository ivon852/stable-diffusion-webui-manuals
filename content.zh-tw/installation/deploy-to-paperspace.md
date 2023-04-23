---
title: "(雲端) 部署至Paperspace"
weight: 7
---

Paperspace是一間位於美國的雲端機器學習服務供應商，提供免費GPU跑機器學習專案。

免費版本的儲存空間5GB，只能使用有限制的執行個體，一次只能執行一個筆記本，6小時後機器自動關閉。有時候免費GPU需要排隊。

值得一提的是Paperspace官方有維護專門跑Stable Diffusion WebUI的筆記本，點一下就可以使用，並且速度很快。程式碼很清晰，可按照需求修改。


1. 至[Paperspace](https://www.paperspace.com/)註冊帳號。註冊需要提供電話號碼。

2. 進入[gradient-ai/stable-diffusion](https://console.paperspace.com/github/gradient-ai/stable-diffusion?machine=Free-GPU&ref=blog.paperspace.com)頁面，點選Start Machine

![](../../images/Screenshot_20230421_205429.webp)

3. 這個面板就是筆記本的頁面了。點選右上角的Run all後，筆記本會安裝Stable Diffusion WebUI所需的依賴，並下載Stable Diffusion v2.1的模型。此階段所下載的檔案不會計入帳戶的儲存空間。

![](../../images/Screenshot_20230421_210700.webp)


4. 之後點選Use the Stable Diffusion Web UI這個儲存格終端機顯示的Gradio網址

![](../../images/Screenshot_20230421_202838.webp)


5. 即可使用WebUI。

![](../../images/Screenshot_20230421_204541.webp)

6. 使用完畢後記得按左上角的Stop Machine關機。


此筆記本只有安裝最小功能。擴充功能和額外模型要自行修正筆記本程式下載。

下載自訂模型可以加在複製Stable Diffusion WebUI的儲存庫之後
```python
!git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui
!wget -nc -P stable-diffusion-webui/models/Stable-diffusion https://huggingface.co/andite/anything-v4.0/resolve/main/anything-v4.5-pruned.safetensors
```

參照[命令列引數](../installation/command-line-arguments-and-settings/)，找到啟動WebUI這行，加入`--enable-insecure-extension-access`讓你可從網頁版的Extension頁面下載擴充。
```python
!python launch.py --share --config ~/../datasets/stable-diffusion-classic-v2/768-v-ema.yaml --ckpt ~/../datasets/stable-diffusion-classic-v2/768-v-ema.ckpt --enable-insecure-extension-access
```
