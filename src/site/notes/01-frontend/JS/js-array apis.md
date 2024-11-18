---
{"dg-publish":true,"permalink":"/01-frontend/js/js-array-apis/","title":"js 数组api整理","created":"2024-11-11T14:26:04.309+08:00","updated":"2024-11-13T14:58:20.806+08:00"}
---

#### ANKI-介绍下数组的splice api
splice() 方法用于向数组添加/删除项，并返回被删除的项。第一个参数指定插入或删除的数组位置/索引，而可选的第二个参数指示要删除的元素数量。每个额外的参数都会被添加到数组中。
```js
let arrayIntegersOriginal1 = [1, 2, 3, 4, 5];
let arrayIntegersOriginal2 = [1, 2, 3, 4, 5];
let arrayIntegersOriginal3 = [1, 2, 3, 4, 5];
// 
let arrayIntegers1 = arrayIntegersOriginal1.splice(0, 2); // returns [1, 2]; original array: [3, 4, 5]
let arrayIntegers2 = arrayIntegersOriginal2.splice(3); // returns [4, 5]; original array: [1, 2, 3]
let arrayIntegers3 = arrayIntegersOriginal3.splice(3, 1, "a", "b", "c"); //returns [4]; original array: [1, 2, 3, "a", "b", "c", 5]
```
splice 原地修改，并返回被删除的元素
ID: 1731480918190

#### ANKI-Object 和 Map的区别是什么？
在 JavaScript 中，Object 和 Map 都是用于存储键值对的数据结构，但它们有一些关键区别：
1. 键的类型
	•	Object：键只能是字符串或 Symbol 类型。虽然可以用其他类型作为键，但 JavaScript 会隐式地将它们转换为字符串。
	•	Map：键可以是任意类型，比如对象、数字、字符串等。这意味着 Map 更适合用来存储复杂的数据结构作为键。
2. 键值对的顺序
	•	Object：没有明确的插入顺序。虽然现代 JavaScript 引擎会按对象属性的添加顺序返回键，但它没有被官方标准严格定义，行为可能因实现而异。
	•	Map：保留键值对的插入顺序，可以按照添加顺序来迭代。
3. 性能
	•	Object：当用作哈希表时，由于 Object 的结构和特性，其性能可能不如 Map 高效，尤其在频繁的增删操作中。
	•	Map：专为键值对操作优化，在频繁的增删查找操作中，性能往往优于 Object。
4. 原型链
	•	Object：具有原型链，可能会继承一些默认的属性和方法（如 toString）。这可能会导致在处理对象属性时产生意外行为，需要使用 hasOwnProperty 来检查是否是对象自身的属性。
	•	Map：没有原型链问题，因为 Map 不会继承默认属性，因此 Map 上的键值对是独立的，不会受到原型链的干扰。
5. 大小
	•	Object：没有直接的属性来获取键值对的数量，需要手动计算（例如使用 Object.keys(obj).length）。
	•	Map：有一个 size 属性，可以直接获取 Map 中的键值对数量。
6. 使用场景
	•	Object：适用于结构化数据（如 JSON 格式的数据）和简单的键值存储，特别是当键都是字符串时。
	•	Map：适用于需要任意类型作为键的场景，或当数据量较大、增删查找频繁时，更推荐使用 Map。
ID: 1731481100786
