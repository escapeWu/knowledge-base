---
{"dg-publish":true,"permalink":"/frontend/js/basic/","created":"2024-05-29T23:33:13.000+08:00","updated":"2024-05-30T15:17:30.598+08:00"}
---

2
#### ANKI-原始值与引用值的定义？
==原始值(primitive value)就是最简单的数据==,
==引用值(referencevalue)是保存在堆heap中对象==。JavaScript不论许直接访问内存位置,因此也就不能直接操作对象所在的内存空间。在操作对象时,实际上操作的是对该对象的引用(reference)而非实际的对象本身。为此,保存引用值的变量是按引用(byreference)访问的。
ID: 1716996349475




#### ANKI-js 原始值 和 引用值 哪个存储在 堆 哪个存储在栈中？为什么要区分堆和栈?
在JavaScript中，==原始值（Primitive values）存储在栈（Stack）==中，而==引用值（Reference values）通常存储在堆（Heap）==中。这种存储方式与它们的大小和特性有关。
**原始值包括**：undefined、null、布尔值（true 和 false）、数字（Number）、字符串（String）、和符号（Symbol）。这些值通常比较小，可以直接存储在栈中，因为栈有助于快速访问变量和函数调用的上下文，但空间有限。
**引用值包括**：对象（Object）、数组（Array）、函数（Function）等。这些值可能很大或大小不固定，存储在堆中，因为堆是一个更大的内存区域，用来存储复杂的结构和大量数据。在栈中存储的是指向这些复杂结构在堆中的位置的指针（或引用）。
**堆和栈区别**：
1. **性能**：栈内存的分配和释放非常快，因为它是连续的，而且是由系统自动管理的，而堆内存的分配和释放相对较慢，因为它是动态分配的，需要进行垃圾回收等额外的操作。
2. **数据类型**：原始值在传递时是按值传递的，即复制一份值传递给函数或赋值给其他变量；而引用值在传递时是按引用传递的，即传递的是对象在堆内存中的地址
3. **作用域**：==栈内存的作用域仅限于当前函数的执行上下文==，函数执行完毕就会自动释放栈内存，而==堆内存可以被多个执行上下文共享==，直到没有引用指向它时才会被垃圾回收。
ID: 1716996349477





#### ANKI-执行上下文是什么 context？
执行上下文（Execution Context）是 JavaScript 中的一个抽象概念，它描述了代码被执行时的环境。每当 JavaScript 代码被执行时，都会创建一个执行上下文，并且在代码执行完毕后被销毁。
执行上下文可以分为三种类型：
1. **全局执行上下文（Global Execution Context）**：在代码执行之前，会首先创建全局执行上下文。全局执行上下文是整个 JavaScript 程序的最顶层的执行上下文，它会在页面加载时创建，直到页面关闭时销毁。全局执行上下文中包含了全局对象（例如在浏览器环境中是 `window` 对象）、全局变量和函数等信息。
2. **函数执行上下文（Function Execution Context）**：每当函数被调用时，都会创建一个新的函数执行上下文。函数执行上下文与函数调用相关联，它包含了函数的参数、局部变量、内部函数声明等信息。当函数执行完毕后，其执行上下文会被销毁。
3. ==**评估/调用栈执行上下文（Eval/Call Stack Execution Context）**==：在 JavaScript 引擎内部，存在一个称为调用栈（Call Stack）的数据结构，用于管理当前正在执行的执行上下文。当函数被调用时，其执行上下文会被推入调用栈；当函数执行完毕后，其执行上下文会从调用栈中弹出。
执行上下文由三个重要的组件构成：
- **变量对象（Variable Object）**：包含了函数的参数、内部变量和函数声明等信息。
- **作用域链（Scope Chain）**：用于解析变量标识符的一种机制。它由当前执行上下文的变量对象和所有包含（父级）执行上下文的变量对象组成的链式结构。
- **this 指向**：指向当前执行上下文所属的对象。
```js
var globalVariable = 'I am global'; // 全局变量
function outerFunction() {
  var outerVariable = 'I am outer'; // 外部函数的局部变量
  function innerFunction() {
    var innerVariable = 'I am inner'; // 内部函数的局部变量
    console.log(globalVariable); // 访问全局变量
    console.log(outerVariable); // 访问外部函数的局部变量
    console.log(innerVariable); // 访问内部函数的局部变量
  } 
  innerFunction(); // 调用内部函数
}
outerFunction(); // 调用外部函数
```
在上面的代码中，我们有一个外部函数 `outerFunction` 和一个内部函数 `innerFunction`。当我们调用 `outerFunction()` 时，会创建一个新的函数执行上下文，即外部函数的执行上下文。然后，在外部函数的执行上下文中调用 `innerFunction()`，又会创建一个新的函数执行上下文，即内部函数的执行上下文。这些执行上下文会被推入调用栈（Call Stack）中。
```
innerFunction Execution Context
outerFunction Execution Context
Global Execution Context
```
在调用栈中，我们当前正在执行 `innerFunction` 的执行上下文。在该上下文中，我们可以访问到内部函数的局部变量 `innerVariable` 和外部函数的局部变量 `outerVariable`。当 `innerFunction` 执行完毕后，它的执行上下文会从调用栈中弹出。然后，外部函数 `outerFunction` 的执行上下文变为当前执行上下文，直到它也执行完毕并从调用栈中弹出。最后，全局执行上下文变为当前执行上下文，直到程序结束
ID: 1716996349480







