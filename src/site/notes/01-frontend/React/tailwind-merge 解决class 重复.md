---
{"dg-publish":true,"permalink":"/01-frontend/react/tailwind-merge-class/","created":"2024-09-18T14:20:17.576+08:00","updated":"2024-05-29T23:33:13.000+08:00"}
---

#### ANKI-tailwind-merge 作用?
https://www.youtube.com/watch?v=tfgLd5ZSNPc&ab_channel=simonswiss
tailwind-merge：解决使用class，重复设置css 属性值问题
```html
<div class="rounded-lg rounted-full bg-red bg-green" />
```
使用twMerge，同种属性的重复设置，后面的class优先级更高，会覆盖前面的。
```jsx
import { twMerge } from 'tailwind-merge'
<div className={twMerge("rounded-lg rounted-full bg-red bg-green")} />
// → 'rounted-full bg-green'
```
更多详细语法：
[tailwind-merge docs feature](https://github.com/dcastil/tailwind-merge/blob/v2.3.0/docs/features.md)
ID: 1716996349464

