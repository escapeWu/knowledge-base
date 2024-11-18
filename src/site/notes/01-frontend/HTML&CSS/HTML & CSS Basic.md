---
{"dg-publish":true,"permalink":"/01-frontend/html-and-css/html-and-css-basic/","created":"2024-10-23T14:39:05.000+08:00","updated":"2024-10-23T14:39:05.000+08:00"}
---

#### ANKI-常见元素种类有哪些？
[[01-frontend/HTML&CSS/HTML & CSS Basic\|HTML & CSS Basic]]
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
ID: 1717061092117





#### ANKI-a 标签作用
> 共6个，
1. 超链接 `<a href="link">link</a>`
2. 打电话 `<a href="tel:18722232223">联系我们</a>`
3. 发邮件 `<a href="mailto:evelance@gmail.com">发送邮件</a>`
4. 锚点定位 `<a href="#div1">去id为div1的位置去</a>`
5. 协议限定符 `<a href="javascript:alert('hello world')">打开弹窗</a>`
	1. 禁止刷新页面：`<a href="javascript:;">无法跳转</a>` （`javascript:;`）
ID: 1717061092121




#### ANKI-说下元素嵌套?

- 内联元素可以嵌套内联元素
- 块元素能嵌套任何元素
- ==**p 标签不能嵌套 div**==
- **a 标签不能嵌套 a 标签**
ID: 1717061092124



#### ANKI-什么是盒模型？
盒模型描述了html元素所占的空间。包括content, border, padding, margin
+ `content`，即实际内容，显示文本和图像
+ `boreder`，即边框
+ `padding`，即内边距，受background影响
+ `margin`，即外边距
ID: 1717061092126




#### ANKI-说下标准盒子模型和IE怪异盒子模型
标准盒子模型:
- 盒子总宽度 = width + padding + border + margin;
- 盒子总高度 = height + padding + border + margin
IE 怪异盒子模型：
+ 盒子总宽度 = width + margin;
+ 盒子总高度 = height + margin;
ID: 1717061092129



#### ANKI-说下 css的Box-sizing属性
CSS 中的 box-sizing 属性定义了引擎应该如何计算一个元素的总宽度和总高度
语法：
```css
box-sizing: content-box|border-box|inherit:
```
+ content-box(默认值)：元素的width/height 不包括 padding, border，与标准盒模型表现一致
+ border-box: 元素的width/height 包括padding, border, 与怪异盒模型表现一致
+ inherit：从父元素继承
ID: 1717061092132



#### ANKI-CSS选择器有哪些？
在CSS中，选择器用于选择HTML元素并应用样式。以下是一些常用的CSS选择器：
1. **元素选择器**：直接选择HTML标签。
   ```css
   p {
       color: blue;
   }
   ```
2. **类选择器**：选择具有指定类名的元素，类名以`.`开头。
   ```css
   .myClass {
       font-size: 16px;
   }
   ```
3. **ID选择器**：选择具有指定ID的元素，ID以`#`开头。
   ```css
   #myId {
       background-color: yellow;
   }
   ```
4. **属性选择器**：选择具有指定属性的元素。
   ```css
   /* 存在 title 属性的 <a> 元素 */
	a[title] {
	  color: purple;
	}
	/* 存在 href 属性并且属性值匹配"https://example.org"的 <a> 元素 */
	a[href="https://example.org"]
	{
	  color: green;
	}
	/* 存在 href 属性并且属性值包含"example"的 <a> 元素 */
	a[href*="example"] {
	  font-size: 2em;
	}
	/* 存在 href 属性并且属性值结尾是".org"的 <a> 元素 */
	a[href$=".org"] {
	  font-style: italic;
	}
	/* 存在 class 属性并且属性值包含单词"logo"的<a>元素 */
	a[class~="logo"] {
	  padding: 2px;
	}
   ```
5. **后代选择器**：选择某个元素内的所有指定后代元素。
   ```css
   div p {
       margin: 10px;
   }
   ```
6. **子选择器**：选择某个元素的直接子元素。
   ```css
	/* 选择属于“my-things”类的无序列表（ul）的直接子列表元素（li） */
	ul.my-things > li {
	  margin: 2em;
	}
   ```
7. **相邻兄弟选择器**：选择紧接在另一个元素后的元素。
   ```css
	/* 图片后面紧跟着的段落将被选中 */
	img + p {
	  font-weight: bold;
	}
   ```
8. **通用选择器**：选择所有元素，使用`*`。
   ```css
   * {
       box-sizing: border-box;
   }
   ```
9. **伪类选择器**：选择元素的特定状态，如`:hover`、`:active`、`:focus`等。
   ```css
   a:hover {
       color: red;
   }
   ```