#### ANKI-什么是标记清理？
简单的说，它们找出所有不可达的对象，并将它们放入空闲列表Free。
清扫过程将分为标记阶段和清扫阶段。
-   标记阶段
    -   遍历所有对象找标记活动对象
-   清扫阶段 遍历所有对象清除没有标记对象，同时他会清除第一阶段所作的标记，便于之后可以进行正常的工作，
ID: 1716996349482





#### 内存泄漏的场景有哪些？
[[frontend/JS/basic\|basic]]
1. **未正确清除事件监听器**：如果在 DOM 元素上添加了事件监听器，但在元素被删除之前未移除，这可能导致内存泄漏。
2. **循环引用**：如果对象之间存在相互引用，并且其中一个对象是不再需要的，但由于引用仍然存在，垃圾回收器无法将其清除。
3. **定时器未被清除**：在使用 `setTimeout()` 或 `setInterval()` 创建定时器时，如果不及时清除，定时器可能会继续运行，引用相关的闭包，导致内存泄漏。
4. **闭包**：在闭包中引用了外部作用域的变量，如果闭包长期存在，可能会导致外部作用域的变量无法被垃圾回收器清除，从而造成内存泄漏。
5. **未使用的全局变量**：如果在全局范围内创建了变量，但从未使用过或者不再需要，这些变量会一直占用内存，直到页面关闭。
6. **DOM 元素未正确移除**：在使用 JavaScript 动态创建 DOM 元素时，如果没有正确地将这些元素从 DOM 树中移除，它们会一直存在于内存中，无法被垃圾回收器清除。
```js
var objA = {};
var objB = {};
objA.ref = objB;
objB.ref = objA;
如果没有外部引用这两个对象，那么它们将被认为是不再需要的。但是，由于它们相互引用，垃圾回收器无法检测到它们的引用计数降为零，因此它们将一直占用内存，从而导致内存泄漏
```



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


#### **null 和 undefined 的区别？**
undefined 介绍
  - undefined：当使用 var 或者 let 声明变量但没有初始化时，就相当于给变量赋予了 undefined 【红宝书】
  - **永远不要故意给某个变量设置为 undefined，undefined 主要用于比较**。
  - 增加 undefined 值的目的就是正式明确空对象指针（null）和未初始化变量的区别
  null 介绍
  - 从逻辑上讲，null 值表示一个空对象指针，所以`typeof null === object`
  - 在定义将来要保存对象值的变量时，建议使用 null 来初始化。


