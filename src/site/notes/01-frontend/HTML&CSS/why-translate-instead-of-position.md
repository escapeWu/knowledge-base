---
{"dg-publish":true,"permalink":"/01-frontend/html-and-css/why-translate-instead-of-position/","created":"2024-09-23T10:00:33.493+08:00","updated":"2024-09-30T10:50:37.204+08:00"}
---

#### ANKI-为什么有时候使用translate而不是position？
+ 只会造成Repaint：translate是CSSTransform属性的一部分,通过矩阵变换(matrix Transformations)来操作元素的视觉位置。不会影响文档的布局结构,所以不会触发Reflow,只会造成Repaint
+ GPU加速
ID: 1727664637101



