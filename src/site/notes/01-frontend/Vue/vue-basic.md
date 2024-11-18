---
{"dg-publish":true,"permalink":"/01-frontend/vue/vue-basic/","title":"vue基础问题","created":"2024-10-30T15:22:44.000+08:00","updated":"2024-11-11T10:38:47.265+08:00"}
---

#### ANKI-Vue template 标签的作用
+ 提供了占位功能和充当组件插槽填充的功能
+ 在vue2中template不管什么情况都会在最后生成虚拟dom时去除
+ 在vue3中如果template上不存在vue指令v-if、v-for等等那么templlate会被当作一个html标签渲染到页面上
ID: 1730965091991

#### ANKI-mvvm 的具体解释
- **Model（模型）**：Model 层包含应用的数据和业务逻辑，通常通过 Vue 的 `data` 属性和 Vuex（全局状态管理库）来管理。Model 是应用的核心数据，包含用户信息、状态和业务逻辑。Vue会根据 Model 的变化自动更新 View。    
- **View（视图）**：View 是用户界面（UI），即用户在浏览器中看到的内容。在 Vue 中，View 主要通过模板 (template) 或渲染函数来定义，Vue 根据模板和绑定的数据自动生成 HTML。
- **ViewModel（视图模型）**：ViewModel 是连接 Model 和 View 的桥梁，负责双向数据绑定。在 Vue 中，ViewModel 由 Vue 实例（即 `new Vue()`）充当。ViewModel 通过数据绑定和事件监听实现 Model 和 View 的同步更新，
ID: 1730965091995

#### ANKI-VueRouter 获取路由参数的方式
1. 动态路由匹配： `/user/:id` 通过 $route.params获取
2. url查询参数: /user?id=123 通过 `$route.query`获取
3. vue3 通过 `useRoute` 可以访问 $route 对象
ID: 1730965091996

#### ANKI-Vue-cloak 的作用
当我们的从上倒下运行的代码比较慢的时候，js可能卡住，这样的话，在界面上会显示胡子语法{{message}},在js运行通畅的时候才会加载出来数据。
v-cloak 可以隐藏这部分元素
```js
使用setTimeout模拟
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Title</title>
</head>
<body>
<div id="app">
  <h2>{{message}}</h2>
</div>
<script src="../vue.js"></script>
<script>
  setTimeout(function (){
    const app = new Vue({
      el:"#app",
      data:{
        message:"hello world"
      }
    })
  },2000)
</script>
</body>
</html>
```
![20241030135815_rec_-convert.gif](/img/user/attachments/20241030135815_rec_-convert.gif)
#### ANKI-vue-pre
带有这个指令的标签，会跳过编译过程，直接显示为模板那内容
```html
<div v-pre>
  {{ rawMustache }}  <!-- 这里的内容将会直接输出为 {{ rawMustache }} 而不是进行数据绑定 -->
</div>
```

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
<!--压缩写法-->
  <template #header>
    <h1>Here might be a page title</h1>
  </template>
  <!-- 默认插槽,可以直接不写，或者使用 template #default -->
    <p>A paragraph for the main content.</p>
    <p>And another one.</p>
  <!--具名插槽 -->
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
```html
-------------child-------------
<!-- <MyComponent> 的模板 -->
<div>
  <slot :text="greetingMessage" :count="1"></slot>
</div>
-------------parent-------------
<MyComponent v-slot="slotProps">
  {{ slotProps.text }} {{ slotProps.count }}
</MyComponent>
```
![Pasted image 20241030142317.png](/img/user/attachments/Pasted%20image%2020241030142317.png)
#### vue 自定义指令的使用方式
自定义指令可以通过Vue指令钩子函数实现,主要的钩子函数有以下几种:
1. bind: 指令绑定到元素时调用,只会执行一次。
2. inserted: 绑定元素插入父节点时调用。
3. update: 所在组件的VNode更新时调用,不一定发生在子VNode更新之前。
4. componentUpdated: 指令所在组件的VNode及其子VNode全部更新后调用
5. unbind: 指令与元素解绑时调用,只会执行一次。
自动聚焦输入框的指令
```js
Vue.directive('focus', {
  // 当绑定元素插入到 DOM 中。
  inserted: function (el) {
    // 聚焦元素
    el.focus()
  }
})
<input v-focus>
```
#### ANKI-在vue中，如果变量以 `_` 或 `$`开头会有什么问题？如何访问呢
在Vue中,如果变量名以 或`$`开头,这些变量会被Vue框架认为为是保留属性,不会作为数据代理到Vue实例上,不会出现在`this.$data`对象中。所以,直接通过 this.variableName无法访问这些变量。
为了访问这些变量,可以通过`this.$data._variableName`或`this.$data.$variableName`的形式访问到这些值。
ID: 1730965091997

#### ANKI-为什么Vue中给对象添加新属性，界面没有刷新
Vue2 中 Object.defineProperty 这种方式，无法监听新属性的添加。
[[01-frontend/Vue/vue2-reactive\|vue2-reactive]]
Vue3中通过Proxy api实现，可以监听新属性的添加，不会有这个问题
[[01-frontend/Vue/vue3-reactive\|vue3-reactive]]
ID: 1730965091998


#### ANKI-Nginx-Vue-History-404
我们的服务器是根据页面路由,去按路径寻找资源的。我们打包好的web站点只有一个html页面口,不存在其他资源目录下的html,服务器找不到对应页面所以才报404。
try_files $uri $uri/ /index.html;
1. 首先检查 $uri 指向的文件或资源是否存在。
2. 如果不存在，则检查 $uri/（即带斜杠的目录路径）是否存在。
3. 如果两者都不存在，则返回 /index.html。
ID: 1730965091999

#### ANKI-TODO-Vue Diff

#### ANKI-Vue中有哪些表单修饰符和事件修饰符
在Vue中,表单修饰符和事件修饰符是用来简化和增强事件处理的。
常见的表单修饰符有.lazy、.number和.trim,而常见的事件修饰符则有.stop、.prevent、.capture、self、.once和.passive 。
事件修饰符具体说明：
+ `.stop`: 会调用event.stopPropagation 来阻止事件冒泡
+ `.prevent`：会调用 event.preventDefault 阻止默认行为
+ `.capture`：将事件监听器绑定到捕获阶段
+ `.self`： 只在事件从绑定元素本身触发时才触发回调
+ `.once`：只会触发一次
+ `.passive`：告诉浏览器不应该阻止默认行为
ID: 1730965092000
