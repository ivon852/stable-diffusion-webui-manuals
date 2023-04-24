---
title: "1.3. 命令列引数"
weight: 2
---

此页面仅供参考：左边各个系统(Linux/Windows/macOS)的安装教学已包含懒人引数，照抄即可。

Stable Diffusion WebUI的文件夹附有启动软件的脚本(script)，称为启动脚本。

Linux/macOS为`webui-user.sh`，以终端机执行`webui.sh`，它会读取`webui-user.sh`里面写的变量与设定，将其传给`launch.py`，然后启动WebUI。

Windows也是一样，不过启动是用`webui-user.bat`批处理文件，以终端机执行此批次文件(或者点二下)，无需系统管理员权限启动。


# 环境变量

脚本里面可使用这些环境变量(environment variables)：

|名称|说明|
|---|---|
|PYTHON|设定Python执行文件路径。 |
|VENV_DIR| 设定Python虚拟环境的路径。默认值为`venv`。该值为`-`时则不建立虚拟环境，直接执行Python程式。 |
|COMMANDLINE_ARGS| 主程式的额外命令列引数。 |
|IGNORE_CMD_ARGS_ERRORS| 设定为任意值，使程序遇到未知的命令列引数退出时不显示错误|
|REQS_FILE| 启动`launch.py`安装依赖使用的requirements.txt文件名。默认为`requirements_versions.txt`|
|TORCH_COMMAND|安装PyTorch的命令 |
|INDEX_URL|pip的--index-url参数|
|TRANSFORMERS_CACHE| Transformer库下载的路径，以及CLIP模型相关文件的路径。 |


环境变量的设定方法：

- Linux/macOS：编辑`webui-user.sh`，填入`export 变量=数值`
- Windows：编辑`webui-user.bat`，填入`set 变量=数值`

例如，Windows对`webui-user.bat`按右键以记事本编辑，加入这行：
```powershell
set COMMANDLINE_ARGS=--allow-code --xformers --skip-torch-cuda-test --no-half-vae --api --ckpt-dir A:\\stable-diffusion-checkpoints
```


# 命令列引数

命令列引数(command line arguments)为启动WebUI时候使用的选项，写在启动脚本的`COMMANDLINE_ARGS`后面。

注意下面是二条横线「- -」


