---
{"dg-publish":true,"permalink":"/interview/html-and-css/","created":"2024-02-21T11:16:32.135+08:00","updated":"2024-02-22T17:56:13.538+08:00"}
---

#### 常见元素种类有哪些？
- 行内元素 `inline`
    - 不会独占一行；相邻的排同一行；一行排不下会换行
    - ==不可设置宽高==
    - ==`padding`、`margin` **水平方向上设置有效**，垂直方向上无效==
- 行内块元素 `inline-block`
    - 和其他元素同一行（行内元素特点）
    - 可以设置宽高（块级元素特点）
    - `padding`、`margin` 设置有效
- 块级元素 `block`
    - 独占一行
    - 可以设置宽高
    - `padding`、`margin` 设置有效
<!--ID: 1708485724154-->



#### a 标签作用
> 共6个，
1. 超链接 `<a href="link">link</a>`
2. 打电话 `<a href="tel:18722232223">联系我们</a>`
3. 发邮件 `<a href="mailto:evelance@gmail.com">发送邮件</a>`
4. 锚点定位 `<a href="#div1">去id为div1的位置去</a>`
5. 协议限定符 `<a href="javascript:alert('hello world')">打开弹窗</a>`
	1. 禁止刷新页面：`<a href="javascript:;">无法跳转</a>` （`javascript:;`）
<!--ID: 1708486282901-->


#### 说下元素嵌套?

- 内联元素可以嵌套内联元素
- 块元素能嵌套任何元素
- **p 标签不能嵌套 div**
- **a 标签不能嵌套 a 标签**
<!--ID: 1708486282905-->

#### 什么是盒模型？
盒模型描述了html元素所占的空间。包括content, border, padding, margin
+ `content`，即实际内容，显示文本和图像
+ `boreder`，即边框
+ `padding`，即内边距，受background影响
+ `margin`，即外边距
<!--ID: 1708501139898-->


#### 说下标准盒子模型和IE怪异盒子模型
标准盒子模型:
- 盒子总宽度 = width + padding + border + margin;
- 盒子总高度 = height + padding + border + margin
IE 怪异盒子模型：
+ 盒子总宽度 = width + margin;
+ 盒子总高度 = height + margin;
<!--ID: 1708501139903-->

#### 说下 css的Box-sizing属性
CSS 中的 box-sizing 属性定义了引擎应该如何计算一个元素的总宽度和总高度
语法：
```css
box-sizing: content-box|border-box|inherit:
```
+ content-box(默认值)：元素的width/height 不包括 padding, border，与标准盒模型表现一致
+ border-box: 元素的width/height 包括padding, border, 与怪异盒模型表现一致
+ inherit：从父元素继承
<!--ID: 1708501139905-->

#### CSS选择器有哪些？
常用：
+ id选择器 `#box`
+ 类选择器 `.one`
+ 标签选择器 `div`
+ 后代选择器 `#box div` 空格
+ 子选择器 `#box>ul` >
+ 相邻同胞选择器`.one+.two` +
+ 群组选择器 `div,p` ,
**伪类**：
+ :link
+ :visited
+ :active
+ :hover
+ :focus
+ :first-child 父元素的首个子元素
**伪元素**：
+ :before 选择器在被选元素的内容前面插入内容
+ :after 选择器在被选元素的内容后面插入内容
 CSS3 新增
**伪类选择器**：
1. `:first-of-type`：选择一组同级元素中其类型的第一个元素。
	例子：`p:first-of-type` 会选择同级的段落元素中的第一个段落。
2. `:last-of-type`：选择一组同级元素中其类型的最后一个元素。
	例子：`div:last-of-type` 会选择同级的 `div` 元素中的最后一个 `div`。
3. `:only-of-type`：选择没有同类型兄弟元素的元素。
	例子：`span:only-of-type` 会选择没有同类型兄弟元素的 `span` 元素。
4. `:only-child`：选择没有任何兄弟的元素。 
	例子：`ul li:only-child` 会选择没有兄弟的 `li` 元素，前提是它们都在一个 `ul` 中。
5. `:nth-child(n)`：根据元素在一组同级中的位置匹配元素。
	例子：`ul li:nth-child(odd)` 会选择 `ul` 中奇数位置的 `li` 元素。
6. `:nth-last-of-type(n)`：匹配给定类型的元素，基于它们在一组兄弟元素中的位置，从末尾开始计数。 
	例子：`ul li:nth-last-of-type(2)` 会选择 `ul` 中倒数第二个 `li` 元素。
7. `:last-child`：表示一组兄弟元素中的最后一个元素。 
	例子：`div p:last-child` 会选择 `div` 中最后一个 `p` 元素。
8. `:root`：设置HTML文档。 
	例子：`:root { font-size: 16px; }` 会将文档的根元素（`<html>` 元素）的字体大小设置为16像素。
9. `:empty`：指定空的元素。 
	例子：`div:empty` 会选择没有任何子元素的 `div` 元素。