10. **伪元素选择器**：选择元素的特定部分，如`::before`、`::after`等。
    ```css
    p::before {
        content: "Note: ";
        font-weight: bold;
    }
    ```
11. **群组选择器**：将多个选择器组合在一起，以同样的样式应用到多个元素上。
    ```css
    h1, h2, h3 {
        margin-bottom: 20px;
    }
    ```
ID: 1717061092134



#### ANKI-什么是margin 塌陷，如何避免？
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
==**如何解决？讲下原理？**==
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
ID: 1717061092137



#### ANKI-谈谈你对BFC的理解？
`BFC`目的是形成一个相对于外界完全独立的空间，让内部的子元素不会影响到外部的元素
**触发条件**
触发`BFC`的条件包含不限于：
- 浮动元素：float值为left、right
- position的值为absolute或fixed
- overflow值为 auto、scroll、hidden
- flex和grid布局， diplay和table相关的，比如table, table-cell等
**BFC 形成后，会有什么渲染规则？**
- 内部的盒子会在垂直方向上一个接一个的放置
- 同一个BFC的俩个相邻的盒子的margin会发生重叠，与方向无关。
- BFC的区域不会与float的元素区域重叠
- 计算BFC的高度时，浮动子元素也参与计算 [[01-frontend/HTML&CSS/css浮动 与 BFC\|css浮动 与 BFC]]
- BFC就是页面上的一个隔离的独立容器，容器里面的子元素不会影响到外面的元素，反之亦然
**应用**：
1. 阻止margin重叠
2. 浮动元素清除
3. 自适应容器
4. 隔离float元素
ID: 1717061092139



#### ANKI-元素水平垂直居中的方法有哪些？
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
ID: 1717061092141


