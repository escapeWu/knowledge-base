---
{"dg-publish":true,"permalink":"/01-frontend/html-and-css/why-translate-instead-of-position/","title":"为什么有时候使用translate而不是position？","created":"2024-10-12T13:58:00.000+08:00","updated":"2024-10-12T13:58:00.000+08:00"}
---

#### ANKI-为什么有时候使用translate而不是position？
+ 只会造成Repaint：translate是CSSTransform属性的一部分,通过矩阵变换(matrix Transformations)来操作元素的视觉位置。不会影响文档的布局结构,所以不会触发Reflow,只会造成Repaint
+ GPU加速
ID: 1727664637101



