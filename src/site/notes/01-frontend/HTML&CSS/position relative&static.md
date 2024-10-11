---
{"dg-publish":true,"permalink":"/01-frontend/html-and-css/position-relative-and-static/","title":"position relative 和 static 的区别","created":"2024-09-19T14:25:46.226+08:00","updated":"2024-09-19T14:40:04.039+08:00"}
---

#### ANKI-position relative 和 static 的区别？
static 为默认值，relative 是相对位置，我可以给它设置left, top 让它相对于原来位置进行偏移
```html
<div class=”first_element”>First element</div>
<div class=”second_element”>Second element</div>
.first_element {
  position: relative;
  left: 30px;
  top: 70px;
  width: 500px;
  background-color: #fafafa;
  border: solid 3px #ff7347;
  font-size: 24px;
  text-align: center;
}
.second_element {
   position: relative;
   width: 500px;
   background-color: #fafafa;
   border: solid 3px #ff7347;
   font-size: 24px;
   text-align: center;
}
```
![Pasted image 20240919143203.png](/img/user/Pasted%20image%2020240919143203.png)
ID: 1726728003357