10. `:enabled`：选择可用元素。 
	例子：`input:enabled` 会选择可用的输入元素。
11. `:disabled`：选择被禁用元素。 
	例子：`button:disabled` 会选择被禁用的按钮元素。
12. `:checked`：选择选中的元素。 
	例子：`input[type="checkbox"]:checked` 会选择被选中的复选框元素。
13. `:not(selector)`：选择与 `<selector>` 不匹配的所有元素。 
	例子：`p:not(.special)` 会选择不具有 `special` 类的段落元素。
**层次选择器**（p~ul）
选择前面有p元素的每个ul元素
**属性选择器**：
1. `[attribute*=value]`：选择attribute属性值包含value的所有元素。 这个选择器会选择具有指定属性，并且属性值中包含给定值的所有元素。 例子：`input[type*="text"]` 会选择所有 `type` 属性值包含 "text" 的输入元素，比如 `<input type="text">`、`<input type="email">`。
2. `[attribute^=value]`：选择attribute属性开头为value的所有元素。 这个选择器会选择具有指定属性，并且属性值以给定值开头的所有元素。 例子：`a[href^="https://"]` 会选择所有 `href` 属性值以 "https://" 开头的链接元素。
3. `[attribute$=value]`：选择attribute属性结尾为value的所有元素。 这个选择器会选择具有指定属性，并且属性值以给定值结尾的所有元素。 例子：`img[src$=".png"]` 会选择所有 `src` 属性值以 ".png" 结尾的图像元素。
<!--ID: 1708501161608-->

#### 什么是margin 塌陷，如何避免？
CSS中的“margin塌陷”是指在垂直方向上，相邻的两个元素的外边距（margin）会合并（collapse）成一个外边距的现象。
当一个元素的顶部外边距与另一个元素的顶部外边距相遇时，它们中的较大者会覆盖较小者，而不是两者相加。
```html
<style>
    p {
        color: #f55;
        background: #fcc;
        width: 200px;
        line-height: 100px;
        text-align:center;
        margin: 100px;
    }
</style>
<body>
    <p>Haha</p >
    <p>Hehe</p >
</body>
```
![Pasted image 20240222172510.png](/img/user/attachments/Pasted%20image%2020240222172510.png)
**如何解决？讲下原理？**
可以在`p`外面包裹一层容器，并触发这个容器生成一个`BFC`，那么==两个`p`就不属于同一个`BFC`==，则不会出现`margin`重叠
```html
<style>
    .wrap {
        overflow: hidden;// 新的BFC
    }
    p {
        color: #f55;
        background: #fcc;
        width: 200px;
        line-height: 100px;
        text-align:center;
        margin: 100px;
    }
</style>
<body>
    <p>Haha</p >
    <div class="wrap">
        <p>Hehe</p >
    </div>
</body>
```
<!--ID: 1708595070632-->

#### 谈谈你对BFC的理解？
`BFC`目的是形成一个相对于外界完全独立的空间，让内部的子元素不会影响到外部的元素
**触发条件**
触发`BFC`的条件包含不限于：
- 根元素，即HTML元素
- 浮动元素：float值为left、right
- overflow值不为 visible，为 auto、scroll、hidden
- display的值为inline-block、inltable-cell、table-caption、table、inline-table、flex、inline-flex、grid、inline-grid
- position的值为absolute或fixed
**BFC 形成后，会有什么渲染规则？**
- 内部的盒子会在垂直方向上一个接一个的放置
- 对于同一个BFC的俩个相邻的盒子的margin会发生重叠，与方向无关。
- 每个元素的左外边距与包含块的左边界相接触（从左到右），即使浮动元素也是如此
- BFC的区域不会与float的元素区域重叠
- 计算BFC的高度时，浮动子元素也参与计算
- BFC就是页面上的一个隔离的独立容器，容器里面的子元素不会影响到外面的元素，反之亦然
<!--ID: 1708595070637-->

#### 元素水平垂直居中的方法有哪些？
- 利用定位+margin:auto
```css
    .father{
        width:500px;
        height:300px;
        border:1px solid #0a3b98;
        position: relative;
    }
    .son{
        width:100px;
        height:40px;
        background: #f0a238;
        position: absolute;
        top:0;
        left:0;
        right:0;
        bottom:0;
        margin:auto;
    }
```
- 利用定位+transform
```css
    .father {
        position: relative;
        width: 200px;
        height: 200px;
        background: skyblue;
    }
    .son {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%,-50%);
        width: 100px;
        height: 100px;
        background: red;
    }
```
- flex布局
```css
.father {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 200px;
	height: 200px;
	background: skyblue;
}
.son {
	width: 100px;
	height: 100px;
	background: red;
}
```
- grid布局
```css
.father {
	display: grid;
	align-items:center;
	justify-content: center;
	width: 200px;
	height: 200px;
	background: skyblue;
}
.son {
	width: 10px;
	height: 10px;
	border: 1px solid red
}
```
<!--ID: 1708595773487-->
