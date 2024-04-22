---
{"dg-publish":true,"permalink":"/projects/ai-visual/tensor-rt/","created":"2024-04-10T17:36:40.000+08:00","updated":"2024-04-10T17:36:40.000+08:00"}
---


+ 入口：https://developer.nvidia.cn/tensorrt-download
+ [8.4.3.1（8.4 GA Update 2)](https://developer.nvidia.com/compute/machine-learning/tensorrt/secure/8.4.3/zip/TensorRT-8.4.3.1.Windows10.x86_64.cuda-11.6.cudnn8.4.zip)

+ 将tensorRT 解压复制到 `C:\Program Files\NVIDIA GPU Computing Toolkit`
+ 将目录下的lib 文件路径加入path
	`C:\Program Files\NVIDIA GPU Computing Toolkit\TensorRT-8.4.3.1\lib`
OR
**tensorRT文件复制：**
+ 将TensorRT/lib下所有lib复制到cuda/v11.6/lib/x64下，
+ 将TensorRT/lib下所有dll复制到cuda/v11.6/bin下
+ ,将TensorRT/include下所有.h文件复制到cuda/v11.6/include下

==管理员Powershell== 在bin 目录下执行生成trt文件
```
trtexec --onnx=0122s.onnx --saveEngine=yolov8n_fp16.trt --fp16
```

