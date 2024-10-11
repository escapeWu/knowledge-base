---
{"dg-publish":true,"permalink":"/01-frontend/js/new-underhood/","title":"如何实现一个new操作符","created":"2024-09-19T15:43:12.796+08:00","updated":"2024-09-19T16:08:36.317+08:00"}
---

#### ANKI-如何实现一个new操作符
new操作符的具体执行流程：
1. 创建一个空对象
2. 将这个新对象的`__proto__`属性指向构造函数的`prototype`对象
3. ==将构造函数中的this 绑定到新创建的对象上，并执行构造函数中的代码==
4. 如果构造函数返回了一个对象，那么new表达式最终会返回这个对象。否则，返回新创建的对象
```js
function myNew(constructor, ...args) {
	let obj = {}
	obj.__proto__ = constructor.prototype
	let result = constructor.apply(obj, args)
	return typeof result == "object" && result != null ? result : obj
}
```
例如：
```js
funciton Person(name) {
	this.name = name
}
let person = myNew(Person, "alice")
console.log(person.name) // -> alice
```
ID: 1726733316308
