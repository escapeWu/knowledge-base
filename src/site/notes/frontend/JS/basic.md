---
{"dg-publish":true,"permalink":"/frontend/js/basic/","created":"2024-02-29T10:19:09.961+08:00","updated":"2024-02-29T11:18:43.352+08:00"}
---

#### 原始值与引用值的定义？
==原始值(primitive value)就是最简单的数据==,
==引用值(referencevalue)是保存在内存中的对象==。JavaScript不论许直接访问内存位置,因此也就不能直接操作对象所在的内存空间。在操作对象时,实际上操作的是对该对象的引用(reference)而非实际的对象本身。为此,保存引用值的变量是按引用(byreference)访问的。
<!--ID: 1709174096553-->


#### 执行上下文是什么 context？
执行上下文主要有全局上下文和函数上下文==。变量或者函数的上下文决定了它们能访问哪些数据，以及它们的行为。==
每个上下文都关联了一个变量对象，上下文中定义的所有变量和函数都存在这个对象上。
**全局上下文**：是最外层的上下文，根据js的宿主环境不同，表示全局上下文的对象也不一样。比如在浏览器中，全局上下文就是windows对象
**函数上下文**：当代码执行流进入函数时，函数上下文被推到一个上下文栈中，函数执行完后，上下文栈会弹出这个函数上下文。
上下文在其所有代码执行完毕后会被销毁，全局上下文在应用退出才会被销毁，比如关闭网页或者推出浏览器
<!--ID: 1709174096556-->


#### 详细说说函数上下文?
当代码执行流进入函数时，函数的上下文被推到一个上下文栈上，当执行完毕后，再从这个上下文栈中弹出，讲控制权交给执行上下文。上下文中的代码在执行的时候，会创建一个**作用域链（scope chain）**。以代码为例：
```js
function firstLevel() {
    const prop = 1;
    const a = 1;
    function secondLevel() {
        const prop = 2;
        const b = 2;
        function thirdLevel() {
            const prop = 3;
            const c = 3;
            console.log(a);
        }
    }
}
```
当我们代码执行到 thirdLevel 时候，创建的作用域链如下：
```js
context（third level）- context(second level) - context(first level)
```
<!--ID: 1709174096560-->

#### 什么是作用域链 scope chain？
1. 作用域链用于查询变量名对应的值, 作用域链决定了访问变量和函数时候的顺序。
2. 上下文中的代码在执行的时候，会创建变量对象的一个作用域链。
3. 查询变量名对应的值：搜索过程始终从作用域链的==最前端开始,然后逐级往后,直到找到标识符==。
<!--ID: 1709174096563-->


#### 什么是标记清理？
简单的说，它们找出所有不可达的对象，并将它们放入空闲列表Free。
清扫过程将分为标记阶段和清扫阶段。
-   标记阶段
    -   遍历所有对象找标记活动对象
-   清扫阶段 遍历所有对象清除没有标记对象，同时他会清除第一阶段所作的标记，便于之后可以进行正常的工作，
<!--ID: 1709174096566-->


#### 内存泄漏的场景有哪些？
1. 不适用任何关键字声明变量： 会自动挂载到window上
2. 不恰当的使用闭包，比如定时器
```js
let outer = function() {
	let name = 'Jake";
	return function() {
		return name;
	}
};
let res = outer()
```
只要返回函数res存在，垃圾回收机制就不能清理name，因为闭包一直在引他。
<!--ID: 1709174096570-->


#### var let const 区别？
var 是函数作用域，在函数内部声明var 变量不会污染全局。
```js
function test() {
	var message = "hi"
}
test()
consoel.log(message) // -> 报错
```
var存在hoisting 提升，使用该字段申明的变量会自动提升到函数的顶部
```js
function test() {
	console.log(message) // -> undefined 
	var message = 'h1'
	console.log(message) // -> 报错
}
```
如果在全局作用域使用var 声明变量，会自动挂在到window 对象上
```js
var message = '123'
console.log(window.message) // -> 123
```
let const 是块作用域。在for 循环中使用let/const 代替 var 可以==避免迭代变量渗透到循环体外部==
```js
for (var i=0; i<5; ++i) {
	setTimeout(() => console.log(i), 0)
}
// 5 5 5 5 5
```
上述代码的解释：
setTimeout函数是异步的，它将回调函数放在一个事件队列中，等待当前同步代码执行完毕后再执行。
for循环是同步的，对上述代码，当setTimeout开始执行，for循环已经结束，而var变量会渗透到循环体外部，此时的i 是5。因为闭包，setTimeout 能够获取到 外部的 i，所以结果为5
<!--ID: 1709174096575-->



#### **null 和 undefined 的区别？**
- undefined 介绍
  - undefined：当使用 var 或者 let 声明变量但没有初始化时，就相当于给变量赋予了 undefined 【红宝书】
  - **永远不要故意给某个变量设置为 undefined，undefined 主要用于比较**。
  - 增加 undefined 值的目的就是正式明确空对象指针（null）和未初始化变量的区别
- null 介绍
  - 从逻辑上讲，null 值表示一个空对象指针，所以`typeof null === object`
  - 在定义将来要保存对象值的变量时，建议使用 null 来初始化。
<!--ID: 1709174096579-->

#### constructor
https://zeekat.nl/articles/constructors-considered-mildly-confusing.html#sec-8-3
