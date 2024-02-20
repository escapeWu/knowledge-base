---
{"dg-publish":true,"permalink":"/frontend/file-reader-api-common-usage/","created":"2024-01-17T10:55:05.000+08:00","updated":"2024-01-17T10:55:05.000+08:00"}
---

#frontend #browser #FileReader
### load event：file 被成功读取后执行
支持两种语法：
```js
const reader = new FileReader();

reader.addEventListener("load", () => {});
// OR
reader.onload = (event) => {};
```
在onload 触发后，我们可以在callback中 通过 reader.result 获取加载的文件数据
### readAsBinaryString

### Example1: 读取图片，转换为Base64 字符串

```js
function reader(file, callback) {
	const fr = new FileReader()
	fr.onload = () => callback(null, fr.result)
	fr.onerror = err => callback(err)
	fs.readAsDataURL(file)
}

docu
```

