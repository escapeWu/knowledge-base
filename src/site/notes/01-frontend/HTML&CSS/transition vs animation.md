---
{"dg-publish":true,"permalink":"/01-frontend/html-and-css/transition-vs-animation/","title":"transition 和 animation的区别","created":"2024-10-23T10:20:48.000+08:00","updated":"2024-10-23T10:20:48.000+08:00"}
---

#### ANKI-transition 和 animation的区别
transition: 定义属性变化时候的过渡效果。transition 只能再两个状态之间转换，需要某个事件触发（鼠标悬停，点击）
animation: 通过关键帧来控制，在多个状态之间变换，页面加载后自动执行
```css
@keyframes example {
	from {background-color: red;}
	to {background-color: yellow;}
}
.box{
	width: 100px;
	height:100px;
	background-color: red;
	animation: example 5s infinite;
}
```
ID: 1729650048006
