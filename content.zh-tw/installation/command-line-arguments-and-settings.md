---
title: "1.3. 命令列引數"
weight: 2
---

此頁面僅供參考：左邊各個系統(Linux/Windows/macOS)的安裝教學已包含懶人引數，照抄即可。

Stable Diffusion WebUI的專案資料夾附有啟動程式的指令稿(script)，稱為啟動指令稿。

Linux/macOS為`webui-user.sh`，以終端機執行`webui.sh`，它會讀取`webui-user.sh`裡面寫的變數與設定值，將其傳給`launch.py`，然後啟動WebUI。

Windows也是一樣，不過啟動是用`webui-user.bat`批次檔，以終端機執行此批次檔(或者點二下)，無需系統管理員權限啟動。


# 1. 環境變數

指令稿裡面可使用這些環境變數(environment variables)：

|名稱|說明|
|---|---|
|PYTHON|設定Python執行檔路徑。|
|VENV_DIR| 設定Python虛擬環境的路徑。預設值為`venv`。該值為`-`時則不建立虛擬環境，直接執行Python程式。|
|COMMANDLINE_ARGS| 主程式的額外命令列引數。|
|IGNORE_CMD_ARGS_ERRORS| 設定為任意值，使程式遇到未知的命令列引數退出時不顯示錯誤|
|REQS_FILE| 啟動`launch.py`安裝依賴套件使用的requirements.txt檔名。預設值為`requirements_versions.txt`|
|TORCH_COMMAND|安裝PyTorch的指令 |
|INDEX_URL|pip的--index-url參數|
|TRANSFORMERS_CACHE| Transformer函式庫下載的路徑，以及CLIP模型相關檔案的路徑。|


環境變數的設定方法：

- Linux/macOS：編輯`webui-user.sh`，填入`export 變數=數值`
- Windows：編輯`webui-user.bat`，填入`set 變數=數值`

例如，Windows對`webui-user.bat`按右鍵以記事本編輯，加入這行：
```powershell
set COMMANDLINE_ARGS=--allow-code --xformers --skip-torch-cuda-test --no-half-vae --api --ckpt-dir A:\\stable-diffusion-checkpoints
```


# 2. 命令列引數

命令列引數(command line arguments)為啟動WebUI時候使用的選項，寫在啟動指令稿的`COMMANDLINE_ARGS`後面。

注意下面是二條橫線「- -」


