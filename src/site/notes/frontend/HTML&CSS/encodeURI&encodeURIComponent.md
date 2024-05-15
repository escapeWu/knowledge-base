---
{"dg-publish":true,"permalink":"/frontend/html-and-css/encode-uri-and-encode-uri-component/","created":"2024-05-15T15:57:14.936+08:00","updated":"2024-05-15T16:00:54.267+08:00"}
---


+ URL元字符：URL 元字符：分号（`;`），逗号（`,`），斜杠（`/`），问号（`?`），冒号（`:`），at（`@`），`&`，等号（`=`），加号（`+`），美元符号（`$`），井号（`#`）
+ 语义字符：`a-z`，`A-Z`，`0-9`，连词号（`-`），下划线（`_`），点（`.`），感叹号（`!`），波浪线（`~`），星号（`*`），单引号（`'`），圆括号（`()`）

encodeURI: 将==**元字符和语义字符之外**==的字符，都进行转义
```js
encodeURI('https://www.baidu.com/s?ie=UTF-8&wd=中国')
// 输出: https://www.baidu.com/s?ie=UTF-8&wd=%E4%B8%AD%E5%9B%BD
```

encodeURIComponent: 会转码==除了语义字符之外的所有字符==
```js
// 对URL中的特殊编码字符部分进行转码
'https://www.baidu.com/s?ie=UTF-8&wd='+encodeURIComponent('中国')
//输出: "https://www.baidu.com/s?ie=UTF-8&wd=%E4%B8%AD%E5%9B%BD"

// 对URL中的回调链接进行转码
'https://www.baidu.com/s?returnURL=' +encodeURIComponent('http://www.test.com/')
//输出: "https://www.baidu.com/s?returnURL=http%3A%2F%2Fwww.test.com%2F"

```