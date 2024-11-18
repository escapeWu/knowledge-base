---
{"dg-publish":true,"permalink":"/01-frontend/html-and-css/css/","created":"2024-09-23T10:01:02.000+08:00","updated":"2024-09-23T10:01:02.000+08:00"}
---

#### ANKI-css选择器有哪些？
+ 通配符选择器：`*`
+ 元素选择器: `div p`
+ id选择器: `id=xxx`
+ 类选择器: `.class`
+ 伪元素选择器: `::befor ::after`
+ ==属性选择器==: `[attr=xxx]`
+ ==层次选择器==：后代选择器、子选择器、相邻兄弟选择器、通用兄弟选择器
+ ==伪类选择器==：`div:hover`、==nth-child==
ID: 1726033131680


#### ANKI-详细说下层次选择器
+ 后代：比如某个div下所有嵌套的p `div p`
+ 子元素：比如某个ul下的第一层所有li `ul>li`
+ 相邻元素：`h1+p`
+ 同层所有元素: `h1~p`
```js
/* 后代选择器，优先级：2 */
div p {
  color: red;
} 
/* 子元素选择器，优先级：2 */
ul > li {
  list-style: none;
} 
/* 相邻兄弟选择器，优先级：2 */
h1 + p {
  margin-top: 0;
} 
/* 通用兄弟选择器，优先级：2 */
h1 ~ p {
  color: grey;
} 
```
ID: 1726033131686

#### ANKI-说下属性选择器的用法
记忆的时候，想想正则
+ 以某个值开头 `[attribute^=value]`
+ 以某个值结尾`[attribute$=value]`
+ 包含某个值`[attribute*=value]`
+ 完全等于某个值`[attribute=value]`
ID: 1726033131690

#### ANKI-说下css选择器的优先级
从高到低（权重）依次为:
+ 内联样式: 1000
+ ID选择器: 100
+ 类选择器，属性选择器，伪类选择器：10
+ 元素选择器和伪元素选择器：1
+ 通配符，层次选择器：0
ID: 1726033131693
