---
{"dg-publish":true,"permalink":"/01-frontend/html-and-css/css-media-query/","title":"谈谈你对媒体查询的理解","created":"2024-10-23T13:42:57.000+08:00","updated":"2024-10-23T13:42:57.000+08:00"}
---

#### ANKI-媒体查询的使用方式
**@media的写法：**
```css
@media：最简单常规的写法
@media screen：应用于显示器、平板电脑、智能手机等屏幕设备
@media print：应用于打印机、打印预览等设备
@media speech：应用于屏幕阅读器
...
```
在 _W3C_ 中共列出了 _10_ 种媒体类型，如下表所示：

| 值          | 设备类型                     |
| ---------- | ------------------------ |
| All        | 所有设备                     |
| Braille    | 盲人用点字法触觉回馈设备             |
| Embossed   | 盲文打印机                    |
| Handheld   | 便携设备                     |
| Print      | 打印用纸或打印预览视图              |
| Projection | 各种投影设备                   |
| Screen     | 电脑显示器                    |
| Speech     | 语音或音频合成器                 |
| Tv         | 电视机类型设备                  |
| Tty        | 使用固定密度字母栅格的媒介，比如电传打字机和终端 |

**@media 可以添加多个多个条件，用逗号分隔：**
+ and 操作符用于将多个媒体查询规则组合成单条媒体查询，
+ only运算符仅在整个查询匹配时才用于应用样式，并且对于防止较早的浏览器应用所选样式很有用。
+ 逗号用于将多个媒体查询合并为一个规则。
	+ `@media screen, print`
+ not运算符用于否定媒体查询，如果不满足这个条件则返回true，否则返回false。
```css
@media screen and (max-width: 600px), screen and (orientation: landscape) {}
```
当设备的屏幕宽度小于或等于 600 像素，并且设备是横向显示时
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