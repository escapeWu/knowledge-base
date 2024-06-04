---
{"dg-publish":true,"permalink":"/frontend/js/file-reader-api/","created":"2024-05-29T23:33:13.000+08:00","updated":"2024-05-30T17:54:34.342+08:00"}
---

#frontend #browser #FileReader
#js
#### ANKI-filereader api 读取本地文件方式
##### load event：file 被成功读取后执行
支持两种语法：
```js
const reader = new FileReader();
//
reader.addEventListener("load", () => {});
// OR
reader.onload = (event) => {};
```
在onload 触发后，我们可以在callback中 通过 reader.result 获取加载的文件数据
###### readAsBinaryString
Example1: 读取图片，转换为Base64 字符串

```js
const fileInput = document.getElementById('fileInput');
fileInput.addEventListener('change', function(event) {
	const file = event.target.files[0];
	if (file) {
		reader(file, (err, data) => {
			if (err) {
				console.error('Error reading file:', err);
			} else {
				console.log('Base64 string:', data);
				// You can now use the Base64 string, for example to display the image
				const img = document.createElement('img');
				img.src = data;
				document.body.appendChild(img);
			}
		});
	}
});
```