| 引數指令 | 數值 | 預設值 | 說明 |
|---|---|---|---|
| **設定值** |
|-h, --help         | None  | False   |   				  顯示此幫助訊息並退出。 |
|--exit | | | 安裝後終止程式。 |
|--data-dir | DATA_DIR | ./ | 使用者資料儲存的路徑。 |
|--config    | CONFIG | configs/stable-diffusion/v1-inference.yaml   				 | 建構模型設定檔的路徑。 |
|--ckpt 		| CKPT   | model.ckpt        				 | Stable Diffusion模型的存檔點模型路徑。一旦指定，該模型會加入至存檔點模型列表並載入。|
|--ckpt-dir 	| CKPT_DIR | None   				 | 存放Stable Diffusion模型存檔點模型的路徑。 |
|--no-download-sd-model | None | False | 即使找不到模型，也不自動下載SD1.5模型。 |
|--vae-dir | VAE_PATH | None  					| VAE的路徑。 |
|--gfpgan-dir| GFPGAN_DIR | GFPGAN/			 | GFPGAN路徑 |
|--gfpgan-model| GFPGAN_MODEL			 | GFPGAN模型檔名 |
|--codeformer-models-path | CODEFORMER_MODELS_PATH | models/Codeformer/ | Codeformer模型檔的路徑。 |
|--gfpgan-models-path | GFPGAN_MODELS_PATH | models/GFPGAN | GFPGAN模型檔的路徑。 |
|--esrgan-models-path | ESRGAN_MODELS_PATH | models/ESRGAN |ESRGAN模型檔的路徑。|
|--bsrgan-models-path | BSRGAN_MODELS_PATH | models/BSRGAN |BSRGAN模型檔的路徑。 |
|--realesrgan-models-path | REALESRGAN_MODELS_PATH | models/RealESRGAN | RealESRGAN模型檔的路徑。 |
|--scunet-models-path | SCUNET_MODELS_PATH | models/ScuNET |  ScuNET模型檔的路徑。 |
|--swinir-models-path | SWINIR_MODELS_PATH | models/SwinIR |  SwinIR和SwinIR v2模型檔的路徑。 |
|--ldsr-models-path | LDSR_MODELS_PATH | models/LDSR	| 含有LDSR模型檔的路徑。 |
|--lora-dir | LORA_DIR | models/Lora | 含有LoRA模型檔的路徑。|
|--clip-models-path | CLIP_MODELS_PATH | None | 含有CLIP模型檔的路徑。 |
|--embeddings-dir | EMBEDDINGS_DIR | embeddings/		 | Textual inversion的embeddings路徑 (預設: embeddings) |
|--textual-inversion-templates-dir | TEXTUAL_INVERSION_TEMPLATES_DIR | textual_inversion_templates | Textual inversion範本的路徑|
|--hypernetwork-dir | HYPERNETWORK_DIR | models/hypernetworks/	 | Hypernetwork路徑 |
|--localizations-dir | LOCALIZATIONS_DIR | localizations/ | 在地化翻譯路徑 |
|--styles-file | STYLES_FILE | styles.csv 				| 風格檔名 |
|--ui-config-file | UI_CONFIG_FILE | 	ui-config.json	| UI設定檔檔名 |
|--no-progressbar-hiding | None | False 			 | 取消隱藏Gradio UI的進度條 (我們之所以將其隱藏，是因為在瀏覽器啟動硬體加速的狀況下，進度條會降低機器學習的效能) |
|--max-batch-count| MAX_BATCH_COUNT | 16	 | UI的最大批次數值 |
|--ui-settings-file | UI_SETTINGS_FILE | config.json 	| UI設定值畫面的檔名 |
|--allow-code | None | False          				 | 允許在WebUI執行自訂指令稿 |
|--share | None | False               				 | 使用此引數在啟動後會產生Gradio網址，使WebUI能從外部網路存取 |
|--listen  | None | False            					| 以0.0.0.0主機名稱啟動Gradio，使其能回應連線請求 |
|--port | PORT | 7860           					| 以給定的通訊埠啟動Gradio。1024以下的通訊埠需要root權限。如果可用的話，預設使用7860通訊埠。 |
|--hide-ui-dir-config | None | False  					| 在WebUI隱藏設定檔目錄。|
|--freeze-settings | None | False | 停用編輯設定。 |
|--enable-insecure-extension-access | None | False | 無視其他選項，強制啟用擴充功能頁籤。 |
|--gradio-debug | None | False        					| 使用 --debug選項啟動Gradio |
|--gradio-auth | GRADIO_AUTH | None 				| 設定Gardio授權，例如"username:password"，或是逗號分隔值形式"u1:p1,u2:p2,u3:p3" |
|--gradio-auth-path | GRADIO_AUTH_PATH | None |  設定Gardio授權檔案路徑。 例如 "/路徑/" 再加上`--gradio-auth`的格式。 |
|--disable-console-progressbars | None | False			| 不在終端機顯示進度條。 |
|--enable-console-prompts | None | False				| 在使用文生圖和圖生圖的時候，於終端機印出提示詞 |
|--api | None | False | 以API模式啟動WebUI |
|--api-auth | API_AUTH | None | 設定API授權，例如"username:password"，或是逗號分隔值形式"u1:p1,u2:p2,u3:p3" |
|--api-log | None | False | 啟用所有API請求的紀錄檔 |
|--nowebui | None | False | 僅啟動API, 不啟動WebUI |
|--ui-debug-mode | None | False | 不載入模型，以更快啟動WebUI |
|--device-id | DEVICE_ID | None | 選擇要使用的CUDA裝置 (例如在啟動指令稿使用export CUDA_VISIBLE_DEVICES=0或1) |
|--administrator | None | False | 使用系統管理員權限 |
|--cors-allow-origins | CORS_ALLOW_ORIGINS | None | 允許跨來源資源共用，列表以逗號分隔，不可有空格 |
|--cors-allow-origins-regex | CORS_ALLOW_ORIGINS_REGEX | None | 允許跨來源資源共用，後面加上單一正規表達式 |
|--tls-keyfile | TLS_KEYFILE | None | 部份啟用TLS,，需要配合--tls-certfile才能正常運作 |
|--tls-certfile | TLS_CERTFILE | None | 部份啟用TLS，需要配合--tls-keyfile才能正常運作  |
|--server-name | SERVER_NAME | None | 設定伺服器主機名稱 |
|--gradio-queue | None | False | 使用Gradio queue。實驗性功能，會導致重啟按鈕損壞。 |
|--skip-version-check | None | False | 不檢查torch和xformers的版本 |
|--no-hashing | None | False | 停用計算存檔點模型的sha256雜湊值，加快載入速度 |
| **性能相關** |
|--xformers | None | False           					| 給cross attention layers啟用xformers |
|--reinstall-xformers | None | False           					| 強制重裝xformers，升級時很有用。但為避免不斷重裝，升級後將會移除。 |
|--force-enable-xformers	| None | False				| 強制給cross attention layers啟用xformers ***此選項無法運作的話請勿回報bug*** |
|--xformers-flash-attention | None | False | 給xformers啟用Flash Attention，提昇再現能力 (僅支援SD2.x或以此為基礎的模型)|
|--opt-split-attention | None | False 		| 強制啟用Doggettx的cross-attention layer最佳化。有CUDA的系統預設啟用此選項。 |
|--opt-split-attention-invokeai | None | False			| 強制啟用InvokeAI的cross-attention layer最佳化。無CUDA的系統預設啟用此選項。 |
|--opt-split-attention-v1 | None | False 				| 啟用舊版的split attention最佳化，防止佔用全部可用的VRAM， |
|--opt-sub-quad-attention | None | False | 啟用增進記憶體效率的sub-quadratic cross-attention layer最佳化|
|--sub-quad-q-chunk-size | SUB_QUAD_Q_CHUNK_SIZE | 1024 | sub-quadratic cross-attention layer最佳化使用的序列化區塊大小|
|--sub-quad-kv-chunk-size | SUB_QUAD_KV_CHUNK_SIZE | None | sub-quadratic cross-attention layer最佳化使用的kv區塊大小|
|--sub-quad-chunk-threshold | SUB_QUAD_CHUNK_THRESHOLD | None |sub-quadratic cross-attention layer最佳化過程中，區塊化使用的VRAM閾值|
|--opt-channelslast | None | False    					| 啟用4d tensors使用的alternative layout，或許可以加快推理速度 **僅適用搭載Tensor核心的Nvidia顯示卡(16xx系列以上)** |
|--disable-opt-split-attention | None | False 			| 強制停用cross-attention layer的最佳化 |
|--disable-nan-check | None | False | 不檢查生成圖像/潛在空間是否有nan。在CI模式無使用存檔點模型的時候很有用。|
|--use-cpu | {all, sd, interrogate, gfpgan, bsrgan, esrgan, scunet, codeformer} | None | 讓部份模塊使用CPU作為PyTorch的裝置 |
|--no-half     | None | False         				 |  不將模型轉換為半精度浮點數 |
|--precision | {full,autocast} | autocast			 | 使用此精度評估 |
|--no-half-vae | None | False         				 | 不將VAE模型轉換為半精度浮點數 |
|--upcast-sampling | None | False | 向上取樣。搭配 --no-half使用則無效。生成的結果與使用--no-half引數相近，效率更高，使用更少記憶體。|
|--medvram    | None | False          				 | 啟用Stable Diffusion模型最佳化，犧牲速度，換取較小的VRAM佔用。 |
|--lowvram    | None | False          				 | 啟用Stable Diffusion模型最佳化，大幅犧牲速度，換取更小的VRAM佔用。  |
|--lowram     | None | False         				 | 將Stable Diffusion存檔點模型的權重載入至VRAM，而非RAM |
|--always-batch-cond-uncond | None | False			 | 將--medvram或--lowvram使用的無限制批次停用 |
| **功能** |
|--autolaunch | None | False         					| 啟動WebUI後自動開啟系統預設的瀏覽器 |
|--theme | None | Unset         					| 使用指定主題啟動WebUI (light或dark)，無指定則使用瀏覽器預設主題。 |
|--use-textbox-seed | None | False   					| 在WebUI的種子欄位使用textbox (沒有上下，但可以輸入長的種子碼) |
|--disable-safe-unpickle | None | False				| 不檢查PyTorch模型是否有惡意程式碼 |
|--ngrok | NGROK | None         				 | Ngrok授權權杖， --share引數的替代品。 |
|--ngrok-region | NGROK_REGION | us			 | 選擇啟動Ngrok的區域 |
| **無效選項** |
|--show-negative-prompt | None | False 					| 無作用 |
|--deepdanbooru | None | False 					|無作用 |
|--unload-gfpgan | None | False      				 | 無作用 |
|--gradio-img2img-tool | GRADIO_IMG2IMG_TOOL | None | 無作用 |
|--gradio-inpaint-tool | GRADIO_INPAINT_TOOL | None | 無作用 |


