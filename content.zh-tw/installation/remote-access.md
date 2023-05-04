---
title: "📱 手機遠端存取"
weight: 7
---

Android/iOS的手機平板無法直接裝Stable Diffusion WebUI，大部分手機也跑不動。

但是您可以在一部電腦安裝Stable Diffusion WebUI，設定防火牆，然後啟動程式，使用其他裝置遠端存取網頁界面。

目前有二種遠端存取的解決方案。


# 1. 使用區域網路連線

區域網路指的是電腦與手機處於同一網段，例如連線到同一個Wifi。

1. 開放電腦防火牆的7860 TCP通訊埠

2. 使用`ip addr`或`ifconfig`指令查看本機區域IP，應是以192.168開頭

3. 在[啟動Stable Diffusion WebUI的指令稿](../installation/command-line-arguments-and-settings/)的`COMMANDLINE_ARGS`後面加入`--listen`引數。

4. 啟動Stable Diffusion WebUI，接著在另一部裝置輸入`http://電腦IP:7860`即可連線到網頁界面。


# 2. 使用Gradio的公開網址

類似ngrok的解決方案，在啟動後產生一組Gradio網址，72小時後過期。這樣就不需要設定防火牆，也不用讓所有裝置處於同一個網段。

但是，網址是向全世界公開的，如果有人連到您的網址，那麼您的電腦可能會被人當作免費算圖機。

1. 在[啟動Stable Diffusion WebUI的指令稿](../installation/command-line-arguments-and-settings/)的`COMMANDLINE_ARGS`後面加入`--share`引數。

2. 啟動Stable Diffusion WebUI，此時會發現除了原本的`127.0.0.1`網址外，還多了一個`gradio.live`的網址。這個網址任何裝置都可以連線，點進去便會進到網頁界面。
