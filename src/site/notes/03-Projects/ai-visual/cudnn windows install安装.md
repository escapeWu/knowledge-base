---
{"dg-publish":true,"permalink":"/03-projects/ai-visual/cudnn-windows-install/","created":"2024-05-27T15:03:23.000+08:00","updated":"2024-05-27T15:03:23.000+08:00"}
---

以cudnn8.4为例
1. 安装Nvidia 驱动
2. 安装CUDA 对应的版本（[win11_11.6](https://developer.nvidia.com/cuda-11-6-0-download-archive?target_os=Windows&target_arch=x86_64&target_version=11&target_type=exe_local)）
3. [==安装Zlib==](http://www.winimage.com/zLibDll/zlib123dllx64.zip)
	>将 `zlibwapi.dll`所在的目录加入 PATH 环境变量
4. 安装[cudnn（8.4.1）](https://developer.nvidia.com/compute/cudnn/secure/8.4.1/local_installers/11.6/cudnn-windows-x86_64-8.4.1.50_cuda11.6-archive.zip)
	1. 解压cudnn 下载包，放入`C:\Program Files\NVIDIA\CUDNN\v8.x`
	2. 设置环境变量
		>[[06-Tools/windows/windows Environment Variables 环境变量如何打开\|windows Environment Variables 环境变量如何打开]]
	```
	Variable Name: PATH 
	Value to Add: C:\Program Files\NVIDIA\CUDNN\v8.x
	```