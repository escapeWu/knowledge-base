---
{"dg-publish":true,"permalink":"/tools/python/python-file-operation/","created":"2024-02-01T10:49:24.000+08:00","updated":"2024-02-01T10:49:24.000+08:00"}
---

#file
### 通过with open 读写文件
```python
with open(label_file_path, 'w+') as file: 
	lines = file.readlines()
	# some operations on line
	file.writelines(flipped_lines)
```

```
 The argument mode points to a string beginning with one of the following
 sequences (Additional characters may follow these sequences.):

 ``r''   读取.  The stream is positioned at the
         beginning of the file.

 ``r+''  读写，追加.  The stream is positioned at the
         beginning of the file.

 ``w''   写操作，覆盖。Truncate file to zero length or create text file for writing.
         The stream is positioned at the beginning of the file.

 ``w+''  读写，覆盖。Open for reading and writing.  The file is created if it does not
         exist, otherwise it is truncated.  The stream is positioned at
         the beginning of the file.

 ``a''   追加写。Open for writing.  The file is created if it does not exist.  The
         stream is positioned at the end of the file.  Subsequent writes
         to the file will always end up at the then current end of file,
         irrespective of any intervening fseek(3) or similar.

 ``a+''  追加读写，如果文件不存在创建一个。Open for reading and writing.  The file is created if it does not
         exist.  The stream is positioned at the end of the file.  Subse-
         quent writes to the file will always end up at the then current
         end of file, irrespective of any intervening fseek(3) or similar.
```

+ `file.readlines` 用于读取文件的所有行，并将其存储为列表
+ `file.writelines` 按行写入数据
