---
{"dg-publish":true,"permalink":"/projects/ai-visual/yolov8-tensor-rt-c/","created":"2024-05-27T15:37:41.962+08:00","updated":"2024-05-27T15:03:23.000+08:00"}
---

##  仓库地址
- [Monday-Leo](https://github.com/Monday-Leo)/[YOLOv8_Tensorrt](https://github.com/Monday-Leo/YOLOv8_Tensorrt)
## 环境要求
+ **Cuda 11.6**
+ **onnx 1.12.0**: `pip install`
+ **Tensorrt 8.4.3(TensorRT 8.4 GA Update 2)
	+ **[[Projects/ai-visual/tensorRT 安装使用\|tensorRT 安装使用]]
	+ PATH: `C:\Program Files\NVIDIA GPU Computing Toolkit\TensorRT-8.4.3.1\lib`

+ **Cudnn 8.4.1** :
	+ [[Projects/ai-visual/cudnn windows install安装\|cudnn windows install安装]]
	+ PATH: `C:\Program Files\NVIDIA GPU Computing Toolkit\cudnn-8.4.1`
- opencv: 
	- PATH: `E:\Program Files\opencv\build\x64\vc15\bin`

## Quick Start

### 环境构建
1. 创建conda环境 `conda create -n yolov8-tensorrt python=3.10`
2. 使用conda环境 `conda activate yolov8-tensorrt `
3. 安装python packages：
	```bash
	pip install ultralytics==8.0.5
	pip install onnx==1.12.0
	# download offical weights(".pt" file)
	https://github.com/ultralytics/assets/releases/download/v0.0.0/yolov8n.pt
	```

### 模型导出
+ `yolo mode=export model=yolov8n.pt format=onnx dynamic=False`
+ `python v8_transform.py yolov8n.onnx`
+ tensorRT bin 目录==管理员Powershell== 执行: `trtexec --onnx=yolov8n.transd.onnx --saveEngine=yolov8n_fp16.trt --fp16`

### vs c++项目构建（cmake）
>Visual Studio 2019 Enterprise（企业版）：**BF8Y8-GN2QH-T84XB-QVY3B-RC4DF**
Visual Studio 2019 Professional（专业版）：**NYWVH-HT4XC-R2WYW-9Y3CM-X4V3Y**


**tensorRT文件复制：**
+ 将TensorRT/lib下所有lib复制到cuda/v11.6/lib/x64下，
+ 将TensorRT/lib下所有dll复制到cuda/v11.6/bin下
+ ,将TensorRT/include下所有.h文件复制到cuda/v11.6/include下
**CMAKELists.txt 修改：**
+ **Opencv**：
+ **Tensorrt**：
+ 修改`arch=compute_75;code=sm_75`，参考[https://developer.nvidia.com/zh-cn/cuda-gpus](https://developer.nvidia.com/zh-cn/cuda-gpus)，
	+ ==此处的算力相同的型号，trt文件可以共用==，否则，需要在对应机器上手动执行如下指令，手动生成trt文件，具体参考[[Projects/ai-visual/tensorRT 安装使用\|tensorRT 安装使用]]
	+ 


