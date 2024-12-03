---
{"dg-publish":true,"permalink":"/06-tools/linux/vm-ubuntu-add-extra-disk-space/","title":"虚拟机扩容","created":"2024-10-29T14:31:52.000+08:00","updated":"2024-11-29T14:04:25.537+08:00"}
---

情况如下，给虚拟机在平台上修改存储空间到500G，但是目标目录`ubuntu--vg-ubuntu--lv`内没有挂载扩容的空间
```bash
root@bidding-assistant-staging:/home/hithinksoft# lsblk
NAME                      MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
loop0                       7:0    0   64M  1 loop /snap/core20/2379
loop1                       7:1    0 63.7M  1 loop /snap/core20/2434
loop2                       7:2    0   87M  1 loop /snap/lxd/29351
loop3                       7:3    0 89.4M  1 loop /snap/lxd/31333
loop5                       7:5    0 38.8M  1 loop /snap/snapd/21759
loop6                       7:6    0 44.3M  1 loop /snap/snapd/23258
sda                         8:0    0  500G  0 disk
├─sda1                      8:1    0    1M  0 part
├─sda2                      8:2    0    2G  0 part /boot
└─sda3                      8:3    0   78G  0 part
  └─ubuntu--vg-ubuntu--lv 253:0    0   78G  0 lvm  /
```
### 1. 使用parted 工具，将空间分配到sda3
```bash
>>> parted /dev/sda
<<< GNU Parted 3.4
<<< Using /dev/sda
<<< Welcome to GNU Parted! Type 'help' to view a list of commands.
>>> (parted) unit GB
>>> (parted) resizepart 3 499
<<< Warning: Not all of the space available to /dev/sda appears to be used, you can fix the GPT to use all of the space (an extra 629145600 blocks) or continue with
the current setting?
<<< Fix/Ignore?
>>> Fix
<<< Partition number?
>>> 3
<<< End?  [85.9GB]?
>>> 499
>>> (parted) quit
```
## 2. 将空间从sda3分配到 `ubuntu--vg-ubuntu--lv`
```bash
>>> partprobe /dev/sda
>>> pvresize /dev/sda3

<<< Physical volume "/dev/sda3" changed
  1 physical volume(s) resized or updated / 0 physical volume(s) not resized

>>> lvextend -l +100%FREE /dev/mapper/ubuntu--vg-ubuntu--lv

<<< Size of logical volume ubuntu-vg/ubuntu-lv changed from <78.00 GiB (19967 extents) to <462.73 GiB (118458 extents).
  Logical volume ubuntu-vg/ubuntu-lv successfully resized

>>> resize2fs /dev/mapper/ubuntu--vg-ubuntu--lv

<<< resize2fs 1.46.5 (30-Dec-2021)
Filesystem at /dev/mapper/ubuntu--vg-ubuntu--lv is mounted on /; on-line resizing required
old_desc_blocks = 10, new_desc_blocks = 58
The filesystem on /dev/mapper/ubuntu--vg-ubuntu--lv is now 121300992 (4k) blocks long.
```

### 3. 查看结果
```bash
root@bidding-assistant-staging:/home/hithinksoft# lsblk
NAME                      MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
loop0                       7:0    0    64M  1 loop /snap/core20/2379
loop1                       7:1    0  63.7M  1 loop /snap/core20/2434
loop2                       7:2    0    87M  1 loop /snap/lxd/29351
loop3                       7:3    0  89.4M  1 loop /snap/lxd/31333
loop5                       7:5    0  38.8M  1 loop /snap/snapd/21759
loop6                       7:6    0  44.3M  1 loop /snap/snapd/23258
sda                         8:0    0   500G  0 disk
├─sda1                      8:1    0     1M  0 part
├─sda2                      8:2    0     2G  0 part /boot
└─sda3                      8:3    0 462.7G  0 part
  └─ubuntu--vg-ubuntu--lv 253:0    0 462.7G  0 lvm  /
```