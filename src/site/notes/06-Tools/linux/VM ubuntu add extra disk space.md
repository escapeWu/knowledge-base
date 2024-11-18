---
{"dg-publish":true,"permalink":"/06-tools/linux/vm-ubuntu-add-extra-disk-space/","title":"ubuntu虚拟机扩容","created":"2024-10-29T14:31:52.000+08:00","updated":"2024-10-29T14:31:52.000+08:00"}
---

## 问题：
```
我在虚拟机控制端增加了 额外的空间，fdisk -l 结果如下：
Disk /dev/sda: 549.8 GB, 549755813888 bytes, 1073741824 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk label type: dos
Disk identifier: 0x0000065f

   Device Boot      Start         End      Blocks   Id  System
/dev/sda1   *        2048     2099199     1048576   83  Linux
/dev/sda2         2099200   251658239   124779520   8e  Linux LVM

Disk /dev/mapper/centos-root: 53.7 GB, 53691285504 bytes, 104865792 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/mapper/centos-swap: 8455 MB, 8455716864 bytes, 16515072 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/mapper/centos-home: 65.6 GB, 65624080384 bytes, 128172032 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes

我如何将空间分配给 /centos/root
```

## 方案
要将新增的空间分配给`/dev/mapper/centos-root`，您可以按照以下步骤进行操作：

### 1. 确认新空间是否可用
从`fdisk -l`的输出来看，您已经在虚拟机控制台上增加了空间。但由于`/dev/sda2`已经用作LVM分区，新的空间尚未分配给`/dev/sda2`。您需要创建一个新的分区或调整`/dev/sda2`的大小，使其包含新增的空间。

### 2. 扩展 /dev/sda2 分区
您可以使用`fdisk`工具扩展`/dev/sda2`分区的大小，使其包含新增的空间。

#### 步骤：
1. 进入`fdisk`并选择磁盘`/dev/sda`：
   ```bash
   sudo fdisk /dev/sda
   ```
2. 删除现有的`/dev/sda2`分区（不会丢失数据，因为LVM会处理现有的物理卷）：
   - 输入`d`，选择`2`来删除`/dev/sda2`。
3. 创建新的分区以使用额外空间：
   - 输入`n`，创建一个新分区。
   - 选择`p`（主分区），并输入分区号`2`。
   - 设置分区的起始位置与之前的`/dev/sda2`相同（在您情况中应为`2099200`）。
   - 将分区的结束位置扩展到整个新磁盘大小。
4. 更改分区类型：
   - 输入`t`，选择分区号`2`。
   - 设置类型为`8e`（Linux LVM）。
5. 保存更改并退出：
   - 输入`w`保存并退出。

### 3. 刷新分区表
重新读取分区表（可以通过`partprobe`命令）：

```bash
sudo partprobe
```

### 4. 扩展物理卷（PV）
将新分区空间分配给LVM的物理卷：

```bash
sudo pvresize /dev/sda2
```

### 5. 扩展逻辑卷（LV）
将新增的空间分配给`centos-root`逻辑卷。可以选择分配具体的大小或全部空闲空间：

```bash
sudo lvextend -l +100%FREE /dev/centos/root
```

### 6. 扩展文件系统
调整文件系统以利用新的空间：

```bash
sudo xfs_growfs /
```

### 7. 验证结果
确认`/dev/mapper/centos-root`的大小：

```bash
df -h /
```

完成后，`/centos/root`的空间应该已经增加了。