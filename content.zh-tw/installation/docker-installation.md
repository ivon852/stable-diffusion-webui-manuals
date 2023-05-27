---
title: "🐳 用Docker容器跑"
weight: 6
---

Docker容器技術可以方便在多個平台部署Stable Diffusion WebUI。

以Ubuntu 22.04為例，採用AbdBarho提供的docker-compose，僅支援Nvidia顯示卡。

1. 安裝Git、[Docker](https://ivonblog.com/posts/install-docker-engine-on-linux/)，並確認已安裝[Nvidia驅動、CUDA、NVIDIA Container Toolkit](https://ivonblog.com/posts/ubuntu-install-nvidia-drivers/)套件

2. 複製AbdBarho的儲存庫
```bash
git clone https://github.com/AbdBarho/stable-diffusion-webui-docker.git
cd stable-diffusion-webui-docker
```

3. 安裝依賴套件，會自動下載Stable Diffusion v1.5的模型。
```bash
sudo docker compose --profile download up --build
```

4. 啟動容器，選取auto代表啟動AUTOMATIC1111開發的WebUI
```bash
sudo docker compose --profile auto up --build
```

5. 等待啟動完成，用瀏覽器開啟`http://127.0.0.1:7860`進入WebUI。要停止執行就是在終端機按Ctrl＋C。

![](../../images/docker-installation-1.webp)

此docker-compose啟動的Stable Diffusion WebUI，資料會掛載至同一目錄下的`data`目錄。

自訂模型要放到`data/Stable-diffusion`

生圖的輸出資料夾則是`data/output`。

擴充功能請從網頁界面裝，或是在`data`新建`extensions`目錄再於該處放入擴充功能的目錄。

若要修改WebUI啟動時的[命令列引數](../installation/command-line-arguments-and-settings/)，編輯此專案目錄下的`docker-compose.yml`，修改`CLI_ARGS`這一行：
```yaml
  auto: &automatic
    <<: *base_service
    profiles: ["auto"]
    build: ./services/AUTOMATIC1111
    image: sd-auto:51
    environment:
      - CLI_ARGS=--allow-code --medvram --xformers --enable-insecure-extension-access --api
```
