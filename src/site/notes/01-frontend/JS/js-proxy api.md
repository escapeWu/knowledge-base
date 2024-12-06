---
{"dg-publish":true,"permalink":"/01-frontend/js/js-proxy-api/","title":"proxy reflect api相关知识","tags":["js","frontend"],"created":"2024-11-26T10:52:01.566+08:00","updated":"2024-12-04T13:58:23.330+08:00"}
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


#### ANKI-创建一个只读对象，只能通过 指定的方法去修改属性
```js
// 实现 createObject 函数， 用例如下；
// 比如：
const obj = createObject({ name: "name" });
obj.name = "name2"; // 错误， 禁止修改；
obj.set("name", "name2"); // 正确方式， 允许修改；
obj.set("address.info", "chongqing"); // 正确方式， 允许添加属性。
```
思路：
+ 拦截set，返回false，对所有 `obj.xxx = yyy`拦截
+ 拦截get，对 `set`属性特殊处理，返回函数，通过get触发修改
```js
function createObject(initialData) {
    const data = initialData;
    return new Proxy(data, {
      set(target, property, value, receiver) {
        console.error('ERROR: read only', property, value)
        return false;
      },
      get(target, property, receiver) {
        if (property === 'set') {
          return function (key, value) {
            const keys = key.split('.');
            let obj = target;
            for (let i = 0; i < keys.length - 1; i++) {
              obj = obj[keys[i]] || (obj[keys[i]] = {});
            }
            obj[keys[keys.length - 1]] = value;
          };
        } else {
          return target[property];
        }
      },
    });
}
//
// 有效设置
obj.set('address.info', 'chongqing');
console.log(obj.address.info); // 'chongqing'
// 无效设置
obj.name = 'name2'; // 不会生效，禁止直接修改属性
console.log(obj.name); // 'name'
```
ID: 1733288801024

#### ANKI-reflect的应用场景？
reflect 可以实现正确转发this。
有如下场景，当前代码中 cat.name 返回 "动物" 而不是 "猫"：
```js
let animal = {
  _name: "动物",
  get name() {
      return this._name;
  }
};
let animalProxy = new Proxy(animal, {
  get(target, prop) {
      return target[prop];
  }
});
let cat = {
  __proto__: animalProxy,
  _name: "猫"
};
// 期望输出：猫
console.log(cat.name); // 输出：动物
```
+ cat.name：首先在cat 对象上查找name，没找到，沿原型链向上查找
+ `原型链 __proto__` 找到 animalProxy，animalProxy 是一个代理，它会拦截 get 操作
+ 在代理的 get 处理器中，this 指向的是原始对象 animal，而不是 cat
解决方案：
```js
// ... existing code ...
let animalProxy = new Proxy(animal, {
    get(target, prop, receiver) {
        return Reflect.get(target, prop, receiver);
    }
});
// ... existing code ...
```
Reflect.get() 会保持正确的 this 绑定，确保 getter 在执行时的 this 指向实际调用的对象（在这个场景中是 cat），而不是原始的 animal 对象
ID: 1733291891140

