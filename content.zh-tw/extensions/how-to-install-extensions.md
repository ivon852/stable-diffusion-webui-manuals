---
title: "❓ 如何安裝擴充功能"
weight: 1
---

注意：安裝擴充功能可能會導致Stable Diffusion WebUI無法啟動，或是啟動變慢。

如果遇到bug，您應當優先到擴充功能開發者的Github儲存庫回報，而非直接到AUTOMATIC1111的儲存庫詢問。


# 1. 用圖形界面安裝

1. 您必須在[命令列引數](../installation/command-line-arguments-and-settings/)加入`--enable-insecure-extension-access`才能從圖形界面裝擴充功能。

2. 最簡單的方法就是點選Extensions → Available的`Load from:`，就會列出可下載安裝的擴充功能，點選安裝。

![](../../images/how-to-install-extensions-1.webp)

3. 有些比較新的擴充功能則是要您複製Github儲存庫網址，並點選選Extensions → `Install from URL`，貼上網址再按Install，它會自動完成git clone的操作。

![](../../images/how-to-install-extensions-2.webp)

4. 在安裝擴充功能後，都要點選Installed → Apply and restart WebU，重新載入網頁界面。有些則是得關掉終端機，重新啟動WebUI。

![](../../images/how-to-install-extensions-3.webp)

5. 如果未來要更新擴充功能，點選Installed → Check for updates，等待下載完成，然後重啟WebUI。您可以在這個界面按取消打勾來停用特定的擴充功能。

![](../../images/how-to-install-extensions-4.webp)


# 2. 用指令安裝

Stable Diffusion WebUI的擴充功能目錄一律放在`extensions`資料夾。

1. 用指令安裝擴充功能前先關閉主程式。

2. 接著在`stable-diffusion-webui/extensions`資料夾開啟終端機，執行`git clone`指令，安裝擴充功能。例如要安裝正體中文翻譯的話就是把該儲存庫複製下來：
```bash
git clone https://github.com/benlisquare/stable-diffusion-webui-localization-zh_TW.git
```

3. 重新啟動SD WebUI，即會看到新安裝的擴充功能。

4. 未來要一次更新全部擴充功能的話，在[命令列引數](../installation/command-line-arguments-and-settings/)加入以下選項，讓Stable Diffusion WebUI啟動後自動更新所有擴充功能：
```bash
--update-all-extensions
```

# 3. 如何移除擴充功能

1. 關閉Stable Diffusion WebUI的終端機。

2. 到`stable-diffusion-webui`下的`extension`資料夾，將要移除的擴充功能資料夾刪除。

3. 如果要完全移除擴充功能，將`stable-diffusion-webui`下的`venv`資料夾也刪除，迫使主程式下次啟動重新安裝pip依賴套件。
