---
{"dg-publish":true,"permalink":"/01-frontend/html-and-css/css-flex/","title":"flex 基础使用","tags":["css","frontend","flex"],"created":"2024-10-23T10:20:48.000+08:00","updated":"2024-12-06T14:40:52.228+08:00"}
---

#### ANKI-flex-grow flex-shrink flex basis 是什么？
```css
/* flex */
.red{
  flex-grow: 1;
  flex-shrink: 1;
  flex-basis: 100px; /* 每个项目的初始宽度为200px */
}
.blue{
  flex-grow: 2;
  flex-shrink: 2;
  flex-basis: 100px; /* 每个项目的初始宽度为100px */
}
```
![Pasted image 20241012133847.png](/img/user/attachments/Pasted%20image%2020241012133847.png)
blue 和 red 的初始宽度(通过`flex-basis`设置)都是100px
+ 对于宽度足够的情况下，触发`flex-grow` ，red1：blue2，blue拉伸是red的2倍
+ 对于宽度不够的情况下，触发 `flex-shrink`，red1: blue2, blue收缩是red的2倍
ID: 1729650048011

#### ANKI-flex:1是什么意思
flex：1 是 `flex: 1 1 0` 的缩写
+ `flex-grow: 1`：元素可以根据剩余空间进行扩展。
+ `flex-shrink: 1`：元素在空间不足时可以缩小。
+ `flex-basis: 0`：元素的基础尺寸为0,==剩余空间会根据 flex-grow属性进行分配==。
ID: 1729650048013


#### ANKI-flex 布局 align-items 和 align-content 的使用区别
- `align-items`：
    - 适用于单行的 Flex 布局，或者即使容器有多行，但只需要统一控制所有项目的对齐方式时。
    - 比如，创建一个简单的导航栏，其中的项目在垂直方向上需要保持一致的对齐方式。
- `align-content`：
    - 适用于多行的 Flex 布局，且需要对多行进行整体的对齐控制。
    - 例如，一个包含大量卡片的网格布局，当卡片数量较多导致出现多行时，可以使用`align-content`来调整行与行之间在垂直方向上的间距和对齐方式。
实际示例参考：[flex 布局 - align-items](https://juejin.cn/post/7004622232378966046#heading-6)
ID: 1733467252191
