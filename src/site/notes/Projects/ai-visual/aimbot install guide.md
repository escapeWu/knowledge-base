---
{"dg-publish":true,"permalink":"/projects/ai-visual/aimbot-install-guide/","created":"2024-05-27T15:37:39.230+08:00","updated":"2024-05-27T15:03:23.000+08:00"}
---

> 本教程仅支持Nvidia 显卡，Amd 显卡不支持。

![Pasted image 20240130151938.png](/img/user/attachments/Pasted%20image%2020240130151938.png)
1. 下载安装运行环境：[cuda 11.6](https://developer.nvidia.com/cuda-11-6-0-download-archive?target_os=Windows&target_arch=x86_64&target_version=11&target_type=exe_local)
2. 下载apex_beta_0.5.zip 程序本体
3. 验证自己显卡的算力（位于trt文件目录下）
	+ 40 系：89 对应 core_40.trt
	+ 30系：86  对应 core_30.trt
	+ 【TODO】20系：75 对应 core_20.trt
	+ 其余参考此处 https://developer.nvidia.cn/cuda-gpus 。
		如果不属于上述任意一个显卡类型，说明该换电脑了，或者！参考附录编译适用自己显卡环境的trt文件
4. 安装cudnn
5. 
6. 将上述对应的trt文件，命名为 `core.trt`放入 apex_beta_0.5 包中
	![Pasted image 20240130132059.png](/img/user/attachments/Pasted%20image%2020240130132059.png)
### 附录：tensorRT onnx编译trt
1. [[Projects/ai-visual/cudnn windows install安装\|cudnn windows install安装]]
2. [[Projects/ai-visual/tensorRT 安装使用\|tensorRT 安装使用]]
3. 重复上述步骤五