#### ANKI-说下你理解的Grid 布局？
[GRID 布局详细说明](https://juejin.cn/post/7160485893810667534)
`grid-template-areas, grid-template-rows, grid-template-colums, grid-gap, grid-colum, grid-row`
==基本概念==
1. **Grid Container**: 任何一个元素都可以成为Grid容器，只需要在其CSS中设置`display: grid`或`display: inline-grid`。Grid容器会包含所有的Grid项。
2. **Grid Items**: Grid容器中的直接子元素自动成为Grid项，可以在Grid容器内进行布局。
==核心属性==
1. **grid-template-columns 和 grid-template-rows**: 这两个属性定义了Grid容器的列和行。可以使用像素、百分比、fr单位等来定义每个轨道的大小。例如：
   ```css
   .container {
       display: grid;
       grid-template-columns: 1fr 2fr 1fr;
       grid-template-rows: 100px 200px;
   }
   // fr 表示剩余空间。
   ```
2. **grid-gap**: 也称为`gap`，用于设置行和列之间的间距。可以分别设置行间距（`row-gap`）和列间距（`column-gap`）。
   ```css
   .container {
       display: grid;
       grid-template-columns: 1fr 1fr;
       gap: 10px;
   }
   ```
==布局控制==
1. **grid-column 和 grid-row**: 这些属性用于放置Grid项。它们允许我们指定Grid项跨越多少列和行。
   ```css
   .item {
       grid-column: 1 / 3; // 表示元素的列位置从第 1 列开始，跨越到第 3 列（不包括第 3 列），因此它会占据第 1 列和第 2 列的位置。
       grid-row: 1 / 2; // 表示元素的行位置从第 1 行开始，到第 2 行结束（不包括第 2 行），因此它只占据第 1 行的位置
   }
   ```
2. **grid-area**: 这个属性可以同时定义Grid项的行和列的起始和结束位置。
   ```css
   .item {
       grid-area: 1 / 1 / 2 / 3;
   }
   ```
==高级功能==
1. **Named Grid Areas**: 通过命名区域，可以更直观地定义复杂布局。
   ```css
   .container {
       display: grid;
       grid-template-areas: 
           "header header"
           "sidebar content"
           "footer footer";
   }
   .header {
       grid-area: header;
   }
   .sidebar {
       grid-area: sidebar;
   }
   .content {
       grid-area: content;
   }
   .footer {
       grid-area: footer;
   }
   ```
2. **Auto-placement**: Grid布局还支持自动放置算法，可以根据内容自动填充网格。
   ```css
   .container {
       display: grid;
       grid-template-columns: repeat(auto-fill, minmax(100px, 1fr));
   }
   ```
==响应式设计==
Grid布局非常适合响应式设计。通过媒体查询，可以轻松调整网格布局以适应不同的屏幕尺寸。
```css
.container {
    display: grid;
    grid-template-columns: 1fr;
}
@media (min-width: 600px) {
    .container {
        grid-template-columns: 1fr 1fr;
    }
}
```
ID: 1717061092144


#### ANKI-什么是回流，什么是重绘？什么场景下会触发？我们如何减少回流来优化性能？
==回流（Reflow）==
回流，也称为布局（Layout），是指当页面的结构发生变化，浏览器需要重新计算元素的位置和尺寸。回流会影响页面的布局，因此可能会导致整个页面或部分页面的重新渲染。
==触发回流的情况：==
1. 添加或删除可见的DOM元素。
2. 元素的尺寸、边距、边框、填充、宽度和高度等样式发生变化。
3. 浏览器窗口的大小发生变化（例如，用户调整窗口大小）。
4. 读取某些属性（如offsetxxx, clientXXX, scrollXXX等），因为这些操作需要确保布局信息是最新的。
	1. ==offset==Top、offsetLeft、 offsetWidth、offsetHeight、
	2. ==client==Top、clientLeft、clientWidth、clientHeight`
	3. ==scroll==Top、scrollLeft、scrollWidth、scrollHeight、
5. 改变页面的字体大小。
==重绘（Repaint）==
重绘是指元素的外观发生变化，但并不影响布局。重绘仅仅是重新绘制元素的外观，比如改变元素的颜色、背景、可见性等。
==触发重绘的情况：==
1. 改变元素的颜色。
2. 改变元素的背景图像。
3. 改变元素的可见性（例如，使用 `visibility: hidden`）。
==回流和重绘对性能的影响==
回流的开销通常比重绘大，因为回流不仅需要重新计算元素的几何属性，还需要重新构建渲染树，可能导致整个页面的重新布局。重绘虽然相对开销较小，但如果频繁发生，也会影响性能。
==性能优化建议：==
1. **减少DOM操作**：尽量减少对DOM的直接操作，需要大量操作DOM时，可以先将元素设置为不可见（`display: none`），操作完成后再显示。
3. **批量修改样式**：避免逐一修改元素的样式，尽量使用CSS类来批量应用样式。
4. **使用CSS动画替代JavaScript动画**：CSS动画通常会比JavaScript动画更高效，因为它们可以利用浏览器的优化机制。
5. **避免读取会触发回流的属性**：尽量避免频繁读取会触发回流的属性，如 `offsetHeight`、`offsetWidth` 等。
ID: 1717061776357


#### ANKI-浏览器解析渲染页面的流程
![Pasted image 20240226174126.png](/img/user/attachments/Pasted%20image%2020240226174126.png)
- 解析HTML，生成DOM树，解析CSS，生成CSSOM树
- 将DOM树和CSSOM树结合，生成渲染树(Render Tree)
- ==Layout(回流)==:根据生成的渲染树，进行回流(Layout)，得到节点的==几何信息==（位置，大小）
- ==Painting(重绘)==:根据渲染树以及回流得到的几何信息，得到节点的==绝对像素==
- ==Display==:将像素发送给GPU，展示在页面上




#### ANKI-为什么获取特定属性值，也会触发重绘？
由于每次重排都会造成额外的计算消耗，因此==大多数浏览器都会通过队列化修改并批量执行来优化重排过程==。浏览器会将修改操作放入到队列里，直到过了一段时间或者操作达到了一个阈值，才清空队列。
当你获取布局信息的操作的时候，==会强制队列刷新==，包括前面讲到的`offsetTop`等方法都会返回最新的数据
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
ID: 1717061776361



#### ANKI-css 有哪些属性可以继承：
主要回答 字体，文本，元素可见性 详细，额外补充表格布局，不要求具体
字体系列属性:
```css
font-family:规定元素的字体系列
font-weight:设置字体的粗细
font-size:设置字体的尺寸, small, medium, larger
font-style:定义字体的风格，normal, italic（斜体）
font-variant:偏大或偏小的字体 normal, small-caps(小型大写字母)
```
文本：
```css
text-indent：文本缩进
text-align：文本水平对齐
text-shadow：设置文本阴影
line-height：行高
word-spacing：增加或减少**单词**间的空白（即字间隔）
letter-spacing：增加或减少**字符**间的空白（字符间距）
text-transform：控制文本大小写
direction：规定文本的书写方向
color：文本颜色
```
元素可见性：
```css
visibility
```
表格布局属性(用的少，记住标题就行)
```css
caption-side：定位表格标题位置
border-collapse：合并表格边框
border-spacing：设置相邻单元格的边框间的距离
empty-cells：单元格的边框的出现与消失
table-layout：表格的宽度由什么决定
```
ID: 1717061776365


