---
{"dg-publish":true,"permalink":"/01-frontend/ts/ts-object-key-value-subtype/","title":"ts中使用typeof keyof 实现获取某一个对象的所有key value作为类型","tags":["typescript","Generics"],"created":"2024-07-03T16:24:15.837+08:00","updated":"2024-09-21T23:59:29.038+08:00"}
---

#### ANKI-ts中使用typeof keyof 实现获取某一个对象的所有key value
假设我们有一个字典对象：
```ts
const GNSS = {  
  GPS: "G",  
  BDS: "C",  
  GALILEO: "E",  
  GLONASS: "R"  
} as const // as const 可以让gnss 的key不会变成string
```
[typeof](https://www.typescriptlang.org/docs/handbook/2/typeof-types.html)： 引用变量或属性的类型
keyof: 输入对象类型 输出其key的 string | number  集合
```typescript
// gnssKeyType: `"BDS" | "GLONASS" | "GALILEO" | "GPS"`
gnssKeyType: keyof [typeof GNSS]
// gnssValueType:  `"C" | "R" | "E" | "G"`
gnssValueType:  typeof GNSS[keyof typeof GNSS]
// gnssValueType 可以使用泛型来优化：
type ValueOf<T> = T[keyof T];
type GnssValueType = ValueOf<typeof GNSS>
```
case2：将GNSS 输出为 select  options 对象数组，要求 label 和 value 均具备类型推断
```typescript
// 卫星系统  
const GNSS = {  
  GPS: "G",  
  BDS: "C",  
  GALILEO: "E",  
  GLONASS: "R"  
} as const
//
const dictToOptions = <K extends string, T>(obj: Record<K, T>): { label: K, value: T }[] =>  
    Object.keys(obj).map(key => ({  
      label: key as K,  
      value: obj[key as K]  
    }));
```
说明:
+ `<K extends string, T>` 定义了两个泛型
+ `(obj: Record<K, T>)`: 为泛型赋值，表示obj是一个键为 `K` 类型，值为 `T` 类型的对象
ID: 1719995018101
