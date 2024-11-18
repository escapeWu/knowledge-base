---
{"dg-publish":true,"permalink":"/01-frontend/html-and-css/css-z-index/","created":"2024-10-23T13:18:53.000+08:00","updated":"2024-10-23T13:18:53.000+08:00"}
---

#### ANKI-css z-index 在什么情况下会失效
1. 元素的定位方式不是position:absolute、position:relative、position:absolute,n:fixed 或position:sticky
2. z-index值设置为auto值。
3. 元素不在同一个堆叠上下文中。
ID: 1728616667397

#### ANKI-什么是堆叠上下文
当一个元素拥有特定的CSS属性时,会创建一个新的堆叠上下文。==新堆叠上下文中的子元素会按照它们的z-index属性在父亲堆叠上下文之中进行相对的排列。==
以下这些情况都会创建新的堆叠上下文:
+ 设置了position属性为absolute、relative、fixed或sticky 并且 z-index 不为 auto。
+ 父元素设置了 transform、opacity、filter, will-change, perspective, clip-path等特性。
ID: 1728616667398



