# SeetaFace6OpenBinary

SeetaFace6Open和ViewFaceBridge编译静态二进制文件。
包含操作系统以及平台：

| 平台  |  操作系统 | 路径  | 备注  |
| ------------ | ------------ | ------------ | ------------ |
| x64  | Windows  |  SeetaFace\build\bin\x64 |   |
| x86  | Windows  |  SeetaFace\build\bin\x86 |   |
| x64  | Linux  | SeetaFace\build\lib64  |   |
| ARM  | Linux  | SeetaFace\build\lib\arm  |   |
| ARM64  | Linux  | SeetaFace\build\lib\arm64  |   |

### 主要目录结构
```shell
.
├─CPU
│  ├─Bridges
│  │  ├─Linux
│  │  │  └─ViewFaceBridge
│  │  │      └─bin
│  │  │          ├─Debug
│  │  │          │  ├─ARM
│  │  │          │  ├─ARM64
│  │  │          │  └─x64
│  │  │          └─Release
│  │  │              ├─ARM
│  │  │              ├─ARM64
│  │  │              └─x64
│  │  └─Windows
│  │      └─ViewFaceBridge
│  │          └─bin
│  │              ├─Debug
│  │              │  ├─x64
│  │              │  └─x86
│  │              └─Release
│  │                  ├─x64
│  │                  └─x86
│  └─SeetaFace
│      └─build
│          ├─bin
│          │  ├─x64
│          │  └─x86
│          ├─cmake
│          ├─include
│          ├─lib
│          │  ├─arm
│          │  ├─arm64
│          │  ├─x64
│          │  └─x86
│          └─lib64
└─GPU
    ├─Bridges
    │  └─Windows
    │      └─ViewFaceBridge
    │          └─bin
    │              ├─Debug
    │              │  └─x64
    │              └─Release
    │                  └─x64
    └─SeetaFace
        └─index
            └─build
                ├─bin
                │  └─x64
                ├─cmake
                ├─include
                └─lib
                    └─x64
```

### 如何使用
将`Bridges`或`SeetaFace`复制到项目`src`目录下面即可。提示替换时，可直接替换。

### 注意
GPU版本只支持Windows x64平台，其它平台未编译和测试，可以自行编译。编译工具链基于CUDA 11.7.1，使用GPU版本请先安装CUDA 11.7且需要显卡支持，应该最低需要GT 1030。
