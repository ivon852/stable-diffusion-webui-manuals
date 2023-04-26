---
title: "📱 手机远程访问"
weight: 7
---

Android/iOS的手机平板无法直接装Stable Diffusion WebUI，大部分手机也跑不动。

但是您可以在一部电脑安装Stable Diffusion WebUI，设置防火墙，然后启动程序，使用其他设备远程访问网页界面。

目前有二种远程访问的解决方案，下面以Linux系统为例。


# 1. 使用局域网路连接

局域网路指的是电脑与手机处于同一网段，例如连接到同一个Wifi。

1. 开放防火墙的7860通信端口：
```bash
sudo ufw allow 7860/tcp
sudo ufw reload
```

2. 使用`ip addr`指令取得本机区域IP，应是以192.168开头

3. 在[启动Stable Diffusion WebUI的指令稿](../installation/command-line-arguments-and-settings/)的`COMMANDLINE_ARGS`后面加入`--listen`参数。

4. 启动Stable Diffusion WebUI，接着在另一部设备输入`http://电脑IP:7860`即可连接到网页界面。


# 2. 使用Gradio的公开网址

类似ngrok的解决方案，在启动后产生一组Gradio网址，72小时后过期。这样就不需要设置防火墙，也不用让所有设备处于同一个网段。

但是，网址是向全世界公开的，如果有人连到您的网址，那么您的电脑可能会被人当作免费算图机。

1. 在[启动Stable Diffusion WebUI的指令稿](../installation/command-line-arguments-and-settings/)的`COMMANDLINE_ARGS`后面加入`--share`参数。

2. 启动Stable Diffusion WebUI，此时会发现除了原本的`127.0.0.1`网址外，还多了一个`gradio.live`的网址。这个网址任何设备都可以连接，点进去便会进到网页界面。
