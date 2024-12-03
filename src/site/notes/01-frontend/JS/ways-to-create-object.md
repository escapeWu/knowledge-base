---
{"dg-publish":true,"permalink":"/01-frontend/js/ways-to-create-object/","title":"JS创建对象的方式有哪些？","tags":["js","frontend"],"created":"2024-11-11T14:14:58.893+08:00","updated":"2024-12-02T14:56:23.244+08:00"}
---

#### ANKI-JS创建对象的方式有哪些？
**1）对象字面语法：**
```js
var object = {
     name: "Sudheer",
     age: 34
};
```
**2）对象构造函数：**
这种做法不推荐使用
```js
var object = new Object();
// 由于Object 是内置的构造函数，所有new不需要写
var object = Object();
```
**3）Object create 方法：**
Object.create 接受指定的原型对象和属性作为入参，当我们想要基于已有对象创建新的对象，这个模式很有用。
如下代码创建了个原型链为空的对象
```js
var object = Object.create(null)
```
如下代码，基于已有的对象和属性，创建了新的对象：
```js
let vehicle = {
  wheels: '4',
  fuelType: 'Gasoline',
  color: 'Green'
}
let carProps = {
  type: {
    value: 'Volkswagen'
  },
  model: {
    value: 'Golf'
  }
}
// 
var car = Object.create(vehicle, carProps);
console.log(car);
```
**4）构造函数方式**：
```js
function Person(name) {
  this.name = name;
  this.age = 21;
}
var object = new Person("Sudheer");
// 或者
function Person() {}
Person.prototype.name = "Sudheer";
var object = new Person();
```
**5）object.assign 方法：**
将一个或多个对象的所有属性复制到目标对象身上并返回。
```js
const orgObject = { company: 'XYZ Corp'};
const carObject = { name: 'Toyota'};
const staff = Object.assign({}, orgObject, carObject);
```
**6）ES6 class 语法糖**
```js
class Person {
  constructor(name) {
    this.name = name;
  }
}
var object = new Person("Sudheer");
```
ID: 1731306345651


