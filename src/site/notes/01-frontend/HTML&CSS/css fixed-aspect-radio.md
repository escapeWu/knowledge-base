---
{"dg-publish":true,"permalink":"/01-frontend/html-and-css/css-fixed-aspect-radio/","title":"css实现指定宽高比容器的两种方式","tags":["css","frontend"],"created":"2024-12-06T15:13:39.668+08:00","updated":"2024-12-06T15:39:53.769+08:00"}
---

![20241206153851_rec_-convert.gif](/img/user/attachments/20241206153851_rec_-convert.gif)
#### ANKI-padding-top实现指定宽高比的容器
**垂直方向上的内外边距使用百分比做单位时，是基于包含块的宽度来计算的**
借助这个特性，设置padding-top/bottom 可以创建一个高度为0，特定百分比的容器
```jsx
<div class="wrapper">
  <div class="intrinsic-aspect-ratio-container"></div>
</div>
.wrapper {
  width: 40vw;
}
.intrinsic-aspect-ratio-container {
  width: 100%;
  height: 0;
  padding: 0;
  padding-bottom: 75%;
  margin: 50px;
  background-color: lightsalmon;
}
```
这样是实现了固定宽高比，但其==只是一个徒有其表的空盒子，里面没有内容==。如果想在里面放入内容，我们还需要将div内部的内容使用绝对定位来充满固定尺寸的容器元素。
==内部增加 position-absolute子元素作为实际内容==
```css
.intrinsic-aspect-ratio {
  position: relative;
  width: 100%;
  height: 0;
  padding: 0;
  padding-bottom: 75%;
  margin: 50px;
  background-color: lightsalmon;
}
.content {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
}
```
ID: 1733470793694

#### ANKI-aspect-ratio实现指定宽高比的容器
```css
.box1 {
  width: 100%;
  height: auto;
  aspect-ratio: 16/9;
}
```
ID: 1733470793697
