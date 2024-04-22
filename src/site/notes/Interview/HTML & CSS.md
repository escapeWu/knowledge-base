---
{"dg-publish":true,"permalink":"/interview/html-and-css/","created":"2024-04-10T17:36:40.000+08:00","updated":"2024-04-10T17:36:40.000+08:00"}
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
	+ 作用于**所有子后代元素**
+ 子选择器 `#box>ul` >
	+ 用于选择指定标签元素的**第一代子元素**
	+ [link: 后端和子选择器的区别详解](https://blog.csdn.net/u012110719/article/details/41171517)
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
**选择器优先级？：**
内联 > ID选择器 > 类选择器 > 标签选择器
**CSS3 新增伪类选择器**：
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
```css
[attribute*=value]：选择attribute属性值包含value的所有元素
[attribute^=value]：选择attribute属性开头为value的所有元素
[attribute$=value]：选择attribute属性结尾为value的所有元素
input[type="text"] { 
	width:150px; 
	display:block; 
	margin-bottom:10px; 
	background-color:yellow;
}
```
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
- display的值为inline-block、 table-cell inline-block flex inline-flex grid inline-grid table-caption(表格标题)
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

#### 详细介绍下grid 布局？
![Pasted image 20240223140544.png](/img/user/attachments/Pasted%20image%2020240223140544.png)
上图是一个 2 x 3 的网格，共有3根水平网格线和4根垂直网格线
**grid-template-columns 属性，grid-template-rows 属性**
`grid-template-columns` 属性设置列宽，`grid-template-rows` 属性设置行高
```css
.wrapper {
  display: grid;
  /*  声明了三列，宽度分别为 200px 200px 200px */
  grid-template-columns: 200px 200px 200px;
  grid-gap: 5px;
  /*  声明了两行，行高分别为 50px 50px  */
  grid-template-rows: 50px 50px;
}
```
使用`repeat(次数，值)`函数，可以简写重复的值
```
grid-template-columns: repeat(3,200px);
```
其他支持的属性值：
- auto-fill：示自动填充，让一行（或者一列）中尽可能的容纳更多的单元格
> `grid-template-columns: repeat(auto-fill, 200px)` 表示==列宽是 200 px，但列的数量不固定==，只要浏览器能够容纳得下，就可以放置元素
- fr：片段，为了方便表示==比例关系==
> `grid-template-columns: 200px 1fr 2fr` 表示第一个列宽设置为 200px，后面剩余的宽度分为两部分，==宽度分别为剩余宽度的 1/3 和 2/3==
- minmax：产生一个长度范围，表示长度就在这个范围之中都可以应用到网格项目中。第一个参数就是最小值，第二个参数就是最大值
> `minmax(100px, 1fr)`表示列宽不小于`100px`，不大于`1fr`
- auto：由浏览器自己决定长度
**grid-row-gap 属性， grid-column-gap 属性， grid-gap 属性**
行间距和列间距。`grid-gap` 属性是两者的简写形式
`grid-row-gap: 10px` 表示行间距是 10px
`grid-column-gap: 20px` 表示列间距是 20px
`grid-gap: 10px 20px` 等同上述两个属性
**grid-template-areas 属性：定义区域**
用于定义区域，一个区域由一个或者多个单元格组成
```css
.container {
  display: grid;
  grid-template-columns: 100px 100px 100px;
  grid-template-rows: 100px 100px 100px;
  grid-template-areas: 'a b c'
                       'd e f'
                       'g h i';
}
```
上面代码先划分出9个单元格，然后将其定名为a到i的九个区域，分别对应这九个单元格。
==多个单元格合并成一个区域的写法如下==
```css
grid-template-areas: 'a a a'
                     'b b b'
                     'c c c';
```
上面代码将9个单元格分成a、b、c三个区域
**grid-auto-flow: 容器的子元素填充方向**
顺序就是由`grid-auto-flow`决定，默认为行，代表"先行后列"，即先填满第一行，再开始放入第二行
![Pasted image 20240223145353.png](/img/user/attachments/Pasted%20image%2020240223145353.png)
当修改成`column`后，放置变为如下：
![Pasted image 20240223145404.png](/img/user/attachments/Pasted%20image%2020240223145404.png)
**grid-area 属性**
`grid-area` 属性指定项目放在哪一个区域
```
.item-1 {
  grid-area: e;
}
```
意思为将1号项目位于`e`区域
与上述讲到的`grid-template-areas`搭配使用
<!--ID: 1708678052322-->
#### 怎么理解回流跟重绘？什么场景下会触发？
**是什么**：
每个元素都可以理解成一个盒子，在浏览器解析过程中，会涉及到回流与重绘
- 回流 `Layout`：布局引擎会根据各种样式==计算==每个盒子在页面上的==大小与位置==
- 重绘 `Painting`：当计算好盒模型的位置、大小及其他属性后，浏览器根据每个盒子特性进行==绘制==
**浏览器解析渲染页面的流程：**
![Pasted image 20240226174126.png](/img/user/attachments/Pasted%20image%2020240226174126.png)
- 解析HTML，生成DOM树，解析CSS，生成CSSOM树
- 将DOM树和CSSOM树结合，生成渲染树(Render Tree)
- ==Layout(回流)==:根据生成的渲染树，进行回流(Layout)，得到节点的==几何信息==（位置，大小）
- ==Painting(重绘)==:根据渲染树以及回流得到的几何信息，得到节点的==绝对像素==
- ==Display==:将像素发送给GPU，展示在页面上
**回流触发时机**
回流这一阶段主要是计算节点的位置和几何信息，那么==当页面布局和几何信息发生变化==的时候，就需要回流，如下面情况：
- 添加或删除可见的DOM元素
- 元素的位置发生变化
- 元素的尺寸发生变化（包括外边距、内边框、边框大小、高度和宽度等）
- 内容发生变化，比如文本变化或图片被另一个不同尺寸的图片所替代
- 页面一开始渲染的时候（这避免不了）
- 浏览器的窗口尺寸变化（因为回流是根据视口的大小来计算元素的位置和大小的）
还有一些容易被忽略的操作：==获取一些特定属性的值==
> offsetTop、offsetLeft、 offsetWidth、offsetHeight、scrollTop、scrollLeft、scrollWidth、scrollHeight、clientTop、clientLeft、clientWidth、clientHeight
+ __
这些属性有一个共性，就是需要通过即时计算得到。因此浏览器为了获取这些值，也会进行回流
**重绘触发时机**
触发回流一定会触发重绘
可以把页面理解为一个黑板，黑板上有一朵画好的小花。现在我们要把这朵从左边移到了右边，那我们要先确定好右边的具体位置，画好形状（回流），再画上它原有的颜色（重绘）
除此之外还有一些其他引起重绘行为：
- 颜色的修改
- 文本方向的修改
- 阴影的修改
**为什么获取特定属性值，也会触发重绘？**
由于每次重排都会造成额外的计算消耗，因此大多数浏览器都会通过队列化修改并批量执行来优化重排过程。浏览器会将修改操作放入到队列里，直到过了一段时间或者操作达到了一个阈值，才清空队列。
当你获取布局信息的操作的时候，会强制队列刷新，包括前面讲到的`offsetTop`等方法都会返回最新的数据
因此浏览器不得不清空队列，触发回流重绘来返回正确的值
**如何减少**
- 避免使用 `table` 布局，`table` 中每个元素的大小以及内容的改动，都会导致整个 `table` 的重新计算
- 对于那些复杂的动画，对其设置 `position: fixed/absolute`，尽可能地使元素脱离文档流，从而减少对其他元素的影响
- 使用css3硬件加速，可以让`transform`、`opacity`、`filters`这些动画不会引起回流重绘
- 避免使用 CSS 的 `JavaScript` 表达式
- 避免设置多项内联样式，如果想设定元素的样式，通过改变元素的 `class` 类名 (尽可能在 DOM 树的最里层)
- 离线操作：设置元素属性`display: none`，将其从页面上去掉，然后再进行后续操作
```javascript
let container = document.getElementById('container')
container.style.display = 'none'
container.style.width = '100px'
container.style.height = '200px'
container.style.border = '10px solid red'
container.style.color = 'red'
...（省略了许多类似的后续操作）
container.style.display = 'block'
```

#### 什么是响应式设计？如何做？
响应式设计的基本原理是通过媒体查询检测不同的设备屏幕尺寸做处理，为了处理移动端，页面头部必须有`meta`声明`viewport`
```css
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no”>
```
属性对应如下：
- width=device-width: 是自适应手机屏幕的尺寸宽度
- maximum-scale:是缩放比例的最大值
- inital-scale:是缩放的初始化
- user-scalable:是用户的可以缩放的操作
实现响应式布局的方式有如下：
- 媒体查询
- 百分比
- vw/vh
- rem
<!--ID: 1709108207591-->
#### css 选择器有哪些可以继承：
字体系列属性:
```css
font:组合字体
font-family:规定元素的字体系列
font-weight:设置字体的粗细
font-size:设置字体的尺寸
font-style:定义字体的风格
font-variant:偏大或偏小的字体
```
文本：
```css
text-indent：文本缩进
text-align：文本水平对齐
text-shadow：设置文本阴影
line-height：行高
word-spacing：增加或减少单词间的空白（即字间隔）
letter-spacing：增加或减少字符间的空白（字符间距）
text-transform：控制文本大小写
direction：规定文本的书写方向
color：文本颜色
```
元素可见性：
```css
visibility
```
表格布局属性
```css
caption-side：定位表格标题位置
border-collapse：合并表格边框
border-spacing：设置相邻单元格的边框间的距离
empty-cells：单元格的边框的出现与消失
table-layout：表格的宽度由什么决定
```
列表属性
```css
list-style-type：文字前面的小点点样式
list-style-position：小点点位置
list-style：以上的属性可通过这属性集合
```
<!--ID: 1709109474341-->
