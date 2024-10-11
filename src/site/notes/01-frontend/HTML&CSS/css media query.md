---
{"dg-publish":true,"permalink":"/01-frontend/html-and-css/css-media-query/","title":"谈谈你对媒体查询的理解","created":"2024-10-11T10:21:49.441+08:00","updated":"2024-10-11T11:17:47.464+08:00"}
---

#### ANKI-媒体查询的使用方式
```css
/* 直接在CSS文件中使用 */
@media (min-width: 600px) {
  body {
    background-color: lightblue;
  }
}
/* 通过link标签 */
<link rel="stylesheet" media="screen and (max-width: 600px)" href="style.css">
/* 使用import语句 */
@import url("style.css") screen and (max-width: 600px);
```
ID: 1728616667400

#### ANKI-媒体查询如何适配不同设备
```css
/* 手机设备 */
@media (max-width: 480px) {
  body {
    background-color: pink;
  }
}
/* 平板设备 */
@media (min-width: 481px) and (max-width: 1024px) {
  body {
    background-color: lightgreen;
  }
}
/* 桌面电脑 */
@media (min-width: 1025px) {
  body {
    background-color: lightblue;
  }
}
```
ID: 1728616667401
