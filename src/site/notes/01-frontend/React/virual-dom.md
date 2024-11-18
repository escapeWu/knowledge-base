---
{"dg-publish":true,"permalink":"/01-frontend/react/virual-dom/","title":"关于 virtual-dom的知识点","created":"2024-11-11T11:12:32.594+08:00","updated":"2024-11-11T13:49:51.730+08:00"}
---

#### ANKI-在React中，当使用数组表示元素的时候，Key 属性有什么用？
key 可以帮助React 识别 元素的增删改。元素的key需要保证唯一，不能使用index作为key，因为当增加或删除元素，他们对应的key会发生改变。从而导致React 会重新渲染对应的元素
ID: 1731304191644


#### ANKI-React中什么是虚拟DOM
虚拟DOM 是 真实DOM的抽象，它保存在内存中，并且和 DOM 同步。Render 函数消费state并生成 虚拟DOM。
ID: 1731304191647


#### ANKI-虚拟DOM是如何工作的？
1）当数据（model）发生变化，触发render，生成新的virtual DOM![Pasted image 20241111131639.png](/img/user/attachments/Pasted%20image%2020241111131639.png)
2）虚拟 DOM 树会与上次渲染时的虚拟 DOM 树进行比较，这个过程叫做 **diffing**（差异化对比）
3）通过比较得出哪些部分有变化后，框架会生成一个“补丁（patch）”来表示需要修改的 DOM 元素。只更新变化的部分而不是整个 DOM，可以显著提高性能。
ID: 1731304191649


#### ANKI-shdow DOM 和 Virtual DOM 的区别是什么？
[shadow DOM](https://juejin.cn/post/7137112423613333541) 是一种浏览器技术，主要用于在 Web 组件中作用域化变量和 CSS。虚拟 DOM 是一个概念，由 JavaScript 库在浏览器 API 上实现。
ID: 1731304191650
