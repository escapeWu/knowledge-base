---
{"dg-publish":true,"permalink":"/01-frontend/js/basic/","title":"JS 基础","tags":["js","basic"],"created":"2024-10-25T11:28:42.000+08:00","updated":"2024-12-06T14:57:02.252+08:00"}
---



#### ANKI-isNaN 和 Number.isNaN 的区别
isNaN会做隐式转换，尝试转换成数字，Number.isNaN 不会，比如
```js
console.log(isNaN('hello'));//---> isNaN(NaN) ---> true 
console.log(Number.isNaN('hello'));// ---> true
```
ID: 1731994038439

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
**执行上下文类型**：
1. **全局执行上下文（Global Execution Context）**：默认的执行上下文。在浏览器环境中，全局对象是`window`, 在Nodejs环境下，全局对象是`global`
2. **函数执行上下文（Function Execution Context）**：每次调用函数，都会创建。每个函数调用都有自己的上下文，并且可以嵌套
3. ==**eval执行上下文（Eval/Call Stack Execution Context）**==：eval 函数引发，很少使用。
**执行上下文的组件：**
- **变量对象（Variable Object, VO）**：包含了函数的形参、内部变量和函数声明。对于函数上下文来说，它被称为活动对象( Activation Object, AO)
- **作用域链（Scope Chain）**：用于解析变量,  包含当前上下文的变量对象，以及所有父级（词法）上下文的变量对象。
- **this 指向**：不同的执行上下文中 this 的值不同。在全局上下文中，this指向全局对象；在函数上下文中，this的值取决于函数的调用方式。
**执行上下文的生命周期**
+ 创建阶段：
	+ 创建变量对象：包括函数参数，函数声明，变量声明
	+ 创建作用域链：形成一个作用域链，并且与其当前执行上下文关联
	+ 确定this的值：根据调用位置，确定当前上下文的this值
+ 执行阶段
	+ 变量分配：变量赋值和函数引用开始执行
	+ 执行代码：根据代码逻辑逐行执行，完成整个执行过程
ID: 1716996349480







#### ANKI-什么是标记清理？
简单的说，它们找出所有不可达的对象，并将它们放入空闲列表Free。
清扫过程将分为标记阶段和清扫阶段。
-   标记阶段
    -   遍历所有对象找标记活动对象
-   清扫阶段 遍历所有对象清除没有标记对象，同时他会清除第一阶段所作的标记，便于之后可以进行正常的工作，
ID: 1716996349482





#### 内存泄漏的场景有哪些？
[[01-frontend/JS/basic\|01-frontend/JS/basic]]
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


#### ANKI-&&操作符
1.对第一个操作数进行条件判断。
2.如果第一个操作数的条件判断结果为false,则返回第一个个操作数的值。
3.如果第一个操作数的条件判断结果为true,则返回第二个操作数的值。
```js
0 && 1 --> 0
'' && 1 --> ''
1 && 0 --> 0
1 && '' -> ''
```
ID: 1729763764384


#### ANKI-Object.is 和 === 的区别是什么？
+ Object.is：-0 和 +0不相等，两个NaN相等
+ `===`: -0 和 +0 相等，NaN不相等 
ID: 1733288801027


#### ANKI-+0和-0的区别
**除法操作**：
- `1 / +0` 会返回 `Infinity`（正无穷大）。
- `1 / -0` 会返回 `-Infinity`（负无穷大）。
Math.sign:
```js
Math.sign(+0); // 返回 0
Math.sign(-0); // 返回 -0
```
ID: 1729763764388

#### ANKI-BigInt 的使用场景？
js 最大安全整数是 `2^53-1` ，再大会丢失精度，所以推荐在值大于 2^53-1 的情况，再使用BigInt 类型，并且不在这两种类型间互相转换
BigInt的使用方式：
`const bigInt1 = 123456789012345678901234567890n`
ID: 1729763764390

#### ANKI-Object.assign 和 对象扩展运算符`...`的区别是什么
Object.assign和对象扩展运算符`...`都是执行浅拷贝,即只复制对象的第一层属性,不会递归复制整个对象结构。对于需要深拷贝的情况,需要要额外的处理逻辑来实现。
ID: 1729826922042


#### ANKI-什么是javaScript的类数组对象？如何转换为数组？
类数组：具备 `length` 和 按索引存储的元素，比如
```js
const arrayLike = {'0': 'a', '1': 'b', '2': 'c'}
```
将类数组转换为数组
+ Array.from
+ 扩展运算符 `...`
ID: 1729826922043


#### ANKI-什么是暂时性死区（Temporal Dead Zone）
使用let const 声明的变量，在申明之前就尝试访问，会抛出错误。
```js
function somemethod() {
  console.log(counter1); // undefined
  console.log(counter2); // ReferenceError
  var counter1 = 1;
  let counter2 = 2;
}
```
ID: 1731994038440


#### ANKI-什么是立即执行函数（IIFE，immediately invoked Function Expression）

IIFE最核心的作用是**创建一个立即执行的独立作用域**，从而避免全局变量污染、封装逻辑、保护私有数据。现代开发中，ES Module / CommonJS 存在减少了其使用频率。
```js
(function() {
    var localVar = "I am local";
    console.log(localVar); // 输出 "I am local"
})();
console.log(typeof localVar); // 输出 "undefined"
```
ID: 1731994038441

#### ANKI-如何比较两个date对象是否相同
使用getTime，new Date().getTime() 返回的是自 **1970 年 1 月 1 日 00:00:00 UTC**（也称为 UNIX 时间纪元）以来的毫秒数。
```js
var d1 = new Date();
var d2 = new Date(d1);
console.log(d1.getTime() === d2.getTime()); //True
console.log(d1 === d2); // False
```
ID: 1732527140431

#### ANKI-介绍下performance.now()函数
高精度时间戳，以毫秒为单位，从页面创建开始计数。常用于函数性能监控
```js
let start = performance.now()
// logic code
console.log(performance.now() - start)
```
除了performance.now 还有 console.start()，console.end() 可以实现相同效果，但console的方式精度比performace差
ID: 1732527140436


#### ANKI-Corejs 和 Polyfill的关系
**CoreJs 是 Polyfill 的一种实现方式**：Polyfill 是一个术语，用于描述一段代码，它提供了浏览器中缺失的功能。CoreJs 可以看作是一种全面的 Polyfill 库。当浏览器不支持某个 JavaScript 特性时，CoreJs 可以通过添加相应的代码来模拟该特性，就像填充了浏览器功能的空缺一样。例如，对于`Object.assign`方法，如果浏览器不支持，CoreJs 可以提供一个自定义的函数来实现相同的功能，这个自定义函数就是一种 Polyfill。
ID: 1732591282597


