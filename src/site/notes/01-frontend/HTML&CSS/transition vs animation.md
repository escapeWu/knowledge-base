---
{"dg-publish":true,"permalink":"/01-frontend/html-and-css/transition-vs-animation/","created":"2024-09-23T09:56:14.387+08:00","updated":"2024-09-23T10:00:42.544+08:00"}
---

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