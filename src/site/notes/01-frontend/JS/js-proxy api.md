---
{"dg-publish":true,"permalink":"/01-frontend/js/js-proxy-api/","title":"proxy api相关知识","tags":["js","frontend"],"created":"2024-11-26T10:52:01.566+08:00","updated":"2024-12-02T14:55:54.456+08:00"}
---

#### ANKI-proxy set 拦截器有哪些可设置的参数？
+ target参数：
	+ 被代理的目标对象。这个对象是原始的、即将被操作的对象
+ property参数：
	+ 要设置的属性名。obj.==property== = value
+ value参数：
	+ 要设置给属性的新值。obj.property = ==value==
+ receiver参数（可选）：
	+ 操作发生的对象，在大多数简单的情况下，它和`proxy`对象本身（即被用来设置属性的代理对象）是相同的
	+ 在一些复杂的继承或者代理链场景下，它可以帮助确定真正接收操作的对象。
```js
let targetObj = { name: "John" };
let handler = {
  set(target, property, value, receiver) {
	console.log(`接收者是${receiver}`);
	target[property] = value;
	return true;
  },
};
let proxyObj = new Proxy(targetObj, handler);
let anotherObj = Object.create(proxyObj);
anotherObj.age = 30;
```
在这个例子中，当通过`anotherObj`（它继承自`proxyObj`）来设置属性`age`时，`receiver`参数将指向`anotherObj`
ID: 1732590256537


#### ANKI-proxy 如何拦截数组变化？
对于数组元素的读取和设置操作，可以通过`get`和`set`拦截器来实现。
**数组下标的读写操作**
	get 拦截数组的读取操作：
```js
	let array = [1, 2, 3];
	let proxyArray = new Proxy(array, {
	  get(target, property, receiver) {
	    console.log(`正在读取数组元素${property}`);
	    return target[property];
	  },
	});
	let element = proxyArray[1];
```
	set 拦截数组的设置操作：
```js
	let array = [1, 2, 3];
	let proxyArray = new Proxy(array, {
	  set(target, property, value, receiver) {
	    if (value < 0) {
	      throw new Error("数组元素不能小于0");
	    }
	    target[property] = value;
	    return true;
	  },
	});
	proxyArray[0] = -1;
```
**拦截数组的方法调用**，通过`Proxy`的`apply`拦截器来拦截这些方法的调用。以push方法为例
```js
let array = [1, 2, 3];
let proxyArray = new Proxy(array, {
  apply(target, thisArg, argumentsList) {
    if (target.push === argumentsList[0]) {
      console.log("正在调用数组的push方法");
    }
    return target.apply(thisArg, argumentsList);
  },
});
proxyArray.push(4);
```
ID: 1732591282595