| 引数指令 | 数值 | 默认值 | 说明 |
|---|---|---|---|
| **设定值** |
|-h, --help         | None  | False   |   				  显示此帮助信息并退出。 |
|--exit | | | 安装后终止程序。 |
|--data-dir | DATA_DIR | ./ | 使用者资料储存的路径。 |
|--config    | CONFIG | configs/stable-diffusion/v1-inference.yaml   				 | 建构模型设定文件的路径。 |
|--ckpt 		| CKPT   | model.ckpt        				 | Stable Diffusion模型的存档点模型路径。一旦指定，该模型会加入至存档点模型列表并载入。 |
|--ckpt-dir 	| CKPT_DIR | None   				 | 存放Stable Diffusion模型存档点模型的路径。 |
|--no-download-sd-model | None | False | 即使找不到模型，也不自动下载SD1.5模型。 |
|--vae-dir | VAE_PATH | None  					| VAE的路径。 |
|--gfpgan-dir| GFPGAN_DIR | GFPGAN/			 | GFPGAN路径 |
|--gfpgan-model| GFPGAN_MODEL			 | GFPGAN模型文件名 |
|--codeformer-models-path | CODEFORMER_MODELS_PATH | models/Codeformer/ | Codeformer模型的路径。 |
|--gfpgan-models-path | GFPGAN_MODELS_PATH | models/GFPGAN | GFPGAN模型的路径。 |
|--esrgan-models-path | ESRGAN_MODELS_PATH | models/ESRGAN |ESRGAN模型的路径。 |
|--bsrgan-models-path | BSRGAN_MODELS_PATH | models/BSRGAN |BSRGAN模型的路径。 |
|--realesrgan-models-path | REALESRGAN_MODELS_PATH | models/RealESRGAN | RealESRGAN模型的路径。 |
|--scunet-models-path | SCUNET_MODELS_PATH | models/ScuNET |  ScuNET模型的路径。 |
|--swinir-models-path | SWINIR_MODELS_PATH | models/SwinIR |  SwinIR和SwinIR v2模型的路径。 |
|--ldsr-models-path | LDSR_MODELS_PATH | models/LDSR	| 含有LDSR模型的路径。 |
|--lora-dir | LORA_DIR | models/Lora | 含有LoRA模型的路径。 |
|--clip-models-path | CLIP_MODELS_PATH | None | 含有CLIP模型的路径。 |
|--embeddings-dir | EMBEDDINGS_DIR | embeddings/		 | Textual inversion的embeddings路径 (默认: embeddings) |
|--textual-inversion-templates-dir | TEXTUAL_INVERSION_TEMPLATES_DIR | textual_inversion_templates | Textual inversion模板的路径|
|--hypernetwork-dir | HYPERNETWORK_DIR | models/hypernetworks/	 | Hypernetwork路径 |
|--localizations-dir | LOCALIZATIONS_DIR | localizations/ | 在地化翻译路径 |
|--styles-file | STYLES_FILE | styles.csv 				| 风格文件名 |
|--ui-config-file | UI_CONFIG_FILE | 	ui-config.json	| UI设定文件名 |
|--no-progressbar-hiding | None | False 			 | 取消隐藏Gradio UI的进度条 (我们之所以将其隐藏，是因为在浏览器启动硬件加速的状况下，进度条会降低机器学习的效能) |
|--max-batch-count| MAX_BATCH_COUNT | 16	 | UI的最大批次数值 |
|--ui-settings-file | UI_SETTINGS_FILE | config.json 	| UI设定值画面的文件名 |
|--allow-code | None | False          				 | 允许在WebUI执行自订脚本 |
|--share | None | False               				 | 使用此引数在启动后会产生Gradio网址，使WebUI能从外部网络访问 |
|--listen  | None | False            					| 以0.0.0.0主机名称启动Gradio，使其能回应连线请求 |
|--port | PORT | 7860           					| 以给定的端口启动Gradio。 1024以下的端口需要root权限。如果可用的话，默认使用7860端口。 |
|--hide-ui-dir-config | None | False  					| 在WebUI隐藏设定文件目录。 |
|--freeze-settings | None | False | 停用编辑设定。 |
|--enable-insecure-extension-access | None | False | 无视其他选项，强制启用扩展页签。 |
|--gradio-debug | None | False        					| 使用 --debug选项启动Gradio |
|--gradio-auth | GRADIO_AUTH | None 				| 设定Gardio授权，例如"username:password"，或是逗号分隔值形式"u1:p1,u2:p2,u3:p3" |
|--gradio-auth-path | GRADIO_AUTH_PATH | None |  设定Gardio授权文件路径。例如 "/路径/" 再加上`--gradio-auth`的格式。 |
|--disable-console-progressbars | None | False			| 不在终端机显示进度条。 |
|--enable-console-prompts | None | False				| 在使用文生图和图生图的时候，于终端机印出提示词 |
|--api | None | False | 以API模式启动WebUI |
|--api-auth | API_AUTH | None | 设定API授权，例如"username:password"，或是逗号分隔值形式"u1:p1,u2:p2,u3:p3" |
|--api-log | None | False | 启用所有API请求的纪录文件 |
|--nowebui | None | False | 仅启动API, 不启动WebUI |
|--ui-debug-mode | None | False | 不载入模型，以更快启动WebUI |
|--device-id | DEVICE_ID | None | 选择要使用的CUDA装置 (例如在启动脚本使用export CUDA_VISIBLE_DEVICES=0或1) |
|--administrator | None | False | 使用系统管理员权限 |
|--cors-allow-origins | CORS_ALLOW_ORIGINS | None | 允许跨来源资源共用，列表以逗号分隔，不可有空格 |
|--cors-allow-origins-regex | CORS_ALLOW_ORIGINS_REGEX | None | 允许跨来源资源共用，后面加上单一正规表达式 |
|--tls-keyfile | TLS_KEYFILE | None | 部份启用TLS,，需要配合--tls-certfile才能正常运作 |
|--tls-certfile | TLS_CERTFILE | None | 部份启用TLS，需要配合--tls-keyfile才能正常运作  |
|--server-name | SERVER_NAME | None | 设定服务器主机名称 |
|--gradio-queue | None | False | 使用Gradio queue。实验性功能，会导致重启按钮损坏。 |
|--skip-version-check | None | False | 不检查torch和xformers的版本 |
|--no-hashing | None | False | 停用计算存档点模型的sha256哈希值，加快载入速度 |
| **性能相关** |
|--xformers | None | False           					| 给cross attention layers启用xformers |
|--reinstall-xformers | None | False           					| 强制重装xformers，升级时很有用。但为避免不断重装，升级后将会移除。 |
|--force-enable-xformers	| None | False				| 强制给cross attention layers启用xformers ***此选项无法运作的话请勿回报bug*** |
|--xformers-flash-attention | None | False | 给xformers启用Flash Attention，提升再现能力 (仅支援SD2.x或以此为基础的模型)|
|--opt-split-attention | None | False 		| 强制启用Doggettx的cross-attention layer优化。有CUDA的系统默认启用此选项。 |
|--opt-split-attention-invokeai | None | False			| 强制启用InvokeAI的cross-attention layer优化。无CUDA的系统默认启用此选项。 |
|--opt-split-attention-v1 | None | False 				| 启用旧版的split attention优化，防止占用全部可用的VRAM， |
|--opt-sub-quad-attention | None | False | 启用增进内存效率的sub-quadratic cross-attention layer优化|
|--sub-quad-q-chunk-size | SUB_QUAD_Q_CHUNK_SIZE | 1024 | sub-quadratic cross-attention layer优化使用的序列化区块大小|
|--sub-quad-kv-chunk-size | SUB_QUAD_KV_CHUNK_SIZE | None | sub-quadratic cross-attention layer优化使用的kv区块大小|
|--sub-quad-chunk-threshold | SUB_QUAD_CHUNK_THRESHOLD | None |sub-quadratic cross-attention layer优化过程中，区块化使用的VRAM阈值|
|--opt-channelslast | None | False    					| 启用4d tensors使用的alternative layout，或许可以加快推理速度 **仅适用搭载Tensor核心的Nvidia显卡(16xx系列以上)** |
|--disable-opt-split-attention | None | False 			| 强制停用cross-attention layer的优化 |
|--disable-nan-check | None | False | 不检查生成图像/潜在空间是否有nan。在CI模式无使用存档点模型的时候很有用。 |
|--use-cpu | {all, sd, interrogate, gfpgan, bsrgan, esrgan, scunet, codeformer} | None | 让部份模块使用CPU作为PyTorch的装置 |
|--no-half     | None | False         				 |  不将模型转换为半精度浮点数 |
|--precision | {full,autocast} | autocast			 | 使用此精度评估 |
|--no-half-vae | None | False         				 | 不将VAE模型转换为半精度浮点数 |
|--upcast-sampling | None | False | 向上取样。搭配 --no-half使用则无效。生成的结果与使用--no-half引数相近，效率更高，使用更少内存。 |
|--medvram    | None | False          				 | 启用Stable Diffusion模型优化，牺牲速度，换取较小的VRAM占用。 |
|--lowvram    | None | False          				 | 启用Stable Diffusion模型优化，大幅牺牲速度，换取更小的VRAM占用。 |
|--lowram     | None | False         				 | 将Stable Diffusion存档点模型的权重载入至VRAM，而非RAM |
|--always-batch-cond-uncond | None | False			 | 将--medvram或--lowvram使用的无限制批次停用 |
| **功能** |
|--autolaunch | None | False         					| 启动WebUI后自动开启系统默认的浏览器 |
|--theme | None | Unset         					| 使用指定主题启动WebUI (light或dark)，无指定则使用浏览器默认主题。 |
|--use-textbox-seed | None | False   					| 在WebUI的种子栏位使用textbox (没有上下，但可以输入长的种子码) |
|--disable-safe-unpickle | None | False				| 不检查PyTorch模型是否有恶意代码 |
|--ngrok | NGROK | None         				 | Ngrok授权权杖， --share引数的替代品。 |
|--ngrok-region | NGROK_REGION | us			 | 选择启动Ngrok的区域 |
| **无效选项** |
|--show-negative-prompt | None | False 					| 无作用 |
|--deepdanbooru | None | False 					|无作用 |
|--unload-gfpgan | None | False      				 | 无作用 |
|--gradio-img2img-tool | GRADIO_IMG2IMG_TOOL | None | 无作用 |
|--gradio-inpaint-tool | GRADIO_INPAINT_TOOL | None | 无作用 |
