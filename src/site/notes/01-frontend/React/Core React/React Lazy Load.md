---
{"dg-publish":true,"permalink":"/01-frontend/react/core-react/react-lazy-load/","title":"如何在react中做懒加载","tags":["react","frontend"],"created":"2024-11-25T16:09:12.386+08:00","updated":"2024-12-02T14:59:00.957+08:00"}
---

#### ANKI-如何在React中实现组件懒加载
React 16.6 之后，React 提供了 `React.lazy` 方法来支持组件的懒加载。配合 webpack 的 code-splitting 特性，可以实现按需加载。
```jsx
import React, { Suspense } from 'react';
//
const OtherComponent = React.lazy(() => import('./OtherComponent'));
//
function MyComponent() {
  return (
    <div>
      <Suspense fallback={<div>Loading...</div>}>
        <OtherComponent />
      </Suspense>
    </div>
  );
}
```
==Suspense的作用？==
Suspense 内部主要通过捕获组件的状态去判断如何加载，React.lazy 创建的动态加载组件具有 `Pending、Resolved、Rejected` 三种状态，当这个组件的状态为 Pending 时显示的是 Suspense 中 fallback 的内容，只有状态变为 resolve 后才显示组件。
ID: 1732525982380


