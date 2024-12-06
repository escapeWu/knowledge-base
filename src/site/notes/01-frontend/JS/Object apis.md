---
{"dg-publish":true,"permalink":"/01-frontend/js/object-apis/","title":"常用object api","tags":["js","frontend"],"created":"2024-12-06T14:57:03.869+08:00","updated":"2024-12-06T15:39:53.768+08:00"}
---

#### ANKI-Object.keys 和 Object.getOwnPropertyNames 有何区别
`Object.keys()`只返回了可枚举的属性`property1`和`property2`，而`Object.getOwnPropertyNames()`返回了所有属性，包括不可枚举的
```js
const obj = {
  property1: "value1",
  property2: "value2",
};
//
Object.defineProperty(obj, "nonEnumerableProperty", {
  value: "value3",
  enumerable: false,
});
//
console.log(Object.keys(obj)); // ['property1', 'property2']
console.log(Object.getOwnPropertyNames(obj)); // ['property1', 'property2', 'nonEnumerableProperty']
```
ID: 1733470793690
