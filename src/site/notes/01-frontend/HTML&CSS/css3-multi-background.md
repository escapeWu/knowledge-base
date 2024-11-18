---
{"dg-publish":true,"permalink":"/01-frontend/html-and-css/css3-multi-background/","created":"2024-09-30T10:50:37.000+08:00","updated":"2024-09-30T10:50:37.000+08:00"}
---

#### ANKi-如何为一个元素设置多个背景图片，并控制多个图片的位置
```css
.box {
    width: 300px;
    height: 200px;
    background-image: url('background1.jpg'), url('background2.png');
    background-position: center, top left;
    background-size: cover, auto;
    background-repeat: no-repeat, repeat;
}
```
- **`background-image`**：指定多个背景图片，使用逗号分隔。
- **`background-position`**：为每个背景图片设置不同的位置。
- **`background-size`**：可以设置每个背景图片的大小，例如 `cover` 表示覆盖整个元素，而 `auto` 表示保持原始大小。
- **`background-repeat`**：控制背景图片是否重复。

#### ANKI-border-image 边框图片如何做
![Pasted image 20240923102239.png](/img/user/attachments/Pasted%20image%2020240923102239.png)， 宽度为30px
假设有上述图片，希望实现效果如下
![Pasted image 20240923102307.png](/img/user/attachments/Pasted%20image%2020240923102307.png)
```css
border-image: url('/media/examples/border-diamonds.png') 30/19px round;
```
+ 30: 这个值表示图片的切割区域（或称为 _slice_），意思是从图片的四个边向内切割 30 像素。切割后，图片被分成 9 个区域（四个角、四条边和中心），用于构成边框。
+ 这里的 `19px` 指的是边框的宽度，也就是边框本身的厚度。换句话说，它定义了从切割后的图片部分中绘制出的边框的厚度为 19 像素。
+ 该值定义了图片在边框中的重复方式。`round` 表示将切割的图片部分按比例缩放，使它能均匀地铺满边框，不会留下空隙。如果图片不能完美地填满边框，`round` 会调整图片大小以适应边框的尺寸。
ID: 1727664637106
