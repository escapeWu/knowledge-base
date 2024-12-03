---
{"dg-publish":true,"permalink":"/01-frontend/js/event-capture-and-event-bubbling/","title":"关于事件代理的知识","tags":["js","frontend"],"created":"2024-11-08T13:37:08.255+08:00","updated":"2024-12-02T14:55:17.978+08:00"}
---

#### ANKI-什么是事件代理？
事件代理利用事件冒泡或事件捕获的机制把一系列的内层元素事件绑定到外层元素。==这意味着子元素本身不用注册自己的事件==
有一个列表，列表项需要绑定事件。
![Pasted image 20241108134935.png](/img/user/attachments/Pasted%20image%2020241108134935.png)
像这样，是不是就需要注册9个事件？上图只有9个，如果这个列表有1万行。难道我们就需要去注册1万个事件吗？
优化：
把事件注册到父元素上，不论我们有多少个列表，都只需要在父元素上注册一个事件
![Pasted image 20241108135037.png](/img/user/attachments/Pasted%20image%2020241108135037.png)
ID: 1731291082792

#### ANKI-如何阻止事件冒泡/捕获
在函数体中写 event.stopPropagation()即可阻止冒泡或捕获
ID: 1731291082793

#### ANKI-什么是事件冒泡？什么是事件捕获？
事件冒泡就是：当一个元素触发事件时，该事件会从触发事件的目标元素开始向上传递，经过目标元素的父级元素，直到达到根节点（通常是 document 或 window 对象）。
当元素被触发事件时候，从该元素的根节点开始逐级向下传递到目标元素，最终在触发事件的元素上处理。
ID: 1731291082794

#### ANKI-绑定事件的元素节点销毁又重新创建,绑定的事件还会生效吗？
如果将事件绑定在 `body` 上，然后移除了这个 `body` 标签并重新创建一个 `body` 标签，之前绑定在旧 `body` 上的事件不会生效在新的 `body` 上。
将事件绑定到一个特定的 DOM 元素上时，这个绑定是针对特定的实例。一旦该元素被移除，与之相关的事件处理程序也会与该元素一起被销毁。
ID: 1732590243196


#### ANKI-把事件委托绑定在body上，如何针对性触发不同的子元素？
1. event.target 对象判断
```js
	document.body.addEventListener("click", function (event) {
	  const target = event.target;
	  if (target.classList.contains("button1")) {
	    // 处理按钮 1 的点击事件
	  } else if (target.classList.contains("button2")) {
	    // 处理按钮 2 的点击事件
	  }
	});
```
2. 设置 `data-*` 属性
```jsx
<button data-action="action1">Button 1</button> 
<button data-action="action2">Button 2</button>
// js body
document.body.addEventListener("click", function (event) {
  const target = event.target;
  if (target.dataset.action === "action1") {
    // 处理按钮 1 的点击事件
  } else if (target.dataset.action === "action2") {
    // 处理按钮 2 的点击事件
  }
});
```
ID: 1732590243197

