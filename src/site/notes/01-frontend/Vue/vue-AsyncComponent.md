---
{"dg-publish":true,"permalink":"/01-frontend/vue/vue-async-component/","title":"vue AsyncComponent","tags":["vue","frontend"],"created":"2024-11-19T10:14:51.715+08:00","updated":"2024-12-02T15:05:36.856+08:00"}
---

#### ANKI-AsyncComponent用法
在大型项目中，我们可能需要拆分应用为更小的块，并仅在需要时再从服务器加载相关组件。Vue 提供了 [`defineAsyncComponent`](https://cn.vuejs.org/api/general.html#defineasynccomponent) 方法来实现此功能：
```js
const AsyncComp = defineAsyncComponent({
  // 加载函数
  loader: () => import('./Foo.vue'),
  // 加载异步组件时使用的组件
  loadingComponent: LoadingComponent,
  // 展示加载组件前的延迟时间，默认为 200ms
  delay: 200,
  // 加载失败后展示的组件
  errorComponent: ErrorComponent,
  // 如果提供了一个 timeout 时间限制，并超时了
  // 也会显示这里配置的报错组件，默认值是：Infinity
  timeout: 3000
})
```
当使用基于Vue的服务端渲染框架时候，还支持自定义激活策略：
具体参考：[惰性激活 v3.5+](https://cn.vuejs.org/guide/components/async#lazy-hydration)
ID: 1731984080910
