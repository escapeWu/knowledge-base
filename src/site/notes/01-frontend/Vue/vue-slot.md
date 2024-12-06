---
{"dg-publish":true,"permalink":"/01-frontend/vue/vue-slot/","title":"vue slot","tags":["vue","frontend"],"created":"2024-11-22T10:22:11.419+08:00","updated":"2024-12-04T13:06:41.112+08:00"}
---

#### ANKI-vue slot 的类型
具名插槽
![Pasted image 20241030141526.png](/img/user/attachments/Pasted%20image%2020241030141526.png)
```html
// child
<div class="container">
  <header>
    <slot name="header"></slot>
  </header>
  <main>
    <slot></slot>
  </main>
  <footer>
    <slot name="footer"></slot>
  </footer>
</div>
// parent
<BaseLayout>
// 压缩写法-->
  <template #header>
    <h1>Here might be a page title</h1>
  </template>
// 默认插槽,可以直接不写，或者使用 template #default 
    <p>A paragraph for the main content.</p>
    <p>And another one.</p>
  // 具名插槽
  <template v-slot:footer>
    <p>Here's some contact info</p>
  </template>
</BaseLayout>
```
条件插槽：
有时你需要根据插槽是否存在来渲染某些内容。
```html
<template>
  <div class="card">
    <div v-if="$slots.header" class="card-header">
      <slot name="header" />
    </div>
    <div v-if="$slots.default" class="card-content">
      <slot />
    </div>
    <div v-if="$slots.footer" class="card-footer">
      <slot name="footer" />
    </div>
  </div>
</template>
```
作用域插槽
允许父组件访问子组件的部分数据。向传递props一样，向一个插槽的出口上传递 attributes
```jsx
-------------child-------------
// <MyComponent> 
<div>
  <slot :text="greetingMessage" :count="1"></slot>
</div>
-------------parent-------------
<MyComponent v-slot="slotProps">
  {{ slotProps.text }} {{ slotProps.count }}
</MyComponent>
```
![Pasted image 20241030142317.png](/img/user/attachments/Pasted%20image%2020241030142317.png)
ID: 1733288801020

