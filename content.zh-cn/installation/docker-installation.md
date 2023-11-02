---
title: "🐳 用Docker容器跑"
weight: 6
---

Docker容器技术可以方便在多个平台部署Stable Diffusion WebUI。

将程序容器化的话，在不同Linux发行版跑Stable Diffusion WebUI就容易多了。

以Ubuntu 22.04为例，采用AbdBarho维护的docker-compose，仅支持Nvidia显卡。

1. 安装Git、[Docker](https://ivonblog.com/posts/install-docker-engine-on-linux/)，并确认已安装[Nvidia驱动、CUDA、NVIDIA Container Toolkit](https://ivonblog.com/posts/ubuntu-install-nvidia-drivers/)套件

2. 拷贝AbdBarho的保存库
```bash
git clone https://github.com/AbdBarho/stable-diffusion-webui-docker.git
cd stable-diffusion-webui-docker
```

3. 安装依赖套件，过程中会自动下载一个Stable Diffusion的模型。
```bash
docker compose --profile download up --build
```

4. 启动容器，选取auto代表启动AUTOMATIC1111开发的WebUI
```bash
docker compose --profile auto up --build
```

5. 等待启动完成，用浏览器打开`http://127.0.0.1:7860`进入WebUI。要停止运行就是在终端机按Ctrl＋C。

![](../../../images/docker-installation-1.webp)

此docker-compose启动的Stable Diffusion WebUI，数据会挂载至同一目录下的`data`目录。

自订模型放到`data/Stable-diffusion`

生图的输出文件夹则是`data/output`。

扩充功能请从网页界面装，或是在`data`新建`extensions`目录再于该处放入扩充功能的目录。

若要修改WebUI启动时的[命令行参数](../installation/command-line-arguments-and-settings/)，编辑此项目目录下的`docker-compose.yml`，修改`CLI_ARGS`这一行：
```yaml
  auto: &automatic
    <<: *base_service
    profiles: ["auto"]
    build: ./services/AUTOMATIC1111
    image: sd-auto:51
    environment:
      - CLI_ARGS=--allow-code --medvram --xformers --enable-insecure-extension-access --api
```
